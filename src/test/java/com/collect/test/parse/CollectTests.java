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

        CollectDto collect = collectService.getCollectInfoById(1l);

        //添加步骤
        //第一步
        CollectStep step = new CollectStep();
        step.setCollectId(collect.getId());
        step.setAddr("https://tieba.baidu.com/f?kw=%E7%BE%8E%E5%A5%B3&ie=utf-8");
        step.setName("贴吧采集");
        step.setIndex(1);
        //<div.*?d_post_content j_d_post_content[\s\S]*?>.*?[\r\n]*?</div>
//        step.setValue("<div.*?d_post_content j_d_post_content[\\s\\S]*?>(.*?)[\\s\\S]*?</div>");

        //<a href="//tieba.baidu.com/f?kw=%E7%BE%8E%E5%A5%B3&amp;ie=utf-8&amp;pn=2021150" class="last pagination-item ">尾页</a>
        Item item = new Item();
        item.setName("page");
        item.setValue("<a.*?pn=(.*?)\" class=\"last pagination-item \">");
        ArrayList<Item> list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));
        ArrayList<CollectStep> objects = Lists.newArrayList();
        objects.add(step);


        //第二步
        step = new CollectStep();
        step.setCollectId(collect.getId());
        step.setAddr("https://tieba.baidu.com/f?kw=%E7%BE%8E%E5%A5%B3&ie=utf-8&pn=${page}");
        step.setName("分页处理");
        step.setIndex(2);
        step.setPage(true);
        objects.add(step);

        //第三步
        step = new CollectStep();
        step.setCollectId(collect.getId());
        step.setAddr("${url}");
        step.setName("贴吧-item采集");
        step.setIndex(3);

        item = new Item();
        item.setName("url,name");
        item.setValue("<div class=\"threadlist_title pull_left j_th_tit \">[\\s]*<a.*?href=\"(.*?)\".*?>(.*?)</a>[\\S\\s]*?</div>");
        list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));

        objects.add(step);

        //第四步
        step = new CollectStep();
        step.setCollectId(collect.getId());
        step.setAddr("https://tieba.baidu.com${url}?pn=${page}");
        step.setName("贴吧-item采集");
        step.setIndex(4);

        item = new Item();
        item.setName("url,name");
        item.setValue("<div id=\"post_content.*?d_post_content j_d_post_content.*?>(.*?)</div>");
        list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));
        objects.add(step);

        collectStepService.addSteps(objects);
    }


    @Test
    public void addMeituCollectSteps(){

        CollectDto dto = collectService.getCollectInfoById(5l);

//        //添加一个collect
//        CollectDto dto = new CollectDto();
//        dto.setCreateTime(new Date());
//        dto.setUpdateTime(new Date());
//        dto.setName("meitu");
//        dto.setStep(2);
//        Long aLong = collectService.add(dto);
//        dto.setId(aLong);
        //添加步骤
        CollectStep step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://www.meitulu.com/guochan/");
        step.setName("meitu-page采集");
        step.setIndex(1);

        Item item = new Item();
        item.setName("page");
        item.setValue("<a class=\"a1\">(.*?)条</a>");
        ArrayList<Item> list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));

        ArrayList<CollectStep> objects = Lists.newArrayList();
        objects.add(step);

        //第二步
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://www.meitulu.com/guochan/${page}.html");
        step.setName("分页处理");
        step.setIndex(2);
        step.setPage(true);
        objects.add(step);

        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("${url}");
        step.setName("meitu采集");
        step.setIndex(3);

        item = new Item();
        item.setName("website,name");
        item.setValue("<p class=p_title><a href=\"(.*?)\".*?>(.*?)</a>");
        list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));
        objects.add(step);

        //第三步
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("${website}");
        step.setName("meitu-item采集");
        step.setIndex(4);

        item = new Item();
        item.setName("img");
        item.setValue("<img src=\"(.*?)\" class=\"content_img\".*?>");
        list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));

        objects.add(step);

        collectStepService.addSteps(objects);
    }

    @Test
    public void get() throws InterruptedException {
        Thread.sleep(40000);
        CollectDto collect = collectService.getCollectInfoById(1l);
    }
}
