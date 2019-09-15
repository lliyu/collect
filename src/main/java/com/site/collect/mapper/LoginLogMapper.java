package com.site.collect.mapper;

import com.site.collect.entity.LoginLog;
import com.site.collect.pojo.dto.ParamsDto;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface LoginLogMapper extends Mapper<LoginLog> {


    Integer findMaxLoginTatalByUserId(@Param("id") String id);

    List<LoginLog> findUserLoginLogByPage(@Param("dto") ParamsDto dto);

    List<LoginLog> findUserLoginTotal();
}