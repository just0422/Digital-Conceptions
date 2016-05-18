package com.digitalconeptions.www;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.EmbedMap;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

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
    @Index boolean isCanvas;
    List<String> json;

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
                     List<String> urls,
                     boolean canvas){
        this(username, seriesTitle, comicTitle);
        this.description = description;
        this.genre = genre;
        this.volume = volume;
        this.issue = issue;
        this.images = images;
        this.urls = urls;
        this.isCanvas = canvas;
    }

    public void setKey(){
        key = KeyFactory.createKeyString("ComicInfo", username + seriesTitle +  issueTitle + getTimeCreated());
    }

    public String getDateFormat() {
        SimpleDateFormat format = new SimpleDateFormat("E MM/dd/yyyy");
        return format.format(this.dateCreated);
    }
    public String getCurrentPage(){
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        if (user == null)
            return getCoverPage();
        UserInfo currentUser = ObjectifyService.ofy().load().type(UserInfo.class).filter("username",user.getNickname()).first().now();

        if (currentUser.comicPageLeftOff.containsKey(getComicName()))
            return getPage(currentUser.comicPageLeftOff.get(getComicName()));
        return getCoverPage();
    }
    public int getPageNumber(){
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        if (user == null)
            return 0;
        UserInfo currentUser = ObjectifyService.ofy().load().type(UserInfo.class).filter("username",user.getNickname()).first().now();

        if (currentUser.comicPageLeftOff.containsKey(getComicName()))
            return currentUser.comicPageLeftOff.get(getComicName());
        return 0;
    }


    public String getComicName(){
        return seriesTitle + '|' + volume + '|' +  issueTitle + '|' + issue;
    }
    public String getCoverPage(){ return urls.get(0); }
    public String getRandomPage() { return urls.get((int)(Math.random() * urls.size())); }
    public String getPage(int page) { return urls.get(page); }
    public int getRate(){
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        String username = user.getNickname();

        return ratings.containsKey(username.replace('.','_')) ? ratings.get(username.replace('.','_')) : 0;
    }
    public void addRate(String rater, int rating){
        if (!ratings.isEmpty()) {
            if(ratings.containsKey(rater.replace('.', '_'))){
                this.rating *= 2;
                this.rating -= ratings.get(rater.replace('.', '_'));
            }
            this.rating = (this.rating + rating) / 2;
        }
        else
            this.rating = rating;
        ratings.put(rater.replace('.','_'), rating);
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
        commentList.add(0, comment);
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
    public List<String> getJson() { return json; }
    public void setJson(List<String> json) { this.json = json; }
    public boolean getIsCanvas() { return isCanvas; }
    public void setIsCanvas(boolean canvas) { this.isCanvas = canvas; }

    public String getGetRequest(){
        return "/comic?series_title=" + seriesTitle + "&issue_title=" + issueTitle + "&volume=" + volume + "&issue=" + issue;
    }
    public String getPostRequest(){
        return  "<input type=\"hidden\" name=\"series_title\" value=\"" + seriesTitle + "}\">\n" +
                "<input type=\"hidden\" name=\"issue_title\" value=\""+ issueTitle +"\">\n" +
                "<input type=\"hidden\" name=\"volume\" value=\"" + volume + "\">\n" +
                "<input type=\"hidden\" name=\"issue\" value=\"" + issue + "\">\n";
    }
}
