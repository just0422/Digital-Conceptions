package com.digitalconeptions.www;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by justin on 4/11/16.
 */
public class ComicServlet extends HttpServlet {
    /*
        TODO
            If no parameters are set, get random comic
     */

    // Front end splits comments based on delimiters
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // Attributes should be set in request
        String seriesTitle = req.getParameter("series_title");
        String comicTitle = req.getParameter("comic_title");
        int volume = Integer.parseInt(req.getParameter("volume"));
        int issue = Integer.parseInt(req.getParameter("issue"));

//        ComicInfo obj = new ComicInfo();
//        String obj.comicTitle;
//        String obj.seriesTitle;
//        Integer obj.volume;
//        Integer obj.issue;
        ComicInfo currentcomic = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle", seriesTitle)
                .filter("comicTitle", comicTitle)
                .filter("volume", volume)
                .filter("issue", issue).first().now();

        req.setAttribute("comic", currentcomic);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/comic_cover.jsp");
        rd.forward(req, resp);
    }

    // Post request attributes
    //  Change Rating   // FOR USER AND COMIC
    //  Submit comments // FOR COMIC
    //  Finished reading (save chapter) // FOR USER
    //  Subscription // FOR USER

    // Comic attribute should be set for each request
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        ComicInfo comic = (ComicInfo)req.getAttribute("comic");
//        UserService userService = UserServiceFactory.getUserService();
//        User user = userService.getCurrentUser();
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");

        // Rating
        // Average in rating for comic
        // Add user rating to hash table

        // Comments
        // Concatenate EPOCH date to comment using ! as delimiter

        // Finished reading
        // Set userinfo pageleftoff hashmap based off of <ComicInfo, int page>

        // Subscription
        // Add to user info subscriptionlist

        ObjectifyService.ofy().save().entity(comic).now();
    }

}
