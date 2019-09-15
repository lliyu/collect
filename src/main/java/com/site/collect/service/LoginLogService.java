package com.site.collect.service;

import com.github.pagehelper.PageInfo;
import com.site.collect.entity.LoginLog;
import com.site.collect.pojo.dto.ParamsDto;

import java.util.List;

public interface LoginLogService {

    /**
     * 查询登录次数
     *
     */
    Integer findMaxLoginTatalByUserId(Long id);


    /**
     * 用户登录日志
     */
    PageInfo<LoginLog> findUserLoginLogByPage(ParamsDto dto);

    /**
     * 统计登陆
     */
    Object findUserLoginTotal();

    boolean insert(LoginLog loginLog);
}
