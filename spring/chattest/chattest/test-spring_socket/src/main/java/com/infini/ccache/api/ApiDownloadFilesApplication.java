package com.infini.ccache.api;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * The Class ApiDownloadFilesApplication.
 */
@SpringBootApplication
public class ApiDownloadFilesApplication extends SpringBootServletInitializer {

    /**
     * The main method.
     *
     * @param args the arguments
     */
    public static void main(String[] args) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        System.setProperty("current.date.time", dateFormat.format(new Date()));
        SpringApplication.run(ApiDownloadFilesApplication.class, args);
        System.out.println("SurchargeApplication now running....");
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * org.springframework.boot.web.servlet.support.SpringBootServletInitializer#
     * configure(org.springframework.boot.builder.SpringApplicationBuilder)
     */
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(ApiDownloadFilesApplication.class);
    }
}