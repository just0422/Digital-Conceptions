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
import java.io.IOException;

/**
 * Created by justin on 4/7/16.
 */
public class UserProfileServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        System.out.println(getClass().getName());
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        UserInfo currentUser = ObjectifyService.ofy().load().type(UserInfo.class).filter("username",user.getNickname()).first().now();

        req.setAttribute("current_user", currentUser);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/profile");
        rd.forward(req, resp);

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

    }

}