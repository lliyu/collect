package com.site.collect.service.ipml;

import com.google.common.collect.Maps;
import com.site.collect.constant.RabbitConstant;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.entity.collect.Item;
import com.site.collect.mapper.CollectStepMapper;
import com.site.collect.pojo.dto.CollectDto;
import com.site.collect.service.CollectService;
import com.site.collect.service.ParseSiteService;
import com.site.collect.utils.RegexUtils;
import com.site.collect.utils.data.ParseUtils;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.seimicrawler.xpath.JXDocument;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;

@Service
public class ParseSiteServiceImpl implements ParseSiteService {

    private static ExecutorService collectExecutorService = Executors.newFixedThreadPool(10);
    private static ExecutorService parseExecutorService = Executors.newFixedThreadPool(10);

    @Autowired
    private CollectService collectService;

    @Autowired
    private CollectStepMapper collectStepMapper;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Override
    public void parse(List<Long> ids) {
        ids.stream().forEach(id -> {
            //根据id查询任务
            CollectDto collectInfo = collectService.getCollectInfoById(id);
            //将任务添加到线程池中
                //任务过程中流程比较长 并且不同流程可以同步进行(只要mq中存在消息)
                //这里是所有任务共用一个线程池 还是不同任务有不同的线程池? 目前分为两种线程池

                //第一步和后面过程不太一样
                //第一步数据完全有用户界面的数据提供
                //后面过程可能需要从mq中读取前面过程解析出的数据
            CollectStep collectStep = getCollectStep(1, collectInfo.getId());
            if (collectStep != null) {
                parseStep(collectStep);
            }
            for (int i = 1; i <= collectInfo.getStep(); i++) {
                }
//            Runnable collectTask = () -> {
//            };
//            collectExecutorService.execute(collectTask);
        });
    }


    @Override
    public void parseStep(CollectStep collectStep) {

        //对每一个item进行解析
        try {
            regexParse(collectStep);
        } catch (IOException e) {
            e.printStackTrace();
        }
        ;
//        if (items != null) {
//                items.stream().forEach(item -> {
//                    //到这一步的时候url一定是完整的 可以获取到内容的url
//                    try {
//                        regexParse(collectStep, itemValueMaps, item);
//                    } catch (IOException e) {
//                        e.printStackTrace();
//                    }
//                    System.out.println(itemValueMaps);
//                });
//            Runnable parse = () -> {
//            };
//            parseExecutorService.execute(parse);
//        }
    }

    private void regexParse(CollectStep collectStep) throws IOException {

        String html = ParseUtils.readHtml(collectStep.getName());
        if (StringUtils.isBlank(html)) {
            //读取为html文件
            html = ParseUtils.testOnlineSite(collectStep.getAddr(), collectStep.getName());
        }

        List<HashMap<String, Object>> hashMaps = ParseUtils.regexParseSite(html, collectStep);
//        hashMaps = hashMaps.stream().filter(stringObjectHashMap -> RegexUtils.isWebSite(String.valueOf(stringObjectHashMap.get("url")))).collect(Collectors.toList());
        //将map中的数据推向mq
        hashMaps.stream().forEach(hashMap -> {
            hashMap.put("step", collectStep);
//            System.out.println("推送消息到mq:" + hashMap);
            rabbitTemplate.convertAndSend(RabbitConstant.STEP_DATA_EXCHANGE, RabbitConstant.STEP_QUEUE_ROUTINGKEY, hashMap);

        });

    }

    private void xpathParse(CollectStep collectStep, HashMap<String, Object> itemValueMaps, Item item) throws IOException {
        HashMap<String, String> objectObjectHashMap = Maps.newHashMap();
        objectObjectHashMap.put("accept", "*/*");
        objectObjectHashMap.put("connection", "Keep-Alive");
        objectObjectHashMap.put("user-agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36");

        //开始解析，获取一个document对象 解析后的内容放入map中
        Document document = Jsoup.connect(collectStep.getAddr()).headers(objectObjectHashMap).get();

        JXDocument jxDocument = JXDocument.create(document);
        List<Object> res = jxDocument.sel(item.getValue());
        itemValueMaps.put(item.getName(), res);
    }

    private CollectStep getCollectStep(int index, long cid) {
        //查询当前步骤信息
        Example example = new Example(CollectStep.class);
        example.createCriteria().andEqualTo("index", index).andEqualTo("collectId", cid);
        return collectStepMapper.selectOneByExample(example);
    }


}
