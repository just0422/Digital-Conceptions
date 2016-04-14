package com.digitalconeptions.www;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by justin on 3/21/16.
 */
public class UserServiceServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        UserService userService = UserServiceFactory.getUserService();
//        User user = userService.getCurrentUser();

        String loginURL = userService.createLoginURL("/");
        resp.sendRedirect(loginURL);

//        HttpSession session = req.getSession();
//        session.setAttribute("user", user.getNickname());
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        UserService userService = UserServiceFactory.getUserService();
        String logout = userService.createLogoutURL("/");
        resp.sendRedirect(logout);
    }

}