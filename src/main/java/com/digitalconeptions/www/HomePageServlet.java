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

        // Load all comics from the database
        LoadType<ComicInfo> comicObjLoad = ObjectifyService.ofy().load().type(ComicInfo.class);

        // Filter comics by genres
        List<ComicInfo> actionComics = comicObjLoad.filter("genre", "action").list();
        List<ComicInfo> romanceComics = comicObjLoad.filter("genre", "romance").list();
        List<ComicInfo> horrorComics = comicObjLoad.filter("genre", "horror").list();
        List<ComicInfo> fantasyComics = comicObjLoad.filter("genre", "fantasy").list();

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
        UserInfo userInfo = null;
        if (user == null)
            username = null;
        // Otherwise look for UserInfo in datastore
        else
        {
            username = user.getNickname();
            LoadType<UserInfo> userInfoObjLoad = ObjectifyService.ofy().load().type(UserInfo.class);
            userInfo = new UserInfo(username);
        /*
            TODO
            Load UserInfo of user and set it as session attribute
            if null, then create a new UserInfo and store it in datastore

            UserInfo userInfo = ObjectifyService.ofy().load().type(UserInfo.class).filter("username", username).first().now();
            if (userInfo == null)
            {
                userInfo = new UserInfo(username);
                // Store userInfo into datastore
            }
        */
        }

        // For testing if form is able to get this comic and its attributes
        ComicInfo testComic = new ComicInfo();
        testComic.seriesTitle = "Parasyte";
        testComic.comicTitle = "THE MAXIM";
        testComic.volume = 5;
        testComic.issue = 10;
        req.setAttribute("test_comic", testComic);

        // Set attributes in request for forwarding
        req.setAttribute("action_comics", actionComics);
        req.setAttribute("romance_comics", romanceComics);
        req.setAttribute("horror_comics", horrorComics);
        req.setAttribute("fantasy_comics", fantasyComics);
        req.setAttribute("popular_comics", popularComics);
        req.setAttribute("newest_comics", newestComics);
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        session.setAttribute("user_info", userInfo);


        // Forward request to the home page
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/index.jsp");
        rd.forward(req, resp);
    }
}