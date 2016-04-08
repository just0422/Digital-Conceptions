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
public class GenreServlet extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println(getClass().getName());
        String genre = req.getParameter("genre");

        if (genre == null)
            genre = "action";

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/genres/"+genre);


        List<ComicInfo> comics= ObjectifyService.ofy().load().type(ComicInfo.class).filter("genre", genre).list();
        req.setAttribute("comics", comics);

        rd.forward(req, resp);
    }
}
