package com.site.collect.controller.api;

import com.site.collect.pojo.dto.UserInfoDto;

public class UserApi {

    private static ThreadLocal<UserInfoDto> userlocal = new ThreadLocal();

    public static void setUserlocal(UserInfoDto infoDto) {
        userlocal.set(infoDto);
    }

    public static String getUserName(){
        return userlocal.get().getUsername();
    }

    public static Long getUserId(){
        return userlocal.get().getId();
    }

    public static Long getRoleId(){
        return userlocal.get().getRoleid();
    }
}
