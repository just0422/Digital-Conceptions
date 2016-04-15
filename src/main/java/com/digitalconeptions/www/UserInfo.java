package com.digitalconeptions.www;

import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
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
public class UserInfo {
    @Id String key;

    @Index String username;
    @Index User user;
    Date dateJoined;
    HashMap<ComicInfo, Integer> comicPageLeftOff;
    ArrayList<ComicInfo> subscriptions;
    ArrayList<ComicInfo> creations;
    ArrayList<ComicInfo> recentlyRead;

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

    public HashMap<ComicInfo, Integer> getComicPageLeftOffMap() { return comicPageLeftOff; }
    public void addComicPageLeftOff(ComicInfo comic, int page){ comicPageLeftOff.put(comic, page); }
    public int getComicPageLeftOff(ComicInfo comic){ return comicPageLeftOff.get(comic); }

    public ArrayList<ComicInfo> getSubscriptions() { return subscriptions; }
    public void setSubscriptions(ArrayList<ComicInfo> subscriptions) { this.subscriptions = subscriptions; }
    public ArrayList<ComicInfo> getCreations() { return creations; }
    public void setCreations(ArrayList<ComicInfo> creations) { this.creations = creations; }
    public void addCreation (ComicInfo comic) { creations.add(comic); }
    public ArrayList<ComicInfo> getRecentlyRead() { return recentlyRead; }
    public void setRecentlyRead(ArrayList<ComicInfo> recentlyRead) { this.recentlyRead = recentlyRead; }

    public ArrayList<String> getUnreadNotifications() { return unreadNotifications; }
    public void setUnreadNotifications(ArrayList<String> unreadNotifications) { this.unreadNotifications = unreadNotifications; }
    public ArrayList<String> getReadNotifications() { return readNotifications; }
    public void setReadNotifications(ArrayList<String> readNotifications) { this.readNotifications = readNotifications; }
}
