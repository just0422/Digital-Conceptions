package com.digitalconeptions.www;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
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
import java.util.ArrayList;
import java.util.List;

/**
 * Created by justin on 4/7/16.
 */
public class UserProfileServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println(getClass().getName());
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        UserInfo currentUser = ObjectifyService.ofy().load().type(UserInfo.class).filter("username",user.getNickname()).first().now();

        if (currentUser == null){
            currentUser = new UserInfo(user.getNickname());
            currentUser.setKey();
            ObjectifyService.ofy().save().entity(currentUser).now();
        }

        ArrayList<ComicInfo> comics = new ArrayList<>();
        for (String key : currentUser.subscriptions){
            String comic[] = key.split("\\|");

            ComicInfo seriesComic
                    = ObjectifyService.ofy().load().type(ComicInfo.class)
                    .filter(Constants.seriesTitle, comic[0]).first().now();
//                    .filter(Constants.issueTitle, comic[2])
//                    .filter(Constants.volume, Integer.parseInt(comic[1]))
//                    .filter(Constants.issue, Integer.parseInt(comic[3])).first().now();
            comics.add(seriesComic);
            System.out.println("Comics Size: " + comics.size());
        }

        req.setAttribute("current_user", currentUser);
        req.setAttribute("series_comics", comics);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/user_profile.jsp");
        rd.forward(req, resp);

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doGet(req, resp);
    }

}