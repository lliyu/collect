package com.site.collect.handler;

import com.site.collect.Enum.RequestStatus;
import com.site.collect.controller.api.UserApi;
import com.site.collect.exception.BizException;
import com.site.collect.pojo.dto.UserInfoDto;
import com.site.collect.utils.TokenUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;

public class TokenHandler implements HandlerInterceptor {

    @Autowired
    private StringRedisTemplate redisTemplate;
    @Value("${token.refresh}")
    private Long refreshTime;
    @Value("${token.expire}")
    private Long expire;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //
        if(request.getRequestURI().contains("login"))
            return true;
        if(request.getRequestURI().contains("test"))
            return true;
        //校验token
        String token = request.getHeader("Authorization");
        if(StringUtils.isNotBlank(token)){
            UserInfoDto info = TokenUtil.decrypt(token);
            String key = "token:" + info.getId();
            String user = redisTemplate.opsForValue().get(key);

            if(!token.equals(user)) {
                throw new BizException(RequestStatus.LOGININVAILD.getCode(), RequestStatus.LOGININVAILD.getDesc());
            }
            //确定token有效后 判断当前token使用时间是否已经超过有效期的2/3
            //如果已经超过则对token进行刷新

            //到这里就表示token存在 没有过期
            //判断是否已经持有token过了刷新时间 如果是则刷新
            Long aLong = redisTemplate.getExpire(key);
            if((expire-refreshTime) > aLong){
                //刷新token
                redisTemplate.expire(key, expire, TimeUnit.SECONDS);
            }

            UserApi.setUserlocal(info);
            return true;
        }
        return false;
    }
}
