package com.site.collect.listener;

import com.site.collect.constant.RabbitConstant;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.service.CollectStepService;
import com.site.collect.service.ParseSiteService;
import com.site.collect.utils.RegexUtils;
import com.site.collect.utils.data.ParseUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

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

    @RabbitListener(queues = RabbitConstant.STEP_DATA_QUEUE)
    public void process(Map<String, Object> map) throws IOException {
//        System.out.println("消费消息:" + map);
        //开始消费消息
        //数据库中存的可能是含有解析式的内容 需要先将解析式中的表达式换成具体的内容
        //通过map中的stepid取到当前内容是哪一个步骤中的

        Object step = map.get("step");

        if (step != null && step instanceof CollectStep) {
            CollectStep collectStep = (CollectStep) step;
            CollectStep parseStep = collectStepService.getStepByCidAndIndex(collectStep);
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
            html = ParseUtils.testOnlineSite(parseStep.getAddr(), parseStep.getName());
            System.out.println(map.get("url"));
            List<HashMap<String, Object>> hashMaps = ParseUtils.regexParseSite(html, parseStep);
            hashMaps.stream().forEach(hashMap -> {
                System.out.println(hashMap);
            });
        }

    }
}
