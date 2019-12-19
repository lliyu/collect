package com.site.collect.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping
public class TestController {

    @Value("${refresh.value}")
    private String value;

    @RequestMapping("/test")
    @ResponseBody
    public String test(){
        return value;
    }
}
