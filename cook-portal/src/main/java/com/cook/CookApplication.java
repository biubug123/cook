package com.cook;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * @program: cook-root
 * @description: 项目启动入口
 * @author: ziHeng
 * @create: 2018-05-03 15:18
 **/
@SpringBootApplication
@MapperScan("com.cook.dao") //dao层扫描
public class CookApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(CookApplication.class);
    }



    public static void main(String[] args) {
        SpringApplication.run(CookApplication.class, args);
    }


}
