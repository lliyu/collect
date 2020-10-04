package com.site.collect.controller;

import com.google.common.collect.Lists;
import com.site.collect.service.ParseSiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
@RequestMapping
public class TestController {

    @Value("${refresh.value}")
    private String value;

    @RequestMapping("/test")
    @ResponseBody
    public String test(Long id){
        ArrayList<Long> longs = Lists.newArrayList();
        longs.add(id);
        parseSiteService.parse(longs);
        return "success";
    }

    @Autowired
    private ParseSiteService parseSiteService;

    @ResponseBody
    @RequestMapping(value = "/parse")
    public String parse(@PathVariable("id") Long id){
        ArrayList<Long> longs = Lists.newArrayList();
        longs.add(id);
        parseSiteService.parse(longs);
        return "success";
    }
}
