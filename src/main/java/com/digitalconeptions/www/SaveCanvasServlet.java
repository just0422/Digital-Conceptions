package com.digitalconeptions.www;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.blobstore.BlobstoreServicePb;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.api.users.User;
import com.googlecode.objectify.LoadResult;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.LoadType;
import com.googlecode.objectify.cmd.Query;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by stevenliao on 4/28/16.
 */
public class SaveCanvasServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(getClass().getName());
        String isNew = req.getParameter("new");
        System.out.println(isNew);
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


        if (req.getParameter("remove") != null){
            ObjectifyService.ofy().delete().entity(query.first().now());
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

                ObjectifyService.ofy().save().entity(newComic).now();
                ObjectifyService.ofy().save().entity(currentUserInfo).now();

            } else {
                ComicInfo currentComic = query.list().get(0);
                // TODO Update first comic on the list
//            resp.getWriter().write("Unsuccessful");
                currentComic.setSeriesTitle(nseriesTitle);
                currentComic.setIssueTitle(nissueTitle);
                currentComic.setVolume(nvolume);
                currentComic.setIssue(nissue);
                currentComic.setGenre(ngenre);
                currentComic.setDescription(ndescription);
                currentComic.setJson(JSON);
                currentComic.setUrls(urls);
                ObjectifyService.ofy().save().entity(currentComic).now();
            }
            resp.getWriter().write(nseriesTitle + "," + nissueTitle + "," + nvolume + "," + nissue);

            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/upload.jsp");
            rd.forward(req, resp);
        }
    }

}
