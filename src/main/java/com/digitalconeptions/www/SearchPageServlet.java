package com.digitalconeptions.www;

import com.googlecode.objectify.ObjectifyService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by justin on 4/5/16.
 */
public class SearchPageServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String search = req.getParameter("search");

//        @Index String seriesTitle;
//        @Index String comicTitle;
//        @Index String genre;
//        @Index String username;


        if (search == null)
            search = "";

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(resp.encodeURL("/search_result/" + search));

//        String hi = resp.encodeURL("/search/" + search);
//        String hi = resp.encodeURL("/search/" + search);

        List<ComicInfo> comics_series_name = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle >=", search)
                .filter("seriesTitle <", search + "\ufffd").list();
        List<ComicInfo> comics_name = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("comicTitle >=", search)
                .filter("comicTitle <", search + "\ufffd").list();
        List<ComicInfo> comics_author_name = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("username >=", search)
                .filter("username <", search + "\ufffd").list();
        for(ComicInfo c : comics_name)
            if (!comics_series_name.contains(c))
                comics_series_name.add(c);
        for(ComicInfo c : comics_author_name)
            if (!comics_series_name.contains(c))
                comics_series_name.add(c);

        req.setAttribute("comics", comics_series_name);
//        resp.encodeURL("search/"+search);
//        resp.encodeRedirectURL("search/"+search);

        rd.forward(req, resp);
    }
}
