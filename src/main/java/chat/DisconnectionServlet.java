package chat;

import com.google.appengine.api.channel.ChannelPresence;
import com.google.appengine.api.channel.ChannelService;
import com.google.appengine.api.channel.ChannelServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by ZEXUN on 4/28/16.
 */
public class DisconnectionServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        processRequest(request, response);
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        System.out.println("Enter disconnection servlet");

        ChannelService channelService = ChannelServiceFactory.getChannelService();
        ChannelPresence currentPresence = channelService.parsePresence(request);

        ArrayList<String> allChannels = (ArrayList<String>) getServletContext().getAttribute("allChannels");
        System.out.println("Before remove disconnect user");
        for(int i = 0; i < allChannels.size(); i ++){
            System.out.println(allChannels.get(i));
        }
        allChannels.remove(currentPresence.clientId());

        System.out.println("After remove disconnect user");
        for(int i = 0; i < allChannels.size(); i ++){
            System.out.println(allChannels.get(i));
        }




    }
}
