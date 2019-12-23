package com.collect.test.parse;

import com.google.common.collect.Lists;
import com.site.collect.SiteApplication;
import com.site.collect.service.ParseSiteService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SiteApplication.class)
public class ParseTests {

    @Autowired
    private ParseSiteService parseSiteService;

    @Test
    public void parse(){
        ArrayList<Long> longs = Lists.newArrayList();
        longs.add(1l);
        parseSiteService.parse(longs);
    }
}
