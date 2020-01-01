package com.collect.test.parse;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.site.collect.SiteApplication;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.entity.collect.Item;
import com.site.collect.pojo.dto.CollectDto;
import com.site.collect.service.CollectService;
import com.site.collect.service.CollectStepService;
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

        //添加一个collect
        CollectDto dto = new CollectDto();
        dto.setCreateTime(new Date());
        dto.setUpdateTime(new Date());
        dto.setName("meitu");
        dto.setStep(2);
        collectService.add(new CollectDto());

//        CollectDto collect = collectService.getCollectInfoById(1l);

        //添加步骤
        CollectStep step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://www.meitulu.com/guochan/");
        step.setName("meitu采集");
        step.setIndex(1);
        //<div.*?d_post_content j_d_post_content[\s\S]*?>.*?[\r\n]*?</div>
        step.setValue("<div.*?d_post_content j_d_post_content[\\s\\S]*?>(.*?)[\\s\\S]*?</div>");

        Item item = new Item();
        item.setName("content");
        ArrayList<Item> list = Lists.newArrayList();
        list.add(item);

        step.setMapping(JSONObject.toJSONString(list));

        ArrayList<CollectStep> objects = Lists.newArrayList();
        objects.add(step);
        collectStepService.addSteps(objects);
    }


    @Test
    public void addMeituCollectSteps(){

        //添加一个collect
        CollectDto dto = new CollectDto();
        dto.setCreateTime(new Date());
        dto.setUpdateTime(new Date());
        dto.setName("meitu");
        dto.setStep(2);
        Long aLong = collectService.add(dto);
        dto.setId(aLong);
        //添加步骤
        CollectStep step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://www.meitulu.com/guochan/");
        step.setName("meitu采集");
        step.setIndex(1);
        step.setValue("<p class=p_title><a href=\"https://www.meitulu.com/item/(.*?).html\".*?>(.*?)</a>");

        Item item = new Item();
        item.setName("pid");
        Item item1 = new Item();
        item1.setName("name");
        ArrayList<Item> list = Lists.newArrayList();
        list.add(item);
        list.add(item1);

        step.setMapping(JSONObject.toJSONString(list));

        ArrayList<CollectStep> objects = Lists.newArrayList();
        objects.add(step);
        collectStepService.addSteps(objects);

        //second
        CollectStep step1 = new CollectStep();
        step1.setCollectId(dto.getId());
        step1.setAddr("https://www.meitulu.com/item/${pid}_{page}.html");//https://www.meitulu.com/item/${pid}_{page}.html
        step1.setName("meitu-item采集");
        step1.setIndex(2);
        step1.setValue("<img src=\"(.*?)\" class=\"content_img\".*?>");

        item = new Item();
        item.setName("img");
        list = Lists.newArrayList();
        list.add(item);

        step1.setMapping(JSONObject.toJSONString(list));

        objects = Lists.newArrayList();
        objects.add(step1);
        collectStepService.addSteps(objects);
    }

    @Test
    public void get() throws InterruptedException {
        Thread.sleep(40000);
        CollectDto collect = collectService.getCollectInfoById(1l);
    }
}
