package com.site.collect.service.ipml;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.entity.collect.Item;
import com.site.collect.mapper.CollectStepMapper;
import com.site.collect.pojo.dto.CollectDto;
import com.site.collect.service.CollectService;
import com.site.collect.service.ParseSiteService;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.seimicrawler.xpath.JXDocument;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.entity.Example;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public class ParseSiteServiceImpl implements ParseSiteService {

    private static ExecutorService collectExecutorService = Executors.newFixedThreadPool(10);
    private static ExecutorService parseExecutorService = Executors.newFixedThreadPool(10);

    @Autowired
    private CollectService collectService;

    @Autowired
    private CollectStepMapper collectStepMapper;

    @Override
    public void parse(List<Long> ids) {
        ids.stream().forEach(id -> {
            //根据id查询任务
            CollectDto collectInfo = collectService.getCollectInfoById(id);
            //将任务添加到线程池中
            Runnable collectTask = () -> {
                //任务过程中流程比较长 并且不同流程可以同步进行(只要mq中存在消息)
                //这里是所有任务共用一个线程池 还是不同任务有不同的线程池? 目前分为两种线程池

                //第一步和后面过程不太一样
                //第一步数据完全有用户界面的数据提供
                //后面过程可能需要从mq中读取前面过程解析出的数据
                for (int i = 0; i < collectInfo.getStep(); i++) {
                    CollectStep collectStep = getCollectStep(i);
                    if (collectStep != null) {
                        parseStep(collectStep);

                    }
                }
            };

            collectExecutorService.execute(collectTask);
        });
    }

    private void parseStep(CollectStep collectStep) {
        List<Item> items = obtainItems(collectStep);

        HashMap<String, String> objectObjectHashMap = Maps.newHashMap();
        objectObjectHashMap.put("accept", "*/*");
        objectObjectHashMap.put("connection", "Keep-Alive");
        objectObjectHashMap.put("user-agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36");

        //对每一个item进行解析
        HashMap<String, Object> itemValueMaps = Maps.newHashMap();
        if (items != null) {
            Runnable parse = () -> {
                items.stream().forEach(item -> {
                    //到这一步的时候url一定是完整的 可以获取到内容的url
                    try {
                        //开始解析，获取一个document对象 解析后的内容放入map中
                        Document document = Jsoup.connect(collectStep.getAddr()).headers(objectObjectHashMap).get();
                        JXDocument jxDocument = JXDocument.create(document);
                        List<Object> res = jxDocument.sel(collectStep.getValue());
                        itemValueMaps.put(collectStep.getName(), res);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    System.out.println(itemValueMaps);
                });
            };
            parseExecutorService.execute(parse);
        }
    }

    private CollectStep getCollectStep(int i) {
        //查询当前步骤信息
        Example example = new Example(CollectStep.class);
        example.createCriteria().andEqualTo("index", i);
        return collectStepMapper.selectOneByExample(example);
    }

    private List<Item> obtainItems(CollectStep collectStep) {
        //解析具体的步骤
        String value = collectStep.getValue();
        List<Item> items = null;
        if (StringUtils.isNotBlank(value)) {
            //从value中获取item集合
            items = JSONObject.parseArray(value, Item.class);
        }
        return items;
    }
}
