package chat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by ZEXUN on 5/17/16.
 */
public class ChatBoxesPersistence extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        processRequest(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        System.out.println("Into ChatBoxesPersistence");
        String chatBox = request.getParameter("chatBox");
        if(chatBox != null) {
            System.out.println("Original chat box string");
            System.out.println(chatBox);
            System.out.println("Now split the string");

            String[] chatBoxList = chatBox.split("&");
            System.out.println(chatBoxList.length);
            System.out.println(chatBoxList[chatBoxList.length - 1]);


            HttpSession session = request.getSession();
            session.setAttribute("chatBoxList", chatBoxList);
            session.setAttribute("numOfChatBox",chatBoxList.length);
        }else{
            System.out.println("No opened chat box");
        }

    }
}
