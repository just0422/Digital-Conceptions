package com.digitalconeptions.www;

import com.google.appengine.api.blobstore.*;
import com.google.appengine.api.socket.SocketServicePb;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.repackaged.com.google.io.protocol.HtmlFormGenerator;
import com.googlecode.objectify.Objectify;
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
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

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
        String seriesTitle = req.getParameter(Constants.series_title);
        String issueTitle = req.getParameter(Constants.issue_title);

        LoadType<ComicInfo> load = ObjectifyService.ofy().load().type(ComicInfo.class);
        Query<ComicInfo> sTitle = load.filter(Constants.seriesTitle, seriesTitle);
        List<ComicInfo> series = sTitle.list();

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        ServletContext sc = getServletContext();
        String nextPage = "/comic_cover.jsp";

        if (issueTitle == null){
            nextPage = "/series.jsp";
            req.setAttribute("series", series);
        }
        else {
            int volume = Integer.parseInt(req.getParameter(Constants.volume));
            int issue = Integer.parseInt(req.getParameter(Constants.issue));

            ComicInfo firstComic = sTitle.first().now();
            ComicInfo currentComic
                    = sTitle.filter(Constants.issueTitle, issueTitle)
                    .filter(Constants.volume, volume)
                    .filter(Constants.issue, issue)
                    .first().now();

            req.setAttribute("all", series);
            UserInfo userinfo = ObjectifyService.ofy().load().type(UserInfo.class).filter("username", user.getNickname()).first().now();

            req.setAttribute("subscription", userinfo.subscriptions.contains(firstComic.getSeriesTitle()) ? "unsubscribe" : "subscribe");
            req.setAttribute("current_comic", currentComic);
        }

        RequestDispatcher rd = sc.getRequestDispatcher(nextPage);
        req.setAttribute("user", user);
        rd.forward(req, resp);
    }

    //  Finished reading (save chapter) // FOR USER

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println(getClass().getName() + " POST");
        String name = req.getParameter("comic_name");
        String comic[] = name.split("\\|");

        String rating = req.getParameter("rating");
        String comment = req.getParameter("comment");
        String subscription = req.getParameter("subscription");
        String pages_left_off = req.getParameter("pages_left_off");

        ComicInfo currentcomic
                = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter(Constants.seriesTitle, comic[0])
                .filter(Constants.issueTitle, comic[2])
                .filter(Constants.volume, Integer.parseInt(comic[1]))
                .filter(Constants.issue, Integer.parseInt(comic[3])).first().now();

        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        UserInfo userinfo = ObjectifyService.ofy().load().type(UserInfo.class).filter("username", user.getNickname()).first().now();

        if (rating != null) {
            currentcomic.addRate(user.getNickname(), Integer.parseInt(req.getParameter("rating")));
            resp.getWriter().write("" + currentcomic.rating);
        }

        if (comment != null){
            String date = currentcomic.addComment(user.getNickname(), req.getParameter("comment"));

            userinfo.addUnreadNotification( user.getNickname() + " commented '" + req.getParameter("comment") + "' on your Comic: "
                    + currentcomic.getIssueTitle() + " " + currentcomic.getIssue());

            resp.setContentType("text/plain");
            resp.getWriter().println("{");
            resp.getWriter().println("\"user\": \"" + user.getNickname() + "\",");
            resp.getWriter().println("\"comment\": \""+ req.getParameter("comment") + "\",");
            resp.getWriter().println("\"date\": \"" + date + "\"");
            resp.getWriter().println("}");
        }

        if (pages_left_off != null){
            userinfo.removeComicPageLeftOff(currentcomic.getComicName());
            userinfo.addComicPageLeftOff(currentcomic.getComicName(), Integer.parseInt(req.getParameter("page_left_off")));
        }

        if (subscription != null) {
            // SUBSCRIBTIONS
            if (subscription.replaceAll("\\s+", "")
                    .equalsIgnoreCase("subscribe".replaceAll("\\s+", ""))) {
                UserInfo creator = ObjectifyService.ofy().load()
                        .type(UserInfo.class).filter("username", currentcomic.getUser()
                                .getNickname()).first().now();
                creator.addUnreadNotification(user.getNickname()
                        + " has subscribed to your comic " + "<a href=\"/comic?series_title="
                        + currentcomic.seriesTitle + "\">" + currentcomic.seriesTitle
                        + "</a>||" + new SimpleDateFormat("E MM/dd/yyyy HH:mm:ss")
                        .format(new Date()));
                ObjectifyService.ofy().save().entity(creator).now();
                ComicInfo firsttcomic
                        = ObjectifyService.ofy().load().type(ComicInfo.class)
                        .filter(Constants.seriesTitle, comic[0]).first().now();

                userinfo.subscribe(firsttcomic.getSeriesTitle());
                resp.setContentType("text/plain");
                resp.getWriter().println("unsubscribe");
            } else {
                ComicInfo firsttcomic
                        = ObjectifyService.ofy().load().type(ComicInfo.class)
                        .filter(Constants.seriesTitle, comic[0]).first().now();
                userinfo.unsubscribe(firsttcomic.getSeriesTitle());

                resp.setContentType("text/plain");
                resp.getWriter().println("subscribe");
            }
        }

        ObjectifyService.ofy().save().entity(currentcomic).now();
        ObjectifyService.ofy().save().entity(userinfo).now();


        // Finished reading
        // Set userinfo pageleftoff hashmap based off of <ComicInfo, int page>

        // Subscription
        // Add to user info subscriptionlist
    }

}
