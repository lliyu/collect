package com.site.collect.listener;

import com.site.collect.constant.RabbitConstant;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

@Configuration
public class StepConsumerListener {

    @RabbitListener(queues = RabbitConstant.STEP_DATA_QUEUE)
    public void process(Map<String, Object> map) {
        System.out.println("消费消息:" + map);
        //开始消费消息 todo
    }
}
