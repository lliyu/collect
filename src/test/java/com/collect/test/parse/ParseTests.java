package com.collect.test.parse;

import com.google.common.collect.Lists;
import com.site.collect.SiteApplication;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.mapper.CollectStepMapper;
import com.site.collect.service.CollectStepService;
import com.site.collect.service.ParseSiteService;
import com.site.collect.utils.data.ParseUtils;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import tk.mybatis.mapper.entity.Example;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SiteApplication.class)
public class ParseTests {

    @Autowired
    private ParseSiteService parseSiteService;

    @Autowired
    private CollectStepMapper collectStepMapper;

    @Test
    public void parse(){
        ArrayList<Long> longs = Lists.newArrayList();
        longs.add(7l);
        parseSiteService.parse(longs);
    }

    @Test
    public void stepParse() throws IOException {
        CollectStep parseStep = collectStepMapper.selectByPrimaryKey(4);
        String html = ParseUtils.readHtml(parseStep.getName());
        if (StringUtils.isBlank(html)) {
            //读取为html文件
            html = ParseUtils.testOnlineSite(parseStep.getAddr(), parseStep.getName());
        }

        List<HashMap<String, Object>> hashMaps = ParseUtils.regexParseSite(html, parseStep, null);
        hashMaps.stream().forEach(hashMap -> {
            System.out.println(hashMap);
        });
    }
}
