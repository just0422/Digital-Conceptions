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
        List<String> genres = Constants.randomGenres(4);
        List<ComicInfo> comics0 = comicObjLoad.filter("genre", genres.get(0)).order("rating").list();
        comics0 = comics0.subList(0, 2 >= comics0.size() ? comics0.size() : 3);
        List<ComicInfo> comics1 = comicObjLoad.filter("genre", genres.get(1)).order("rating").list();
        comics1 = comics1.subList(0, 2 >= comics1.size() ? comics1.size() : 3);
        List<ComicInfo> comics2 = comicObjLoad.filter("genre", genres.get(2)).order("rating").list();
        comics2 = comics2.subList(0, 2 >= comics2.size() ? comics2.size() : 3);
        List<ComicInfo> comics3 = comicObjLoad.filter("genre", genres.get(3)).order("rating").list();
        comics3 = comics3.subList(0, 2 >= comics3.size() ? comics3.size() : 3);

        // Filter comics by popularity
        List<ComicInfo> popularComics = null;
        for (int x = 5; x > 0; x--){
            popularComics = comicObjLoad.filter("rating >", x).list();
            if(popularComics.size() > 10)
                break;
        }
        popularComics = popularComics.subList(0, 9 >= popularComics.size() ? popularComics.size() : 9);

        // Filter comics by date added
        List<ComicInfo> newestComics = null;
        long dayMS = 86400000;
        Date today = new Date();
        for (int x = 0; x < 10; x++){
            newestComics = comicObjLoad.filter("dateLong >", today.getTime() - dayMS * x).list();
            if (newestComics.size() > 10)
                break;

            if (x > 1000)
                break;
        }

        String username;
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        UserInfo currentUser = null;
        if (user == null)
            username = null;
        // Otherwise look for UserInfo in datastore
        else
        {
            username = user.getNickname();
            currentUser = ObjectifyService.ofy().load().type(UserInfo.class).filter("username", username).first().now();
            if (currentUser == null){
                currentUser = new UserInfo(user.getNickname());
                currentUser.setKey();
                ObjectifyService.ofy().save().entity(currentUser).now();
            }

            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("user_info", currentUser);
        }

        // Set attributes in request for forwarding
        req.setAttribute("genres", genres);
        req.setAttribute(genres.get(0), comics0);
        req.setAttribute(genres.get(1), comics1);
        req.setAttribute(genres.get(2), comics2);
        req.setAttribute(genres.get(3), comics3);
        req.setAttribute("popular_comics", popularComics);
        req.setAttribute("newest_comics", newestComics);

        // Forward request to the home page
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/index.jsp");
        rd.forward(req, resp);
    }
}