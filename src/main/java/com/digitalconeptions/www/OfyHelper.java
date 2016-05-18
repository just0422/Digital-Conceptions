package com.digitalconeptions.www;

import com.googlecode.objectify.ObjectifyService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Created by justin on 4/7/16.
 */
public class OfyHelper implements ServletContextListener {
    public void contextInitialized(ServletContextEvent event) {
        ObjectifyService.register(ComicInfo.class);
        ObjectifyService.register(UserInfo.class);
        ObjectifyService.register(SeriesInfo.class);
    }

    public void contextDestroyed(ServletContextEvent event) {
        // App Engine does not currently invoke this method.
    }

}
