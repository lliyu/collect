package com.site.collect.controller;

import com.site.collect.Enum.StatusCode;
import com.site.collect.controller.api.UserApi;
import com.site.collect.exception.BizException;
import com.site.collect.pojo.dto.UserInfoDto;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.UserService;
import com.site.collect.utils.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private RedisTemplate redisTemplate;
    @Value("${token.expire}")
    private Long expire;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public BaseResponse login(UserInfoDto infoDto, HttpServletResponse response) throws Exception {
        //判断是否已经登录
        Boolean aBoolean = redisTemplate.opsForValue().getOperations().hasKey("token:" + infoDto.getId());
        if(aBoolean)
            throw new BizException("请不要重复登录！");

        infoDto = userService.login(infoDto);
        //登录成功 写入token
        //生成token
        String token = TokenUtil.encrypt(infoDto);
        //写入redis
        infoDto.setPassword(null);
        redisTemplate.opsForValue().set("token:" + infoDto.getId(), token, expire, TimeUnit.SECONDS);

        //需要设置这一行才能在前端获取到header
        //如果要添加新的header 也需要这样
        response.setHeader("Access-Control-Expose-Headers", "token");
        response.addHeader("token", token);
        return new BaseResponse(200, "登录成功", infoDto);
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public Object logout() {
        Boolean delete = redisTemplate.delete("token:" + UserApi.getUserId());
        return new BaseResponse(StatusCode.OK.getValue(), "退出登陆成功");
    }
}
