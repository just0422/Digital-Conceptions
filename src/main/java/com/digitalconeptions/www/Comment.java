package com.digitalconeptions.www;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by stevenliao on 4/14/16.
 */
public class Comment
{
    String user;
    String comment;
    Date date;

    public Comment() {
        this.user = null;
        this.comment= null;
        date = new Date();
    }
    public Comment(String user, String comment)
    {
        this();
        this.user = user;
        this.comment = comment;
    }
    public String getDateFormat() {
        SimpleDateFormat format = new SimpleDateFormat("E MM/dd/yyyy");
        return format.format(this.date);
    }

    public String getUser() { return user; }
    public void setUser(String user) { this.user = user; }
    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }
    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
}
