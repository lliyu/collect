package com.site.collect.mapper;

import com.site.collect.entity.User;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.UserDto;
import com.site.collect.pojo.dto.UserInfoDto;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserMapper extends Mapper<User> {

    /**
     * @desc: 查询用户
     */
    List<UserDto> findUserByPage( @Param("dto") ParamsDto dto);

    /**
     * @desc: 登陆验证
     */
    List<UserInfoDto> checkUser(@Param("name") String name, @Param("pass") String pass);

    /**
     * 根据用户名获取用户信息
     */
    UserInfoDto getUser(@Param("name") String name);
}