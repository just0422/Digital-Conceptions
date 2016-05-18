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
        System.out.println(getClass().getName());
        String search = req.getParameter("search");

//        @Index String seriesTitle;
//        @Index String comicTitle;
//        @Index String genre;
//        @Index String username;


        if (search == null)
            search = "";

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/search.jsp");
                //("/results/" + search));

//        String hi = resp.encodeURL("/search/" + search);
//        String hi = resp.encodeURL("/search/" + search);

        List<ComicInfo> comics_series_name = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle >=", search.toUpperCase())
                .filter("seriesTitle <", search.toUpperCase() + "\ufffd").list();
        List<ComicInfo> comics_series_name_low = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("seriesTitle >=", search.toLowerCase())
                .filter("seriesTitle <", search.toLowerCase() + "\ufffd").list();
        List<ComicInfo> comics_issue_name = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("issueTitle >=", search.toUpperCase())
                .filter("issueTitle <", search.toUpperCase() + "\ufffd").list();
        List<ComicInfo> comics_issue_name_low = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("issueTitle >=", search.toLowerCase())
                .filter("issueTitle <", search.toLowerCase() + "\ufffd").list();
        List<ComicInfo> comics_author_name = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("username >=", search.toUpperCase())
                .filter("username <",  search.toUpperCase() + "\ufffd").list();
        List<ComicInfo> comics_author_name_low = ObjectifyService.ofy().load().type(ComicInfo.class)
                .filter("username >=", search.toLowerCase())
                .filter("username <",  search.toLowerCase() + "\ufffd").list();
        for(ComicInfo c : comics_issue_name)
            if (!comics_series_name.contains(c))
                comics_series_name.add(c);
        for(ComicInfo c : comics_series_name_low)
            if (!comics_series_name.contains(c))
                comics_series_name.add(c);
        for(ComicInfo c : comics_issue_name_low)
            if (!comics_series_name.contains(c))
                comics_series_name.add(c);

        for (String word : search.split(" ")){
            List<ComicInfo> comics_series_word = ObjectifyService.ofy().load().type(ComicInfo.class)
                    .filter("seriesTitle >=", word.toLowerCase())
                    .filter("seriesTitle <", word.toLowerCase() + "\ufffd").list();
            List<ComicInfo> comics_series_word_lower = ObjectifyService.ofy().load().type(ComicInfo.class)
                    .filter("seriesTitle >=", word.toUpperCase())
                    .filter("seriesTitle <", word.toUpperCase() + "\ufffd").list();
            List<ComicInfo> comics_issue_word = ObjectifyService.ofy().load().type(ComicInfo.class)
                    .filter("issueTitle >=", word.toLowerCase())
                    .filter("issueTitle <", word.toLowerCase() + "\ufffd").list();
            List<ComicInfo> comics_issue_word_lower = ObjectifyService.ofy().load().type(ComicInfo.class)
                    .filter("issueTitle >=", word.toUpperCase())
                    .filter("issueTitle <", word.toUpperCase() + "\ufffd").list();
            comics_series_word.addAll(comics_issue_word);
            comics_series_word.addAll(comics_issue_word_lower);
            comics_series_word.addAll(comics_series_word_lower);
            for (ComicInfo c : comics_series_word){
                if (!comics_series_name.contains(c))
                    comics_series_name.add(c);
            }
        }
        comics_author_name.addAll(comics_author_name_low);
        for(ComicInfo c : comics_author_name)
            if (!comics_series_name.contains(c))
                comics_series_name.add(c);

        req.setAttribute("comics", comics_series_name);
//        req.setAttribute("search", search);
//        resp.encodeURL("search/"+search);
//        resp.encodeRedirectURL("search/"+search);

        rd.forward(req, resp);
    }
}
