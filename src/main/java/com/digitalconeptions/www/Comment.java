package com.digitalconeptions.www;

/**
 * Created by stevenliao on 4/14/16.
 */
public class Comment
{
    UserInfo userInfo;
    String comment;

    public Comment() {}
    public Comment(UserInfo userInfo, String comment)
    {
        this.userInfo = userInfo;
        this.comment = comment;
    }

}
