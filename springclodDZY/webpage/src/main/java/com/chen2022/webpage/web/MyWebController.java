package com.chen2022.webpage.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MyWebController {

    @RequestMapping("/index")
    public String index(){
        System.out.println("index");
        return "index";
    }

    @RequestMapping("/test")
    public String test01(){
        System.out.println("test");
        return "mytest/test";
    }
}
