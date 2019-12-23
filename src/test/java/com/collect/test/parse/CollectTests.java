package com.collect.test.parse;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.site.collect.SiteApplication;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.entity.collect.Item;
import com.site.collect.pojo.dto.CollectDto;
import com.site.collect.service.CollectService;
import com.site.collect.service.CollectStepService;
import org.checkerframework.checker.units.qual.C;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SiteApplication.class)
public class CollectTests {

    @Autowired
    private CollectService collectService;
    @Autowired
    private CollectStepService collectStepService;

    @Test
    public void addCollectSteps(){
        CollectDto collect = collectService.getCollectInfoById(1l);

        //添加步骤
        CollectStep step = new CollectStep();
        step.setCollectId(collect.getId());
        step.setAddr("https://tieba.baidu.com/f?kw=%D0%A6%BB%B0&fr=ala0&tpl=5");
        step.setName("笑话吧采集");
        step.setIndex(1);
        Item item1 = new Item();
        item1.setName("名称");
        item1.setValue("//li/div/div[2]/div[1]/div[1]/a[@class=\"j_th_tit\"]");
        Item item2 = new Item();
        item2.setName("链接");
        item2.setValue("//li/div/div[2]/div[1]/div[1]/a[@class=\"j_th_tit\"]/@href");
        ArrayList<Item> items = Lists.newArrayList();
        items.add(item1);
        items.add(item2);
        step.setValue(JSONObject.toJSONString(items));

        ArrayList<CollectStep> objects = Lists.newArrayList();
        objects.add(step);
        collectStepService.addSteps(objects);
    }
}
