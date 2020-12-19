package com.collect.test.parse;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.site.collect.SiteApplication;
import com.site.collect.constant.RabbitConstant;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.entity.collect.Item;
import com.site.collect.pojo.dto.CollectDto;
import com.site.collect.service.CollectService;
import com.site.collect.service.CollectStepService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SiteApplication.class)
public class CollectTests {

    @Autowired
    private CollectService collectService;
    @Autowired
    private CollectStepService collectStepService;

    @Autowired
    private RabbitTemplate rabbitTemplate;

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

        //第三步
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("${url}");
        step.setName("meitu采集");
        step.setIndex(3);

        item = new Item();
        item.setName("pid,name");
        item.setValue("<p class=[\"]?p_title[\"]><a href=\"https://www.meitulu.com/item/(.*?).html\".*?>(.*?)</a>");
        list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));
        objects.add(step);

        //第四步
        //https://www.meitulu.com/item/20197_2.html
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://www.meitulu.com/item/${pid}.html");
        step.setName("meitu-item-page");
        step.setIndex(4);

        item = new Item();
        item.setName("page");
        item.setValue("<title>.*?/(.*?)页_美图录</title>");
        list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));
        objects.add(step);

        //第五步
        //https://www.meitulu.com/item/20197_2.html
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://www.meitulu.com/item/${pid}_${page}.html");
        step.setName("meitu-item-分页");
        step.setIndex(5);
        step.setPage(true);
        objects.add(step);

        //第六步
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("${url}");
        step.setName("meitu-item采集");
        step.setIndex(6);
        step.setEnd(true);

        item = new Item();
        item.setName("img");
        item.setValue("<img src=\"(.*?)\".*?class=\"content_img\".*?>");
        list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));

        objects.add(step);

        collectStepService.addSteps(objects);
    }

    @Test
    public void addQiubaiCollectSteps(){

        CollectDto dto = collectService.getCollectInfoById(10l);

//        //添加一个collect
//        CollectDto dto = new CollectDto();
//        dto.setCreateTime(new Date());
//        dto.setUpdateTime(new Date());
//        dto.setName("qiubai");
//        dto.setStep(2);
//        Long aLong = collectService.add(dto);
//        dto.setId(aLong);
        //添加步骤
        CollectStep step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://www.qiushibaike.com/video/");
        step.setName("糗百主页e采集");
        step.setIndex(1);

        Item item = new Item();
        item.setName("page");
        item.setValue("<span class=\"page-numbers\">[\\s\\S](.*?)[\\s\\S]</span>");
        ArrayList<Item> list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));

        ArrayList<CollectStep> objects = Lists.newArrayList();
        objects.add(step);

        //第二步
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://www.qiushibaike.com/video/page/${page}/");
        step.setName("分页处理");
        step.setIndex(2);
        step.setPage(true);
        objects.add(step);

        //第三步
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("${url}");
        step.setName("糗百故事采集");
        step.setIndex(3);
        step.setMode(1);
        step.setEnd(true);
        step.setFormatMode(0);
        step.setFormat("http:${video}");

        item = new Item();
        item.setName("video");
        //[{"name":"video","value":"<div class="article block untagged mb15.*?>[\s\S]*?<source src="(.*?)" type="video/mp4">"}]
        item.setValue("<div class=\"article block untagged mb15.*?>[\\s\\S]*?<source src=\"(.*?)\" type=\"video/mp4\">");
        list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));
        objects.add(step);

        collectStepService.addSteps(objects);
    }

    @Test
    public void addkkuCollectSteps(){

        //添加一个collect
        CollectDto dto = new CollectDto();
        dto.setCreateTime(new Date());
        dto.setUpdateTime(new Date());
        dto.setName("hukk");
        dto.setStep(2);
        Long aLong = collectService.add(dto);
        dto.setId(aLong);
        //添加步骤
        CollectStep step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://16hukk.com/vodtypehtml/32.html");
        step.setName("hukk-page采集");
        step.setIndex(1);

        Item item = new Item();
        item.setName("page");
        item.setValue("<li class=\"visible-xs\"><a>1/(.*?)</a></li>");
        ArrayList<Item> list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));

        ArrayList<CollectStep> objects = Lists.newArrayList();
        objects.add(step);

        //第二步
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://16hukk.com/vodtypehtml/32-${page}.html");
        step.setName("分页处理");
        step.setIndex(2);
        step.setPage(true);
        objects.add(step);

        //第三步
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("${url}");
        step.setName("hukk-item采集");
        step.setIndex(3);
        step.setEnd(true);

        item = new Item();
        item.setName("img,url,name");
        //<a class=\"video-pic loading\" data-original=\"(.*?)\" title=\"(.*?)\".*?>
        item.setValue("<a class=\"video-pic loading\" data-original=\"(.*?)\" href=\"(.*?)\" title=\"(.*?)\".*?>");
        list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));
        objects.add(step);

        collectStepService.addSteps(objects);
    }

    @Test
    public void addChottieCollectSteps(){

        //添加一个collect
        CollectDto dto = new CollectDto();
        dto.setCreateTime(new Date());
        dto.setUpdateTime(new Date());
        dto.setName("chottie");
        dto.setStep(3);
        Long aLong = collectService.add(dto);
        dto.setId(aLong);
        //添加步骤
        CollectStep step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("https://chottie.com/blog/?s=%E6%9C%B1%E5%8F%AF%E5%84%BF");
        step.setName("chottie采集");
        step.setIndex(1);

        Item item = new Item();
        item.setName("url,name");
        item.setValue("<h2 class=\"entry-title\"><a href=\"(.*?)\" rel=\"bookmark\">(.*?)</a></h2>");
        ArrayList<Item> list = Lists.newArrayList();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));

        ArrayList<CollectStep> objects = Lists.newArrayList();
        objects.add(step);

        //第二步
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("${url}");
        step.setName("item分页采集");
        step.setIndex(2);

        item = new Item();
        item.setName("itemurl");
        item.setValue("<a href=\"(.*?)\" class=\"post-page-numbers\">");
        list.clear();
        list.add(item);
        step.setValue(JSONObject.toJSONString(list));

        objects.add(step);

        //第三步
        step = new CollectStep();
        step.setCollectId(dto.getId());
        step.setAddr("${itemurl}");
        step.setName("图片下载");
        step.setIndex(3);
        step.setEnd(true);

        item = new Item();
        item.setName("img");
        item.setValue("<a href=\"(.*?)\" target=\"_blank\" title=\"Click to see high quality photo\">");
        list.clear();
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

    @Test
    public void push() throws InterruptedException {
        //创建一条数据
        CollectStep step = new CollectStep();
        step.setCollectId(5l);
        step.setIndex(2);
        CollectStep stepByCidAndIndex = collectStepService.getStepByCidAndIndex(step);

        HashMap<String, Object> objectObjectHashMap = Maps.newHashMap();
        objectObjectHashMap.put("step", stepByCidAndIndex);
        objectObjectHashMap.put("pid", "14274");
        objectObjectHashMap.put("name", "[YouMi尤蜜荟] Vol.132 女神@妲己_Toxic");
        rabbitTemplate.convertAndSend(RabbitConstant.STEP_DATA_EXCHANGE, RabbitConstant.STEP_QUEUE_ROUTINGKEY, objectObjectHashMap);
        Thread.sleep(20000);
    }

    @Test
    public void pushPage() throws InterruptedException {
        //创建一条数据
        CollectStep step = new CollectStep();
        step.setCollectId(5l);
        step.setIndex(1);
        CollectStep stepByCidAndIndex = collectStepService.getStepByCidAndIndex(step);

        HashMap<String, Object> objectObjectHashMap = Maps.newHashMap();
        objectObjectHashMap.put("step", stepByCidAndIndex);
        objectObjectHashMap.put("url", "https://www.meitulu.com/t/1425/");
//        objectObjectHashMap.put("name", "[YouMi尤蜜荟] Vol.132 女神@妲己_Toxic");
        rabbitTemplate.convertAndSend(RabbitConstant.STEP_DATA_EXCHANGE, RabbitConstant.STEP_QUEUE_ROUTINGKEY, objectObjectHashMap);
//        Thread.sleep(20000);
    }

    @Test
    public void testInsertMap(){
        HashMap<String, String> objectObjectHashMap = new HashMap<>(5);
        objectObjectHashMap.put("1", "1");
        objectObjectHashMap.put("2", "1");
        objectObjectHashMap.put("3", "1");
        objectObjectHashMap.put("4", "1");
        objectObjectHashMap.put("5", "1");
        System.out.println(objectObjectHashMap);
    }
}
