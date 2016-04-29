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
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        String create = blobstoreService.createUploadUrl("/create");

        req.setAttribute("create", create);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/canvas.jsp");
        rd.forward(req, resp);
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(getClass().getName());
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
        ImagesService imagesService = ImagesServiceFactory.getImagesService();

        HttpSession now = req.getSession();
        String username = ((User)now.getAttribute("user")).getNickname();
        resp.setContentType("text/plain");

        List<BlobKey> blobKeys = blobs.get("canvas_image");
        List<String> urls = new ArrayList<>();

        for (BlobKey key : blobKeys){
            urls.add(imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(key)));
        }

        String json = req.getParameter("canvas_JSON");
        String seriesTitle = req.getParameter("series_title");
        String issueTitle = req.getParameter("issue_title");
        String volume = req.getParameter("volume");
        String issue = req.getParameter("issue");
        String genre = req.getParameter("genre");
        String description = req.getParameter("description");

        LoadType<ComicInfo> load = ObjectifyService.ofy().load().type(ComicInfo.class);
        Query<ComicInfo> query = load;
        if (seriesTitle != null) query = query.filter("seriesTitle", seriesTitle);
        else seriesTitle = "";
        if (issueTitle != null) query = query.filter("issueTitle", issueTitle);
        else issueTitle = "";
        if (issueTitle != null) query = query.filter("volume", volume);
        else volume = "1";
        if (issueTitle != null) query = query.filter("issue", issue);
        else issue = "1";


        UserInfo currentUserInfo = ObjectifyService.ofy().load().type(UserInfo.class).filter("username", username).first().now();
        if (query.list().size() < 1){
            ComicInfo newComic = new ComicInfo(username, seriesTitle, issueTitle, genre, description,
                    Integer.parseInt(volume), Integer.parseInt(issue), blobKeys, urls, true);
            newComic.setKey();
            newComic.setJson(json);

            currentUserInfo.addCreation(newComic.getComicName());

            ObjectifyService.ofy().save().entity(newComic).now();
            ObjectifyService.ofy().save().entity(currentUserInfo).now();
            resp.getWriter().write(seriesTitle + "," + issueTitle + "," + volume + "," + issue);
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/canvas.jsp");
            rd.forward(req, resp);
        }
        else{
            resp.getWriter().write("Unsuccessful");
        }

    }

}
