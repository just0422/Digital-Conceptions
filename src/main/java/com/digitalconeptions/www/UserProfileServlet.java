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
            comics.add(seriesComic);
        }

        req.setAttribute("current_user", currentUser);
        System.out.println(currentUser.unreadNotifications.size());
        req.setAttribute("series_comics", comics);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/user_profile.jsp");
        rd.forward(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println(getClass().getName() + " POST");
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        String notification = req.getParameter("notification");
        String delete_notification = req.getParameter("notification_delete");

        UserInfo currentUser = ObjectifyService.ofy().load().type(UserInfo.class).filter("username", user.getNickname()).first().now();

        if (delete_notification != null){
            currentUser.removeReadNotification(delete_notification);
            currentUser.removeUnreadNotification(delete_notification);
        }

        if (notification != null) {
            currentUser.removeUnreadNotification(notification);
            currentUser.addReadNotification(notification);
        }
        ObjectifyService.ofy().save().entity(currentUser).now();

    }

}