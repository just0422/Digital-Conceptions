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

        LoadType<ComicInfo> comicObjLoad = ObjectifyService.ofy().load().type(ComicInfo.class);
        List<ComicInfo> actionComics = new ArrayList();
        List<ComicInfo> dramaComics = new ArrayList();
        List<ComicInfo> romanceComics = new ArrayList();
        List<ComicInfo> comedyComics = new ArrayList();
        List<ComicInfo> horrorComics = new ArrayList();
        List<ComicInfo> fantasyComics = new ArrayList();
        List<ComicInfo> sportComics = new ArrayList();

        if (comicObjLoad != null)
        {
            actionComics = comicObjLoad.filter("genre", "action").list();
            dramaComics = comicObjLoad.filter("genre", "drama").list();
            romanceComics = comicObjLoad.filter("genre", "romance").list();
            comedyComics = comicObjLoad.filter("genre", "comedy").list();
            horrorComics = comicObjLoad.filter("genre", "horror").list();
            fantasyComics = comicObjLoad.filter("genre", "fantasy").list();
            sportComics = comicObjLoad.filter("genre", "sport").list();
        }
        req.setAttribute("action_comics", actionComics);
        req.setAttribute("drama_comics", dramaComics);
        req.setAttribute("romance_comics", romanceComics);
        req.setAttribute("comedy_comics", comedyComics);
        req.setAttribute("horror_comics", horrorComics);
        req.setAttribute("fantasy_comics", fantasyComics);
        req.setAttribute("sport_comics", sportComics);
        rd.forward(req, resp);
    }
}
