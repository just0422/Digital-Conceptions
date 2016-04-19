package com.digitalconeptions.www;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

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
        System.out.println(getClass().getName() + " GET");
        // Attributes should be set in request
        String seriesTitle = req.getParameter("series_title");
        String issueTitle = req.getParameter("issue_title");
        int volume = Integer.parseInt(req.getParameter("volume"));
        int issue = Integer.parseInt(req.getParameter("issue"));

//        ComicInfo obj = new ComicInfo();
//        String obj.issueTitle;
//        String obj.seriesTitle;
//        Integer obj.volume;
//        Integer obj.issue;
        ComicInfo currentComic
                = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle", seriesTitle)
                .filter("issueTitle", issueTitle)
                .filter("volume", volume)
                .filter("issue", issue).first().now();

        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        String subscribed = "Subscribe";
        String start = "Start";
        // TODO

        if (user != null)
        {
            // Check if user is already subscribed

            // If subscribed, change string to "Unsubscribe"
            subscribed = "Unsubscribe";

            // Check if user already started comic

            // If started, change string to "Resume"
            start = "Resume";
        }

        req.setAttribute("current_comic", currentComic);
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
        System.out.println(getClass().getName() + " POST");
        String name = req.getParameter("comic_name");
        String comic[] = name.split("\\|");

        ComicInfo currentcomic
                = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle", comic[0])
                .filter("issueTitle", comic[2])
                .filter("volume", Integer.parseInt(comic[1]))
                .filter("issue", Integer.parseInt(comic[3])).first().now();

//        String comment = (String) req.getAttribute("comment");
//        UserService userService = UserServiceFactory.getUserService();
//        User user = userService.getCurrentUser();
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        UserInfo userinfo = ObjectifyService.ofy().load().type(UserInfo.class).filter("username", user.getNickname()).first().now();
//        UserInfo userInfo = (UserInfo) session.getAttribute("user_info");

        if (req.getParameter("rating") != null) {
            currentcomic.addRate(user.getNickname(), Integer.parseInt(req.getParameter("rating")));
            resp.getWriter().write("" + currentcomic.rating);
        }

        if (req.getParameter("comment") != null){
            Comment comment = new Comment(user.getNickname(), req.getParameter("comment"));
            String date = currentcomic.addComment(user.getNickname(), req.getParameter("comment"));

            userinfo.addUnreadNotification( comment.getUser() + " commented '" + comment.getComment() + "' on your Comic: "
                    + currentcomic.getIssueTitle() + " " + currentcomic.getIssue());

//            resp.setContentType("application/json");

//            resp.getWriter().println();
            resp.setContentType("text/plain");
//            resp.getWriter().println("HI");
            resp.getWriter().println("{");
            resp.getWriter().println("\"user\": \"" + user.getNickname() + "\",");
            resp.getWriter().println("\"comment\": \""+ req.getParameter("comment") + "\",");
            resp.getWriter().println("\"date\": \"" + date + "\"");
            resp.getWriter().println("}");
////            out.close();
//
//            System.out.println("COMMENT");
////            System.out.println(out.toString());
//            System.out.println(resp.getWriter().toString());
//            System.out.println(resp.toString());
        }
        ObjectifyService.ofy().save().entity(currentcomic).now();
        ObjectifyService.ofy().save().entity(userinfo).now();


        // Finished reading
        // Set userinfo pageleftoff hashmap based off of <ComicInfo, int page>

        // Subscription
        // Add to user info subscriptionlist

//        ObjectifyService.ofy().save().entity(comic).now();
    }

}
