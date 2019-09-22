package com.site.collect.service;

import com.github.pagehelper.PageInfo;
import com.site.collect.entity.User;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.UserDto;
import com.site.collect.pojo.dto.UserInfoDto;
import com.site.collect.pojo.vo.UserInfoVo;
import com.site.collect.pojo.vo.UserVo;

import java.util.List;


public interface UserService {

    User get(Long id);

    UserInfoDto login(UserInfoDto infoDto);

    Object addUser(UserVo userVo);

    PageInfo<UserDto> findUserByPage(ParamsDto dto);

    Object delUsers(Long[] ids);

    List<UserInfoDto> checkUser(String name, String pass);

    Object editUserStatus(Long id, Integer type);

    Object editUserInfo(UserInfoVo vo);
}
