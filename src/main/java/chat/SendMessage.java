package chat;

import com.google.appengine.api.channel.ChannelMessage;
import com.google.appengine.api.channel.ChannelService;
import com.google.appengine.api.channel.ChannelServiceFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ZEXUN on 4/25/16.
 */
public class SendMessage extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String channelKey = request.getParameter("reciption");
        String message = request.getParameter("message");
        String selfId = request.getParameter("selfId");

        ChannelService channelService = ChannelServiceFactory.getChannelService();

        System.out.println(message);

        // channelKey is user_ID
        channelService.sendMessage(new ChannelMessage(channelKey, message.toString()));
    }
}
