package com.digitalconeptions.www;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.LoadType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by justin on 3/21/16.
 */
public class HomePageServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println(getClass().getName());
        String genre = "action"; // List of Genres

        // Load all comics from the database
        LoadType<ComicInfo> comicObjLoad = ObjectifyService.ofy().load().type(ComicInfo.class);

        // Filter comics by genres
        List<ComicInfo> actionComics = comicObjLoad.filter("genre", genre).list();
        // ..... all other genres

        // Filter comics by popularity
        List<ComicInfo> popularComics = null;
        for (int x = 5; x > 0; x--){
            popularComics = comicObjLoad.filter("rating >", x).list();
            if(popularComics.size() > 0)
                break;
        }

        // Filter comics by date added
        List<ComicInfo> newestComics = null;
        long dayMS = 86400000;
        Date today = new Date();
        for (int x = 10; x > 0; x--){
            newestComics = comicObjLoad.filter("dateLong >", today.getTime() - dayMS * x).list();
            if (newestComics.size() > 10)
                break;

            if (x > 1000)
                break;
        }

        String username;
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        if (user == null)
            username = null;
        else
            username = user.getNickname();


        // Set attributes in request for forwarding
        req.setAttribute("action_comics", actionComics);
        req.setAttribute("popular_comics", popularComics);
        req.setAttribute("newest_comics", newestComics);
        HttpSession session = req.getSession();
        session.setAttribute("user", username);

        // Forward request to the home page
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/index.jsp");
        rd.forward(req, resp);
    }
}