package com.digitalconeptions.www;

import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

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
    @EmbedMap HashMap<String, Integer> volumeLeftOff;
    @EmbedMap HashMap<String, Integer> issueLeftOff;
    ArrayList<String> subscriptions;
    ArrayList<String> creations;
    ArrayList<String> recentlyRead;

    ArrayList<String> unreadNotifications;
    ArrayList<String> readNotifications;

    ArrayList<String> collaborations;

    public UserInfo(){
        dateJoined = new Date();
        username = null;
        user = UserServiceFactory.getUserService().getCurrentUser();

        comicPageLeftOff = new HashMap<>();
        volumeLeftOff = new HashMap<>();
        issueLeftOff = new HashMap<>();
        subscriptions = new ArrayList<>();
        creations = new ArrayList<>();
        recentlyRead = new ArrayList<>();

        unreadNotifications = new ArrayList<>();
        readNotifications = new ArrayList<>();

        collaborations = new ArrayList<>();
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
    public void removeComicPageLeftOff(String comic) { comicPageLeftOff.remove(comic); }
    public int getComicPageLeftOff(ComicInfo comic){ return comicPageLeftOff.get(comic); }
    public void addVolumeLeftOff(String comic, int volume) { volumeLeftOff.put(comic, volume); }
    public int getVolumeLeftOff(ComicInfo comic) { return volumeLeftOff.get(comic); }
    public void addIssueLeftOff(String comic, int issue) { volumeLeftOff.put(comic, issue); }
    public int getIssueLeftOff(ComicInfo comic) { return issueLeftOff.get(comic); }


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
    public void addUnreadNotification(String notification) {
        unreadNotifications.add(notification);
        Collections.sort(unreadNotifications);
    }
    public void addReadNotification(String notification){
        readNotifications.add(notification);
        Collections.sort(unreadNotifications);
    }
    public void removeUnreadNotification(String notification){
        unreadNotifications.remove(notification);
    }
    public void removeReadNotification(String notification){
        readNotifications.remove(notification);
    }

    public void subscribe(String key){
        subscriptions.add(key);
    }
    public void unsubscribe(String key){
        subscriptions.remove(key);
    }

    public void removeComicCollab(String collab) { collaborations.remove(collab); }
    public void addComicCollab(String collab) { collaborations.add(collab); }
    public List<String> getCollaborations() { return collaborations; }
}
