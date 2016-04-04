package com.digitalconeptions.www;

import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.LoadType;
import com.googlecode.objectify.cmd.Loader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by justin on 3/21/16.
 */
public class HomePageServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String genre = "action";

        LoadType<ComicInfo> comicObjLoad = ObjectifyService.ofy().load().type(ComicInfo.class);

        List<ComicInfo> actionComics = comicObjLoad.filter("genre", genre).list();
        // ..... all other genres

        List<ComicInfo> popularComics = null;
        for (int x = 5; x > 0; x++){
            popularComics = comicObjLoad.filter("rating >", x).list();
            if(popularComics.size() > 0)
                break;
        }

        List<ComicInfo> newestComics = null;
        long dayMS = 86400000;
        Date today = new Date();
        for (int x = 1; x > 0; x++){
            newestComics = comicObjLoad.filter("dateLong >", today.getTime() - dayMS * x).list();
            if (newestComics.size() > 10)
                break;

//            if (x > 1000)
        }

        req.setAttribute("action_comics", actionComics);
        req.setAttribute("popular_comics", popularComics);
        req.setAttribute("newest_comics", newestComics);
    }
}