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
        System.out.println("Go in to ChatBoxesPersistence servlet");
        String chatBox = request.getParameter("chatBox");
        System.out.println("chatBox content: " + chatBox + "!!!");

        HttpSession session = request.getSession();
        String [] chatBoxList;

        if(chatBox == null){
            System.out.println("No opened chat box");
            session.setAttribute("chatBoxList"," ");
            System.out.println("After storing data into sesssion");
        }else{
            System.out.println("Has opened chat boxes");
            chatBoxList = chatBox.split("&");
            System.out.println("Now printing the first chat box information" + chatBoxList[0]);
            session.setAttribute("chatBoxList",chatBoxList);
            System.out.println("After storing data into sesssion");
        }




    }
}


  /* if(chatBoxListString == null){
            System.out.println("This is the first time store chat box information into session");

            if(chatBox == null){
                System.out.println("No opened chat box");
                session.setAttribute("chatBoxList"," ");
            }else{
                System.out.println("Has opened chat boxes");
                chatBoxList = chatBox.split("&");
                System.out.println("Now printing the first chat box information" + chatBoxList[0]);
                session.setAttribute("chatBoxList",chatBoxList);
            }

        }else{
            System.out.println("No first time storing chat box information into sesssion");

            if(chatBox == null){
                System.out.println("No opened chat box");
                session.setAttribute("chatBoxList","");
            }else{
                System.out.println("Has opened chat boxes");
                chatBoxList = chatBox.split("&");
                System.out.println("Now printing the first chat box information" + chatBoxList[0]);
                session.setAttribute("chatBoxList",chatBoxList);
            }


        }*/

/*
System.out.println("Into ChatBoxesPersistence");
        String chatBox = request.getParameter("chatBox");
        HttpSession session = request.getSession();

        if(chatBox != null) {
        System.out.println("Original chat box string");
        System.out.println(chatBox);
        System.out.println("Now split the string");

        String[] chatBoxList = chatBox.split("&");


        if(chatBoxList.length != 0){
        System.out.println("Printing chatBoxList size: " + chatBoxList.length);
        System.out.println(chatBoxList[chatBoxList.length - 1]);


        session.setAttribute("chatBoxList", chatBoxList);
        session.setAttribute("numOfChatBox",chatBoxList.length);
        }else{
        session.setAttribute("chatBoxList", "");
        session.setAttribute("numOfChatBox",0);
        }

        }else{
        session.setAttribute("chatBoxList", "");
        session.setAttribute("numOfChatBox",0);
        System.out.println("No opened chat box");
        }*/
