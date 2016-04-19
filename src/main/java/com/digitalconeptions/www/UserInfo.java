package com.digitalconeptions.www;

import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.annotation.EmbedMap;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 * Created by justin on 3/21/16.
 */
@Entity
public class UserInfo implements java.io.Serializable{
    @Id String key;

    @Index String username;
    @Index User user;
    Date dateJoined;
    @EmbedMap HashMap<String, Integer> comicPageLeftOff;
    ArrayList<String> subscriptions;
    ArrayList<String> creations;
    ArrayList<String> recentlyRead;

    ArrayList<String> unreadNotifications;
    ArrayList<String> readNotifications;

    public UserInfo(){
        dateJoined = new Date();
        username = null;
        user = UserServiceFactory.getUserService().getCurrentUser();

        comicPageLeftOff = new HashMap<>();
        subscriptions = new ArrayList<>();
        creations = new ArrayList<>();
        recentlyRead = new ArrayList<>();

        unreadNotifications = new ArrayList<>();
        readNotifications = new ArrayList<>();
    }

    public UserInfo(String username){
        this();
        this.username = username;
    }

    public void setKey(){
        key = KeyFactory.createKeyString("UserInfo", username + user.getNickname());
    }
    public String getDateFormat() {
        SimpleDateFormat format = new SimpleDateFormat("E MM/dd/yyyy");

        return format.format(this.dateJoined);
    }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public HashMap<String, Integer> getComicPageLeftOffMap() { return comicPageLeftOff; }
    public void addComicPageLeftOff(String comic, int page){ comicPageLeftOff.put(comic, page); }
    public int getComicPageLeftOff(ComicInfo comic){ return comicPageLeftOff.get(comic); }

    public ArrayList<String> getSubscriptions() { return subscriptions; }
    public void setSubscriptions(ArrayList<String> subscriptions) { this.subscriptions = subscriptions; }
    public ArrayList<String> getCreations() { return creations; }
    public void setCreations(ArrayList<String> creations) { this.creations = creations; }
    public void addCreation (String comic) { creations.add(comic); }
    public ArrayList<String> getRecentlyRead() { return recentlyRead; }
    public void setRecentlyRead(ArrayList<String> recentlyRead) { this.recentlyRead = recentlyRead; }

    public ArrayList<String> getUnreadNotifications() { return unreadNotifications; }
    public void setUnreadNotifications(ArrayList<String> unreadNotifications) { this.unreadNotifications = unreadNotifications; }
    public ArrayList<String> getReadNotifications() { return readNotifications; }
    public void setReadNotifications(ArrayList<String> readNotifications) { this.readNotifications = readNotifications; }
    public void addUnreadNotification(String notification) { unreadNotifications.add(notification); }
}
