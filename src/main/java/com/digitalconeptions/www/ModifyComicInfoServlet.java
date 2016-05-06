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
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/modify_comic_info.jsp");
        rd.forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String seriesTitle = req.getParameter("old_series_title");
        String issueTitle = req.getParameter("old_issue_title");
        int volume = Integer.parseInt(req.getParameter("old_volume"));
        int issue = Integer.parseInt(req.getParameter("old_issue"));
        String genre = req.getParameter("old_genre");
        String description = req.getParameter("old_description");

        HttpSession session = req.getSession();
        String username = ((User) session.getAttribute("user")).getNickname();

        ComicInfo currentComic
                = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle", seriesTitle)
                .filter("issueTitle", issueTitle)
                .filter("volume", volume)
                .filter("issue", issue).first().now();

        String newSeriesTitle = req.getParameter("new_series_title");
        String newIssueTitle = req.getParameter("new_issue_title");
        String newVolume = req.getParameter("new_volume");
        String newIssue = req.getParameter("new_issue");
        String newGenre = req.getParameter("new_genre");
        String newDescription = req.getParameter("new_description");

        currentComic.seriesTitle = newSeriesTitle;
        currentComic.issueTitle = newIssueTitle;
        currentComic.volume = Integer.parseInt(newVolume);
        currentComic.issue = Integer.parseInt(newIssue);
        currentComic.genre = newGenre;
        currentComic.description = newDescription;

        ObjectifyService.ofy().save().entity(currentComic).now();

        String[] seriesTitleParts = newSeriesTitle.split(" ");
        String[] issueTitleParts = newIssueTitle.split(" ");
        String url = "/comic?series_title=";
        for (int i = 0; i < seriesTitleParts.length; i++)
        {
            url += seriesTitleParts[i];
            if (i < seriesTitleParts.length - 1)
                url += "+";
        }
        url += "&issue_title=";
        for (int i = 0; i < issueTitleParts.length; i++)
        {
            url += issueTitleParts[i];
            if (i < issueTitleParts.length - 1)
                url += "+";
        }
        url += "&volume=" + newVolume + "&issue=" + newIssue;

        resp.sendRedirect(url);

//        req.setAttribute("current_comic", currentComic);
//        ServletContext sc = getServletContext();
//        RequestDispatcher rd = sc.getRequestDispatcher("/comic_cover.jsp");
//        rd.forward(req, resp);
    }

}
