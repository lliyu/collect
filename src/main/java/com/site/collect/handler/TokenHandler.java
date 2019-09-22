package com.site.collect.handler;

import com.site.collect.controller.api.UserApi;
import com.site.collect.pojo.dto.UserInfoDto;
import com.site.collect.utils.TokenUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TokenHandler implements HandlerInterceptor {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //
        if(request.getRequestURI().contains("login"))
            return true;
        //校验token
        String token = request.getHeader("Authorization");
        if(StringUtils.isNotBlank(token)){
            UserInfoDto info = TokenUtil.decrypt(token);
            String user = (String) redisTemplate.opsForValue().get("token:" + info.getId());
            if(!token.equals(user)) {
                return false;
            }
            UserApi.setUserlocal(info);
            return true;
        }
        return false;
    }
}
