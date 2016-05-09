package com.digitalconeptions.www;

import java.util.ArrayList;
import java.util.Collections;
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
}
