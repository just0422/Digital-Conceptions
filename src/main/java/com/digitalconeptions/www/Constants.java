package com.digitalconeptions.www;

import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.LoadType;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * Created by justin on 5/8/16.
 */
public class Constants {
    public static final String action = "Action";
    public static final String comedy = "Comedy";
    public static final String drama = "Drama";
    public static final String fantasy = "Fantasy";
    public static final String horror = "Horror";
    public static final String romance = "Romance";
    public static final String sports = "Sports";

    public static final String series_title = "series_title";
    public static final String seriesTitle = "seriesTitle";
    public static final String issue_title = "issue_title";
    public static final String issueTitle = "issueTitle";
    public static final String volume = "volume";
    public static final String issue = "issue";

    public static final String username = "username";

    public static ArrayList genres = new ArrayList(){{
        add(action);
        add(comedy);
        add(drama);
        add(fantasy);
        add(horror);
        add(romance);
        add(sports);
    }};

    public static List randomGenres(int count){
     
        Collections.shuffle(genres);
        return genres.subList(0, count);
    }

    public static String[] GENRES = {"action", "comedy", "drama", "fantasy", "horror", "romance", "sports"};

    public static void subscriptionNotifications(ComicInfo comicInfo, String seriesTitle, String action){
        System.out.println(Constants.class.getName());
        SeriesInfo seriesInfo = ObjectifyService.ofy().load().type(SeriesInfo.class)
                .filter(Constants.seriesTitle, seriesTitle).first().now();
        LoadType<UserInfo> usersLoad = ObjectifyService.ofy().load().type(UserInfo.class);

        if (seriesInfo == null) {
            SeriesInfo newSeriesInfo = new SeriesInfo(seriesTitle);
            ObjectifyService.ofy().save().entity(newSeriesInfo);
        }
        else {
            System.out.println(seriesInfo.getSubscribedUsers().size());
            for (String user : seriesInfo.getSubscribedUsers()) {
                UserInfo userInfo = usersLoad.filter(Constants.username, user).first().now();
                System.out.println(user);

                userInfo.addUnreadNotification(
                        "Subscriptions||" + new Date().toString() + "||" + comicInfo.getUsername()
                                + " has" + action + "<a href=\"" + comicInfo.getGetRequest()
                                + "\">" + comicInfo.seriesTitle + " " + comicInfo.issueTitle
                                + "</a>||" + new SimpleDateFormat("E MM/dd/yyyy HH:mm:ss")
                                .format(new Date()));

                ObjectifyService.ofy().save().entity(userInfo).now();
            }
        }
    }
}
