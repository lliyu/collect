package com.site.collect.handler;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TokenHandler implements HandlerInterceptor {

    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //
        if(request.getRequestURI().contains("login"))
            return true;
        //校验token
        String token = request.getHeader("Authorization");
        if(StringUtils.isNotBlank(token)){
            Object user = redisTemplate.opsForValue().get(token);
            if(user == null)
                return false;
//            redisTemplate.opsForValue().getOperations().hasKey()
        }

        return false;
    }
}
