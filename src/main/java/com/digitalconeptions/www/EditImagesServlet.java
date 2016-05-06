package com.digitalconeptions.www;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.api.users.User;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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

        req.setAttribute("edit", edit);
        req.setAttribute("current_comic", currentComic);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/comic_pages_preview.jsp");
        rd.forward(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        if (req.getParameter("uploaded_files") != null){
            System.out.println("HERE");
        }
        else
            System.out.println("UGHHHH");
        String seriesTitle = req.getParameter("series_title");
        String issueTitle = req.getParameter("issue_title");
        int volume = Integer.parseInt(req.getParameter("volume"));
        int issue = Integer.parseInt(req.getParameter("issue"));
//        resp.setContentType("text/plain");

        ComicInfo currentComic
                = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle", seriesTitle)
                .filter("issueTitle", issueTitle)
                .filter("volume", volume)
                .filter("issue", issue).first().now();

        if (req.getParameter("uploads") != null){
            BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
            Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
            ImagesService imagesService = ImagesServiceFactory.getImagesService();

            List<BlobKey> blobKeys = blobs.get("uploads");

            for (BlobKey key : blobKeys){
                currentComic.urls.add(imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(key)));
            }

        }
        else {
            List<String> images = Arrays.asList(req.getParameter("images").split(","));
            currentComic.setUrls(images);

            resp.getWriter().write("1");
        }

        currentComic.setSeriesTitle(req.getParameter("new_series_title"));
        currentComic.setIssueTitle(req.getParameter("new_issue_title"));
        currentComic.setVolume(Integer.parseInt(req.getParameter("new_volume")));
        currentComic.setIssue(Integer.parseInt(req.getParameter("new_issue")));

        ObjectifyService.ofy().save().entity(currentComic).now();
    }
}