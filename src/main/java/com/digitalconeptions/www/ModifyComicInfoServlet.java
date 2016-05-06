package com.digitalconeptions.www;

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

/**
 * Created by stevenliao on 5/5/16.
 */
public class ModifyComicInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String seriesTitle = req.getParameter("series_title");
        String issueTitle = req.getParameter("issue_title");
        int volume = Integer.parseInt(req.getParameter("volume"));
        int issue = Integer.parseInt(req.getParameter("issue"));

        HttpSession session = req.getSession();
        String username = ((User) session.getAttribute("user")).getNickname();

        ComicInfo currentComic
                = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle", seriesTitle)
                .filter("issueTitle", issueTitle)
                .filter("volume", volume)
                .filter("issue", issue).first().now();

        req.setAttribute("current_comic", currentComic);
        req.setAttribute("username", username);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/modify_comic_info.jsp");
        rd.forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String seriesTitle = (String) req.getParameter("series_title");
        String issueTitle = req.getParameter("issue_title");
        String volume = req.getParameter("volume");
        String issue = req.getParameter("issue");
        String genre = req.getParameter("genre");
        String description = req.getParameter("description");

        HttpSession session = req.getSession();
        String username = ((User) session.getAttribute("user")).getNickname();

        ComicInfo currentComic
                = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle", seriesTitle)
                .filter("issueTitle", issueTitle)
                .filter("volume", volume)
                .filter("issue", issue).first().now();

        currentComic.seriesTitle = seriesTitle;
        currentComic.issueTitle = issueTitle;
        currentComic.volume = Integer.parseInt(volume);
        currentComic.issue = Integer.parseInt(issue);
        currentComic.genre = genre;
        currentComic.description = description;

        ObjectifyService.ofy().save().entity(currentComic).now();

        req.setAttribute("current_comic", currentComic);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/comic_cover.jsp");
        rd.forward(req, resp);
    }

}
