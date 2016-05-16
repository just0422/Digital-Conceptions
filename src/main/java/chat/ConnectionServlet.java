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
public class ConnectionServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        processRequest(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        ArrayList<String> allChannels = (ArrayList<String>) getServletContext().getAttribute("allChannels");

        ChannelService channelService = ChannelServiceFactory.getChannelService();
        ChannelPresence currentPresence = channelService.parsePresence(request);

        boolean isUserExists = false;

        if(allChannels == null){
            allChannels = new ArrayList<>();


            if(allChannels.contains(currentPresence.clientId())){
                System.out.println("User already exists");
            }else{
                System.out.println("New User");
                allChannels.add(currentPresence.clientId());
            }


            System.out.println("Now printing everyone online");
            for(int i = 0; i < allChannels.size(); i++){
                System.out.println(allChannels.get(i));
            }
            System.out.println("End of list");

            getServletContext().setAttribute("allChannels",allChannels);

        }else{

            if(allChannels.contains(currentPresence.clientId())){
                System.out.println("User already exists");
            }else{
                System.out.println("New User");
                allChannels.add(currentPresence.clientId());
            }

            System.out.println("Now printing everyone online");
            for(int i = 0; i < allChannels.size(); i++){
                System.out.println(allChannels.get(i));
            }
            System.out.println("End of list");

        }

    }
}
