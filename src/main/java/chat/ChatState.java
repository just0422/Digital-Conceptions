package chat;

import java.io.Serializable;

/**
 * Created by ZEXUN on 5/18/16.
 */
public class ChatState implements Serializable {
    private String [] chatBoxList;
    private int numberOfChatBox;

    public ChatState(){
        chatBoxList = new String[0];
        numberOfChatBox = 0;
    }


    public String[] getChatBoxList() {
        return chatBoxList;
    }

    public void setChatBoxList(String[] chatBoxList) {
        this.chatBoxList = chatBoxList;
    }



    public int getNumberOfChatBox() {
        return numberOfChatBox;
    }

    public void setNumberOfChatBox(int numberOfChatBox) {
        this.numberOfChatBox = numberOfChatBox;
    }
}
