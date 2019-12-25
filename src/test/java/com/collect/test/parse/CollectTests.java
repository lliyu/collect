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
        step.setAddr("https://tieba.baidu.com/f?kw=%D0%A6%BB%B0&fr=ala0&tpl=5");
        step.setName("笑话吧item采集");
        step.setIndex(2);
        step.setValue("<div class=\"threadlist_title pull_left j_th_tit \">[\\s]*<a.*?href=\"(.*?)\">(.*?)</a>[\\S\\s]*?</div>");

        Item item = new Item();
        item.setName("名称");
        Item item1 = new Item();
        item1.setName("连接");
        ArrayList<Item> list = Lists.newArrayList();
        list.add(item);
        list.add(item1);

        step.setMapping(JSONObject.toJSONString(list));

        ArrayList<CollectStep> objects = Lists.newArrayList();
        objects.add(step);
        collectStepService.addSteps(objects);
    }
}
