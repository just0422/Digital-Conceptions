package com.digitalconeptions.www;

import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.LoadType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
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
        RequestDispatcher rd = sc.getRequestDispatcher("/genre.jsp?genre=" + genre);
//        RequestDispatcher rd = req.getRequestDispatcher("/genres/"+genre);

        LoadType<ComicInfo> comicObjLoad = ObjectifyService.ofy().load().type(ComicInfo.class);
        List<ComicInfo> comics = new ArrayList();
        if (comicObjLoad != null)
        {
            comics = comicObjLoad.filter("genre", genre).list();
        }
        req.setAttribute("comics", comics);
        rd.forward(req, resp);
    }
}
