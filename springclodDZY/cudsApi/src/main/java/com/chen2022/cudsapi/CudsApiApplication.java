package com.chen2022.cudsapi;

import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.annotation.MapperScans;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@MapperScan("com.chen2022.cudsapi.mapper")
@EnableCaching  //开启基于注解的缓存支持
@SpringBootApplication
public class CudsApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(CudsApiApplication.class, args);
    }

}
