package com.digitalconeptions.www;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.api.socket.SocketServicePb;
import com.google.appengine.api.users.User;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.LoadType;
import com.googlecode.objectify.cmd.Query;

import javax.jws.soap.SOAPBinding;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by stevenliao on 4/28/16.
 */
public class SaveCanvasServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(getClass().getName());
        String isNew = req.getParameter("new");

        ComicInfo currentComic;
        if (!Boolean.parseBoolean(isNew)) {
            String seriesTitle = req.getParameter("series_title");
            String issueTitle = req.getParameter("issue_title");
            String volume = req.getParameter("volume");
            String issue = req.getParameter("issue");

            currentComic
                    = ObjectifyService.ofy().load().type(ComicInfo.class)
                    .filter("seriesTitle", seriesTitle)
                    .filter("issueTitle", issueTitle)
                    .filter("volume", Integer.parseInt(volume))
                    .filter("issue", Integer.parseInt(issue)).first().now();

            HttpSession session = req.getSession();
            currentComic.lock(((User)session.getAttribute("user")).getNickname());
            ObjectifyService.ofy().save().entity(currentComic).now();
            req.setAttribute("current_comic", currentComic);
        }

        System.out.println(getClass().getName());
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        String create = blobstoreService.createUploadUrl("/create");

        req.setAttribute("create", create);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/canvas.jsp");
        rd.forward(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(getClass().getName() + " POST");
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
        ImagesService imagesService = ImagesServiceFactory.getImagesService();

        HttpSession now = req.getSession();
        String username = ((User)now.getAttribute("user")).getNickname();
        resp.setContentType("text/plain");


        List<BlobKey> blobKeys = new ArrayList();// = blobs.get("image");
        List<String> JSON = new ArrayList<>();
        for (int i = 0; i < blobs.size(); i++){
            blobKeys.add(blobs.get("image_"+i).get(0));
            JSON.add(req.getParameter("json_" + i));
        }

        List<String> urls = new ArrayList<>();

        for (BlobKey key : blobKeys){
            urls.add(imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(key)));
        }

        String seriesTitle = req.getParameter("series_title");
        String issueTitle = req.getParameter("issue_title");
        String volume = req.getParameter("volume");
        String issue = req.getParameter("issue");
//        String genre = req.getParameter("genre");
//        String description = req.getParameter("description");

        Query<ComicInfo> query = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter(Constants.seriesTitle, seriesTitle)
                .filter(Constants.issueTitle, issueTitle)
                .filter(Constants.volume, Integer.parseInt(volume))
                .filter(Constants.issue, Integer.parseInt(issue));
        SeriesInfo seriesInfo = ObjectifyService.ofy().load().type(SeriesInfo.class)
                .filter(Constants.seriesTitle, seriesTitle).first().now();
        LoadType<UserInfo> usersLoad = ObjectifyService.ofy().load().type(UserInfo.class);
        ComicInfo comic = query.first().now();


        if (req.getParameter("unlock") != null){
            comic.unlock();
            ObjectifyService.ofy().save().entity(comic).now();
        }
        else if (req.getParameter("remove") != null){
            ObjectifyService.ofy().delete().entity(comic);
            for (String user : comic.collaborators){
                UserInfo userInfo = usersLoad.filter(Constants.username, user).first().now();
                userInfo.removeComicCollab(comic.getComicName());
                ObjectifyService.ofy().save().entity(userInfo).now();
            }

            for (String user : seriesInfo.getSubscribedUsers()){
                UserInfo userInfo = usersLoad.filter(Constants.username, user).first().now();

                userInfo.addUnreadNotification(
                        "Subscriptions||" + new Date().toString() + "||" + comic.getUsername()
                                + " has deleted their comic " + comic.seriesTitle + " " + comic.issueTitle
                                + "||" + new SimpleDateFormat("E MM/dd/yyyy HH:mm:ss")
                                .format(new Date()));

                ObjectifyService.ofy().save().entity(userInfo).now();
            }
        }
        else {
            String nseriesTitle = req.getParameter("new_series_title");
            String nissueTitle = req.getParameter("new_issue_title");
            int nvolume = Integer.parseInt(req.getParameter("new_volume"));
            int nissue = Integer.parseInt(req.getParameter("new_issue"));
            String ngenre = req.getParameter("new_genre");
            String ndescription = req.getParameter("new_description");

            UserInfo currentUserInfo = ObjectifyService.ofy().load().type(UserInfo.class).filter("username", username).first().now();



            if (query.list().size() < 1) {
                ComicInfo newComic = new ComicInfo(username, nseriesTitle, nissueTitle, ngenre, ndescription,
                        nvolume, nissue, blobKeys, urls, true);
                newComic.setKey();
                newComic.setJson(JSON);

                currentUserInfo.addCreation(newComic.getComicName());
                Constants.subscriptionNotifications(newComic, seriesTitle, " created a new comic ");

                ObjectifyService.ofy().save().entity(newComic).now();
                ObjectifyService.ofy().save().entity(currentUserInfo).now();

                if (req.getParameter("new_collaborators") != null)
                    Constants.manageCollaborators(req, usersLoad, newComic);


            } else {
                ComicInfo currentComic = query.list().get(0);

                currentComic.setSeriesTitle(nseriesTitle);
                currentComic.setIssueTitle(nissueTitle);
                currentComic.setVolume(nvolume);
                currentComic.setIssue(nissue);
                currentComic.setGenre(ngenre);
                currentComic.setDescription(ndescription);
                currentComic.setJson(JSON);
                currentComic.setUrls(urls);

                currentComic.unlock();
                ObjectifyService.ofy().save().entity(currentComic).now();

                Constants.subscriptionNotifications(currentComic, seriesTitle, " updated their comic ");
                System.out.println(req.getParameter("new_collaborators"));
                if (req.getParameter("new_collaborators") != null)
                    Constants.manageCollaborators(req, usersLoad, currentComic);
            }
            resp.getWriter().write(nseriesTitle + "," + nissueTitle + "," + nvolume + "," + nissue);

//            ServletContext sc = getServletContext();
//            RequestDispatcher rd = sc.getRequestDispatcher("/upload.jsp");
//            rd.forward(req, resp);
        }
    }

}


