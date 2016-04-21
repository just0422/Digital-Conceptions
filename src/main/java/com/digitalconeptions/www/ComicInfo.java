package com.digitalconeptions.www;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.annotation.EmbedMap;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import sun.java2d.pipe.SpanShapeRenderer;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;


/**
 * Created by justin on 3/21/16.
 */
@Entity
public class ComicInfo {
    @Id String key;

    @Index String seriesTitle;
    @Index String issueTitle;
    @Index String genre;
    @Index String username;
    String description;
    @Index User user;
    @Index long dateLong;
    Date dateCreated;
    @Index int numberOfReads;
    @Index double rating;
    @Index int volume;
    @Index int issue;

    List<BlobKey> images;
    List<String> urls;
    List<String> commentList;
    @EmbedMap HashMap<String, Integer> ratings;

    public ComicInfo(){
        seriesTitle = null;
        issueTitle = null;
        genre = null;
        username = null;
        description = null;
        user = UserServiceFactory.getUserService().getCurrentUser();
        dateCreated = new Date();
        dateLong = dateCreated.getTime();
        numberOfReads = 0;
        rating = 0;

        images = null;
        commentList = new ArrayList();
        ratings = new HashMap<>();
        volume = 0;
        issue = 0;
    }

    public ComicInfo(String username,
                     String seriesTitle,
                     String comicTitle){
        this();
        this.seriesTitle = seriesTitle;
        this.issueTitle = comicTitle;
        this.username = username;
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
                     String description,
                     int volume,
                     int issue,
                     List<BlobKey> images,
                     List<String> urls){
        this(username, seriesTitle, comicTitle);
        this.description = description;
        this.genre = genre;
        this.volume = volume;
        this.issue = issue;
        this.images = images;
        this.urls = urls;
    }

    public void setKey(){
        key = KeyFactory.createKeyString("ComicInfo", username + seriesTitle +  issueTitle + getTimeCreated());
    }
    public String getDateFormat() {
        SimpleDateFormat format = new SimpleDateFormat("E MM/dd/yyyy");
        return format.format(this.dateCreated);
    }
    public String getComicName(){
        return seriesTitle + '|' + volume + '|' +  issueTitle + '|' + issue;
    }
    public String getCoverPage(){ return urls.get(0); }
    public String getPage(int page) { return urls.get(page); }
    public int getRate(String rater){ return ratings.containsKey(rater) ? -1 : ratings.get(rater); }
    public void addRate(String rater, int rating){
        if (!ratings.isEmpty()) {
            if(ratings.containsKey(rater)){
                this.rating *= 2;
                this.rating -= ratings.get(rater);
            }
            this.rating = (this.rating + rating) / 2;
        }
        else
            this.rating = rating;
        ratings.put(rater, rating);
    }


    public String getSeriesTitle() { return seriesTitle; }
    public void setSeriesTitle(String seriesTitle) { this.seriesTitle = seriesTitle; }
    public String getIssueTitle() { return  issueTitle; }
    public void setIssueTitle(String comicTitle) { this. issueTitle = comicTitle; }
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
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }
    public List<String> getCommentList() {return commentList;}
    public String addComment(String username, String comment) {
        SimpleDateFormat format = new SimpleDateFormat("E MM/dd/yyyy HH:mm:ss");
        String commentDate = format.format(new Date());

        comment = commentDate + "|" + username + "|" + comment;
        commentList.add(comment);
        return commentDate;
    }
    public int getVolume() { return volume; }
    public void setVolume(int volume) { this.volume = volume; }
    public int getIssue() { return issue; }
    public void setIssue(int issue) { this.issue = issue; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public List<BlobKey> getImages() { return images; }
    public void setImages(List<BlobKey> images) { this.images = images; }
    public List<String> getUrls() { return urls; }
    public void setUrls(List<String> urls) { this.urls = urls; }
    public int getImagesListSize() { return images.size(); }
    public int getUrlsListSize() { return urls.size(); }
}
