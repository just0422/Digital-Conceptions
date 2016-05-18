package com.digitalconeptions.www;

import com.google.appengine.api.datastore.KeyFactory;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by justin on 5/18/16.
 */
@Entity
public class SeriesInfo {
    @Id String key;

    @Index String seriesTitle;
    List<String> subscribedUsers;
    @Index long dateLong;
    Date dateCreated;

    public SeriesInfo(){
        seriesTitle = null;
        dateCreated = new Date();
        dateLong = dateCreated.getTime();
        subscribedUsers = new ArrayList<>();
    }

    public SeriesInfo(String series){
        this();
        seriesTitle = series;
        setKey();
    }

    public void setKey(){
        key = KeyFactory.createKeyString("ComicInfo", seriesTitle + getTimeCreated());
    }

    public long getTimeCreated() { return dateLong; }

    public List<String> getSubscribedUsers() { return subscribedUsers; }
    public void addSubscribedUser(String user) { subscribedUsers.add(user); }
    public void removeSubscribedUser(String user) { subscribedUsers.remove(user); }
}
