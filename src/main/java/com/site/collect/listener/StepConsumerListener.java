package com.site.collect.listener;

import com.site.collect.constant.RabbitConstant;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.service.CollectStepService;
import com.site.collect.service.ParseSiteService;
import com.site.collect.utils.DownloadUtils;
import com.site.collect.utils.PageDealUtils;
import com.site.collect.utils.RegexUtils;
import com.site.collect.utils.data.ParseUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Configuration
public class StepConsumerListener {

    @Autowired
    private CollectStepService collectStepService;

    @Autowired
    private ParseSiteService parseSiteService;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Autowired
    private RedisTemplate redisTemplate;

    @RabbitListener(queues = RabbitConstant.STEP_DATA_QUEUE)
    public void process(Map<String, Object> map) throws IOException {
//        Map<String, Object> map = (Map<String, Object>) message;
        //开始消费消息
        //数据库中存的可能是含有解析式的内容 需要先将解析式中的表达式换成具体的内容
        //通过map中的stepid取到当前内容是哪一个步骤中的

        Object step = map.get("step");

        if (step != null && step instanceof CollectStep) {
            CollectStep collectStep = (CollectStep) step;
            CollectStep parseStep = collectStepService.getStepByCidAndIndex(collectStep);

            if(parseStep.isPage()){
                List<Map<String, Object>> maps = PageDealUtils.pageReplace(parseStep, map);

//                Map<String, Object> stringObjectMap = maps.get(0);
//                stringObjectMap.put("step", parseStep);
//                rabbitTemplate.convertAndSend(RabbitConstant.STEP_DATA_EXCHANGE, RabbitConstant.STEP_QUEUE_ROUTINGKEY, stringObjectMap);
                maps.stream().forEach(hashMap -> {
                    hashMap.put("step", parseStep);
                    rabbitTemplate.convertAndSend(RabbitConstant.STEP_DATA_EXCHANGE, RabbitConstant.STEP_QUEUE_ROUTINGKEY, hashMap);
                });
                return;
            }
            if (parseStep != null) {
                //将内容进行替换
                parseStep.setAddr(RegexUtils.matchExpression(parseStep.getAddr(), map));
                //todo
            }
            //开始解析

            String html = null;
//            String html = ParseUtils.readHtml(parseStep.getName());
            if (StringUtils.isBlank(html)) {
                //读取为html文件
            }

            //将结果写入文件  目前直接指定 后续可以做成配置项的形式
            //校验该url是否已经处理过了
            Object url = redisTemplate.opsForValue().get(parseStep.getAddr());
            if (url == null) {
                redisTemplate.opsForValue().set(parseStep.getAddr(), 1);
            }else {
                System.out.println("丢弃:" + parseStep.getAddr());
                return;
            }

            html = ParseUtils.testOnlineSite(parseStep.getAddr(), parseStep.getName());
            String filename = parseStep.getName() + ".md";
            List<HashMap<String, Object>> hashMaps = ParseUtils.regexParseSite(html, parseStep, map);
            hashMaps.stream().forEach(hashMap -> {
                try {
                    if (parseStep.isEnd()) {
                        //todo 这里的获取参数不是指接写死的
                        StringBuilder sb = new StringBuilder();
                        //[name]()
                        sb.append("[").append(hashMap.get("name")).append("](");

                        String content = String.valueOf(hashMap.get("img"));
                        content = RegexUtils.replaceLineSp(content);
                        content = RegexUtils.replaceTitle(content);
                        content = content.replaceAll("\\s", "");
                        Object res = redisTemplate.opsForValue().get(content);
                        if (res == null) {
                            redisTemplate.opsForValue().set(content, 1);
                        }else {
                            System.out.println("丢弃:" + content);
                            return;
                        }
                        Thread.sleep(500);
//                        parseStep.setName(String.valueOf(map.get("name")));
//                        DownloadUtils.downloadImg(parseStep, content);
                        sb.append("https://www.16hukk.com" + hashMap.get("url")).append(")");
                        sb.append("\r\n");
                        sb.append("![](" + content).append(")<hr>");
                      ParseUtils.write2File(filename, sb.toString());
                    }else {
                        hashMap.put("step", parseStep);
                        //不是最后一步 写入mq
                        rabbitTemplate.convertAndSend(RabbitConstant.STEP_DATA_EXCHANGE, RabbitConstant.STEP_QUEUE_ROUTINGKEY, hashMap);
                    }

                } catch (IOException | InterruptedException e) {
                    e.printStackTrace();
                }
            });
        }

    }
}
