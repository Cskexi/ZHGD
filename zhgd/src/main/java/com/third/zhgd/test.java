package com.third.zhgd;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/demo")
public class test {

    @RequestMapping("/index")
    public String index(){
        return "Hello, world!";

    }
}