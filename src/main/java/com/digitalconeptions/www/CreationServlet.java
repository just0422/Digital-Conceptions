package com.digitalconeptions.www;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.blobstore.BlobstoreServicePb;
import com.google.appengine.api.users.User;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.LoadType;
import com.googlecode.objectify.cmd.Query;
import com.googlecode.objectify.impl.Session;

/**
 * Created by justin on 4/12/16.
 */
public class CreationServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println(getClass().getName());
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        String upload = blobstoreService.createUploadUrl("/upload");


        req.setAttribute("upload", upload);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/upload.jsp");
        rd.forward(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println(getClass().getName());
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);


        List<BlobKey> blobKeys = blobs.get("upload");

        String seriesTitle = req.getParameter("series_title");
        String comicTitle = req.getParameter("issue_title");
        String volume = req.getParameter("volume");
        String issue = req.getParameter("issue");
        String genre = req.getParameter("genre");
        String description = req.getParameter("description");

        LoadType<ComicInfo> load = ObjectifyService.ofy().load().type(ComicInfo.class);
        Query<ComicInfo> query = load;
        if (seriesTitle != null) query = query.filter("seriesTitle", seriesTitle);
            else seriesTitle = "";
        if (comicTitle != null) query = query.filter("comicTitle", comicTitle);
            else comicTitle = "";
        if (comicTitle != null) query = query.filter("volume", volume);
            else volume = "1";
        if (comicTitle != null) query = query.filter("issue", issue);
            else issue = "1";


        // GET CURRENT UserInfo EITHER BY DATASTORE OR BY SESSION
        // PUT IN USER VARIABLE
        if (query.list().size() < 1){
            HttpSession now = req.getSession();
            String username = ((User)now.getAttribute("user")).getNickname();
            ComicInfo newComic = new ComicInfo(username, seriesTitle, comicTitle, genre, description,
                    Integer.parseInt(volume), Integer.parseInt(issue), blobKeys);

            ObjectifyService.ofy().save().entity(newComic).now();
            // CURRENT USER ADD NEW COMIC TO USERINFO
            // ADD NEW COMIC TO DATASTORE


        }
        else{
            // RETURN FALSE
        }


//                .filter("seriesTitle", seriesTitle)
//                .filter("comicTitle", comicTitle)
//                .filter("volume", volume)
//                .filter("issue", issue).first().now();


        // Once you get the keys, they can be put into the comic info object
    }
}