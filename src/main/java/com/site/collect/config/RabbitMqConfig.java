package com.site.collect.config;

import com.site.collect.constant.RabbitConstant;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitMqConfig {

    /**
     * 队列
     * @return
     */
    @Bean
    public Queue queue(){
        return new Queue(RabbitConstant.STEP_DATA_QUEUE, false);
    }

    @Bean
    public DirectExchange directExchange(){
        return new DirectExchange(RabbitConstant.STEP_DATA_EXCHANGE);
    }

    /**
     * 声明绑定关系
     * @return
     */
    @Bean
    Binding binding() {
        return BindingBuilder.bind(queue()).to(directExchange()).with(RabbitConstant.STEP_QUEUE_ROUTINGKEY);
    }


}
