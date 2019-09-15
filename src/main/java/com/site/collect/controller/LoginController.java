package com.site.collect.controller;

import com.site.collect.Enum.StatusCode;
import com.site.collect.pojo.dto.UserInfoDto;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.LoginLogService;
import com.site.collect.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public Object login(UserInfoDto infoDto) {
        return userService.login(infoDto);
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public Object logout() {
        try {
            return new BaseResponse(StatusCode.OK.getValue(), "退出登陆成功");
        } catch (Exception e) {
            return "/login";
        }
    }
}
