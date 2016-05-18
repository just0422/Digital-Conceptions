package com.digitalconeptions.www;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.api.users.User;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.LoadType;

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
 * Created by justin on 4/26/16.
 */
public class EditImagesServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String seriesTitle = req.getParameter("series_title");
        String issueTitle = req.getParameter("issue_title");
        int volume = Integer.parseInt(req.getParameter("volume"));
        int issue = Integer.parseInt(req.getParameter("issue"));

        ComicInfo currentComic
                = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle", seriesTitle)
                .filter("issueTitle", issueTitle)
                .filter("volume", volume)
                .filter("issue", issue).first().now();

        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        String edit = blobstoreService.createUploadUrl("/editimages");

        HttpSession session = req.getSession();
        currentComic.lock(((User)session.getAttribute("user")).getNickname());

        req.setAttribute("edit", edit);
        req.setAttribute("current_comic", currentComic);
        ObjectifyService.ofy().save().entity(currentComic).now();

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/comic_pages_preview.jsp");
        rd.forward(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println(getClass().getName() + " POST");
        String seriesTitle = req.getParameter("series_title");
        String issueTitle = req.getParameter("issue_title");
        System.out.println(req.getParameter(Constants.series_title));
        int volume = Integer.parseInt(req.getParameter("volume"));
        int issue = Integer.parseInt(req.getParameter("issue"));

        ComicInfo currentComic
                = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle", seriesTitle)
                .filter("issueTitle", issueTitle)
                .filter("volume", volume)
                .filter("issue", issue).first().now();
        SeriesInfo seriesInfo = ObjectifyService.ofy().load().type(SeriesInfo.class)
                .filter(Constants.seriesTitle, seriesTitle).first().now();
        LoadType<UserInfo> usersLoad = ObjectifyService.ofy().load().type(UserInfo.class);

        if (req.getParameter("unlock") != null){
            currentComic.unlock();
            ObjectifyService.ofy().save().entity(currentComic).now();
        }
        else if (req.getParameter("remove") != null){
            ObjectifyService.ofy().delete().entity(currentComic);
            for (String user : currentComic.collaborators){
                UserInfo userInfo = usersLoad.filter(Constants.username, user).first().now();
                userInfo.removeComicCollab(currentComic.getComicName());
                ObjectifyService.ofy().save().entity(userInfo).now();
            }

            for (String user : seriesInfo.getSubscribedUsers()){
                UserInfo userInfo = usersLoad.filter(Constants.username, user).first().now();

                userInfo.addUnreadNotification(
                        "Subscriptions||" + new Date().toString() + "||" + currentComic.getUsername()
                                + " has deleted their comic " + currentComic.seriesTitle + " " + currentComic.issueTitle
                                + "||" + new SimpleDateFormat("E MM/dd/yyyy HH:mm:ss")
                                .format(new Date()));
                ObjectifyService.ofy().save().entity(userInfo).now();
            }
        }
        else {
            if (req.getParameter("uploads") != null) {
                BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
                Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
                ImagesService imagesService = ImagesServiceFactory.getImagesService();

                List<BlobKey> blobKeys = blobs.get("uploads");

                for (BlobKey key : blobKeys) {
                    currentComic.urls.add(imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(key)));
                }

            } else {
                List<String> images = Arrays.asList(req.getParameter("images").split(","));
                currentComic.setUrls(images);

                resp.getWriter().write("1");
            }
            if (req.getParameter("new_collaborators").length() > 0) {
                Constants.manageCollaborators(req, usersLoad, currentComic);
            }


            currentComic.setSeriesTitle(req.getParameter("new_series_title"));
            currentComic.setIssueTitle(req.getParameter("new_issue_title"));
            currentComic.setVolume(Integer.parseInt(req.getParameter("new_volume")));
            currentComic.setIssue(Integer.parseInt(req.getParameter("new_issue")));
            currentComic.setDescription(req.getParameter("new_description"));
            currentComic.setGenre(req.getParameter("new_genre"));

            Constants.subscriptionNotifications(currentComic, seriesTitle, " updated their comic ");
            currentComic.unlock();

            ObjectifyService.ofy().save().entity(currentComic).now();
        }
    }
}