package com.java.application;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication(scanBasePackages = "com.java.*")
//@EnableAutoConfiguration
@MapperScan(basePackages = "com.java.mapper")
//配置组件，过滤器
@ServletComponentScan
//开启定时器任务
@EnableScheduling
@Controller
public class StartApplication {
    public static void main(String[] args) {
        SpringApplication.run(StartApplication.class);
    }

    //配置默认访问首页
    @RequestMapping("/")
    public String index(){
        return "login.jsp";
    }
}
