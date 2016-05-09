package com.digitalconeptions.www;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by justin on 5/8/16.
 */
public class Constants {
    public static final String action = "action";
    public static final String comedy = "comedy";
    public static final String drama = "drama";
    public static final String fantasy = "fantasy";
    public static final String horror = "horror";
    public static final String romance = "romance";
    public static final String sports = "sports";

    public static ArrayList genres = new ArrayList(){{
        add("action");
        add("comedy");
        add("drama");
        add("fantasy");
        add("horror");
        add("romance");
        add("sports");
    }};

    public static List randomGenres(int count){
     
        Collections.shuffle(genres);
        return genres.subList(0, count);
    }

    public static String[] GENRES = {"action", "comedy", "drama", "fantasy", "horror", "romance", "sports"};
}
