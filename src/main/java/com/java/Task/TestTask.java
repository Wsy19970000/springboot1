package com.java.Task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class TestTask {

    @Scheduled(cron = "*/2 * * * * *")
    public void print(){
       // System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
    }
}
