package chat;

import com.digitalconeptions.www.ComicInfo;
import com.digitalconeptions.www.UserInfo;
import com.google.appengine.api.channel.ChannelService;
import com.google.appengine.api.channel.ChannelServiceFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.digitalconeptions.www.*;
import com.google.appengine.api.users.User;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.LoadType;

/**
 * Created by ZEXUN on 4/25/16.
 */


public class ChannelBuilderServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response){

        ChannelService channelService = ChannelServiceFactory.getChannelService();
        String token = channelService.createChannel(request.getParameter("id"));

        System.out.println("ChannelBuilderServlet");

        try {
            PrintWriter out = response.getWriter();
            out.println(token);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
