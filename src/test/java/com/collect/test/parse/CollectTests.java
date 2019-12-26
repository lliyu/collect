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
        step.setAddr("https://tieba.baidu.com${url}");
        step.setName("笑话吧item采集");
        step.setIndex(2);
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
    public void get() throws InterruptedException {
        Thread.sleep(4000);
        CollectDto collect = collectService.getCollectInfoById(1l);
    }
}
