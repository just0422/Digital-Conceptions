package com.digitalconeptions.www;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by justin on 3/21/16.
 */
public class UserServiceServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        // IF THE USER IS NOT LOGGED IN, THEN REDIRECT USER TO LOG IN PAGE
        if (user == null) {
            String loginURL = userService.createLoginURL("/");
            resp.sendRedirect(loginURL);
        }
        // IF LOGGED IN, THEN GENERATE LOGOUT URL FOR LATER USE
        else {
            String logoutURL = userService.createLogoutURL("/");
//            req.setAttribute("logoutURL", logoutURL);
            resp.sendRedirect(logoutURL);
        }
//        String userProfLink = "/profile?user=" + user.getNickname();
//        String login = userProfLink;
//        if (user == null)
//            userService.createLoginURL(userProfLink);

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        UserService userService = UserServiceFactory.getUserService();
        String logout = userService.createLogoutURL("/");
        resp.sendRedirect(logout);
    }

}