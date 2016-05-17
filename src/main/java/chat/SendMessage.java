package chat;

import com.google.appengine.api.channel.ChannelMessage;
import com.google.appengine.api.channel.ChannelService;
import com.google.appengine.api.channel.ChannelServiceFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 * Created by ZEXUN on 4/25/16.
 */
public class SendMessage extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String channelKey = request.getParameter("reciption");
        String message = request.getParameter("message");
        String selfId = request.getParameter("selfId");


        ChannelService channelService = ChannelServiceFactory.getChannelService();
        ArrayList<String> allChannels = (ArrayList<String>) getServletContext().getAttribute("allChannels");

        System.out.println("Send message :  " + message);

        if(allChannels.contains(channelKey)){
            message = message.toString()+"&yes";
            // channelKey is user_ID
            channelService.sendMessage(new ChannelMessage(channelKey, message.toString()));
        }else{
            message = message.toString()+"&no";
            String newMessage = "User isn't online or user doesn't exist";
            String[] tem = message.split("&");
            tem[0] = newMessage;
            newMessage = tem[0]+"&"+tem[1]+"&"+tem[2]+"&"+tem[3];

            channelService.sendMessage(new ChannelMessage(selfId,newMessage));
        }


    }
}
