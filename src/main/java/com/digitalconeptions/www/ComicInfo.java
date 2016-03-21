package com.digitalconeptions.www;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import java.io.File;
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 * Created by justin on 3/21/16.
 */
@Entity
public class ComicInfo {
    @Id String key;

    @Index String seriesTitle;
    @Index String comicTitle;
    @Index String genre;
    @Index String username;
    @Index User user;
    @Index Date dateCreated;
    @Index int numberOfReads;
    @Index int rating;

    String comicImagesDirectory;
    String comicCommentsDirecotry;
    int volume;
    int issue;

    public ComicInfo(){
        seriesTitle = null;
        comicTitle = null;
        genre = null;
        username = null;
        user = UserServiceFactory.getUserService().getCurrentUser();
        dateCreated = new Date();
        numberOfReads = 0;
        rating = 0;

        comicImagesDirectory = null;
        comicCommentsDirecotry = null;
        volume = 0;
        issue = 0;
    }

    public ComicInfo(String username,
                     String seriesTitle,
                     String comicTitle){
        this();
        this.seriesTitle = seriesTitle;
        this.comicTitle = comicTitle;
        this.username = username;

        String highestLevelDir = '/' + user.getNickname();
        String lowestLevelDir = seriesTitle + '/' + comicTitle + '/';
        this.comicImagesDirectory =  highestLevelDir +
                "/comics/" + lowestLevelDir;
        this.comicCommentsDirecotry = highestLevelDir +
                "/comments/" + lowestLevelDir;

        File cid = new File(comicImagesDirectory);
        File ccd = new File(comicCommentsDirecotry);

        try {
            if(!cid.exists())
                cid.mkdir();
            if(!ccd.exists())
                ccd.mkdir();
        }
        catch (SecurityException e){
            System.err.println("\n\nUHOH IT BROKE\n\n");
            e.printStackTrace();
        }


    }

    public ComicInfo(String username,
                     String seriesTitle,
                     String comicTitle,
                     String genre){
        this(username, seriesTitle, comicTitle);
        this.genre = genre;
    }

    public ComicInfo(String username,
                     String seriesTitle,
                     String comicTitle,
                     int volume,
                     int issue){
        this(username, seriesTitle, comicTitle);
        this.volume = volume;
        this.issue = issue;
    }

    public ComicInfo(String username,
                     String seriesTitle,
                     String comicTitle,
                     String genre,
                     int volume,
                     int issue){
        this(username, seriesTitle, comicTitle);
        this.genre = genre;
        this.volume = volume;
        this.issue = issue;
    }


    public void setKey(){
        key = KeyFactory.createKeyString("ComicInfo", username + seriesTitle + comicTitle + getTimeCreated());
    }
    public String getDateFormat() {
        SimpleDateFormat format = new SimpleDateFormat("E MM/dd/yyyy");

        return format.format(this.dateCreated);
    }


    public String getSeriesTitle() { return seriesTitle; }
    public void setSeriesTitle(String seriesTitle) { this.seriesTitle = seriesTitle; }
    public String getComicTitle() { return comicTitle; }
    public void setComicTitle(String comicTitle) { this.comicTitle = comicTitle; }
    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public Date getDateCreated() { return dateCreated; }
    public long getTimeCreated() { return dateCreated.getTime(); }
    public void setDateCreated(Date dateCreated) { this.dateCreated = dateCreated; }
    public int getNumberOfReads() { return numberOfReads; }
    public void setNumberOfReads(int numberOfReads) { this.numberOfReads = numberOfReads; }
    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }
    public String getComicImagesDirectory() { return comicImagesDirectory; }
    public void setComicImagesDirectory(String comicImagesDirectory) { this.comicImagesDirectory = comicImagesDirectory; }
    public String getComicCommentsDirecotry() { return comicCommentsDirecotry; }
    public void setComicCommentsDirecotry(String comicCommentsDirecotry) { this.comicCommentsDirecotry = comicCommentsDirecotry; }
    public int getVolume() { return volume; }
    public void setVolume(int volume) { this.volume = volume; }
    public int getIssue() { return issue; }
    public void setIssue(int issue) { this.issue = issue; }
}
