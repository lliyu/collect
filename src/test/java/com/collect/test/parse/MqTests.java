package com.collect.test.parse;

import com.site.collect.SiteApplication;
import com.site.collect.constant.RabbitConstant;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SiteApplication.class)
public class MqTests {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Test
    public void send(){
//        Message message = new Message("hello".getBytes(), new MessageProperties());
        rabbitTemplate.convertAndSend(RabbitConstant.STEP_DATA_EXCHANGE, RabbitConstant.STEP_QUEUE_ROUTINGKEY, "hello1");
//        for (int i = 0; i < 10; i++) {
//            rabbitTemplate.convertAndSend(RabbitConstant.STEP_DATA_EXCHANGE, RabbitConstant.STEP_DATA_EXCHANGE, i);
//        }
        rabbitTemplate.convertAndSend(RabbitConstant.STEP_DATA_EXCHANGE, RabbitConstant.STEP_QUEUE_ROUTINGKEY, "hello2");
    }
}
