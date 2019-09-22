package com.site.collect.service.ipml;

import cn.hutool.crypto.SecureUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.LoginLog;
import com.site.collect.entity.User;
import com.site.collect.entity.UserRole;
import com.site.collect.exception.BizException;
import com.site.collect.mapper.UserMapper;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.RolePermisDto;
import com.site.collect.pojo.dto.UserDto;
import com.site.collect.pojo.dto.UserInfoDto;
import com.site.collect.pojo.vo.UserInfoVo;
import com.site.collect.pojo.vo.UserVo;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.LoginLogService;
import com.site.collect.service.RolePermissionService;
import com.site.collect.service.UserRoleService;
import com.site.collect.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class UserServiceImpl  implements UserService {

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private LoginLogService loginLogService;

    @Autowired
    private RolePermissionService rolePermissionService;
    @Autowired
    private UserMapper userMapper;

    @Override
    public User get(Long id) {
        return userMapper.selectByPrimaryKey(id);
    }

    /**
     * 登录
     * @return
     */
    public UserInfoDto login(UserInfoDto user) {
        UserInfoDto userInfoDto = userMapper.getUser(user.getUsername());
        if(user == null || !(user.getPassword().equals((userInfoDto.getPassword()))))
            throw new BizException("用户名或密码错误！");
        // 登录日志
        LoginLog loginLog = new LoginLog();
        loginLog.setUid(userInfoDto.getId());
        loginLog.setLoginTime(new Date());
//        loginLog.setLoginIP();
        loginLog.setLoginTotal(loginLogService.findMaxLoginTatalByUserId(userInfoDto.getId())); // 登录总次数
        loginLogService.insert(loginLog);

        // 一级 模块
        List<RolePermisDto> parentList = rolePermissionService.findRolesPermisByFatherId(null, null);
        List<RolePermisDto> sonList = null;
        List<RolePermisDto> sonssonList = null;
        Long rid = userInfoDto.getRoleName().equals("admin") ? null : userInfoDto.getRoleid();
        for (int i = 0, j = parentList.size(); i < j; i++) {

            List<RolePermisDto> trueChildrenList = new ArrayList<>();

            // 二级 页面
            sonList = rolePermissionService.findRolesPermisByFatherId(parentList.get(i).getId(), null);
            for (int k = 0, l = sonList.size(); k < l; k++) {

                // 三级按钮
                sonssonList = rolePermissionService.findRolesPermisByFatherId(sonList.get(k).getId(), rid);
                // 如果按钮级拥有权限说明页面也有权限
                if (!sonssonList.isEmpty() && sonssonList.size() > 0) {
                    trueChildrenList.add(sonList.get(k));
                }
            }
            parentList.get(i).setChildren((ArrayList<RolePermisDto>) trueChildrenList);
        }
        userInfoDto.setRolePermis((ArrayList) parentList);
        return userInfoDto;
    }


    @Transactional
    public Object addUser(UserVo vo){

        Map<String,Object> map = new HashMap<>();
        map.put("nickname",vo.getName().trim());
        List<User> list = userMapper.selectByExample(map);
        if (list.size() > 0) {
            throw new BizException(new BaseResponse(StatusCode.BAD_REQUEST.getValue(), "昵称已经存在", null));
        }
        User user = new User();
        user.setNickname(vo.getName());
        user.setPswd(SecureUtil.md5(vo.getPass()));
        user.setEmail(vo.getEmail());
        user.setCreateTime(new Date());
        userMapper.insert(user);

        UserRole ur = new UserRole();
        ur.setUid(user.getId());
        ur.setRid(vo.getRoleId());
        Boolean result =  userRoleService.insert(ur);

        if (!result) {
            throw new BizException(new BaseResponse(StatusCode.INTERNAL_SERVER_ERROR.getValue(), StatusCode.INTERNAL_SERVER_ERROR.getMsg(), null));
        }
        return new BaseResponse(StatusCode.OK.getValue(), "新增成功");
    }


    public PageInfo<UserDto> findUserByPage(ParamsDto dto) {
        PageHelper.startPage(dto.getStartPage(), dto.getPageSize());
        List<UserDto> list = userMapper.findUserByPage(dto);
        return new PageInfo<UserDto>(list);
    }


    public Object delUsers(Long[] ids) {
        for (Long id : ids) {
            userMapper.deleteByPrimaryKey(id);
        }
        return new BaseResponse(StatusCode.OK.getValue(), "删除成功");
    }

    public List<UserInfoDto> checkUser(String name, String pass) {
       return userMapper.checkUser(name,pass);
   }


    public Object editUserStatus(Long id, Integer type) {
        User user = new User();
        user.setId(id);
        user.setStatus(type);
        Integer row = userMapper.updateByPrimaryKey(user);
        return row > 0 ? new BaseResponse(StatusCode.OK.getValue(), type == 0 ? "已禁止登陆" : "已允许登陆") : new BaseResponse(StatusCode.INTERNAL_SERVER_ERROR.getValue(), "修改失败");
    }


    public Object editUserInfo(UserInfoVo vo) {
        User user = new User();
        user.setId(vo.getId());
        user.setNickname(vo.getName());
        user.setEmail(vo.getEmail());
        user.setHeadPortraits(vo.getUserImg());
        Integer row = userMapper.updateByPrimaryKey(user);
        if (row > 0) {
            return new BaseResponse(StatusCode.OK.getValue(), "修改成功，下次登录生效");
        }
        return new BaseResponse(StatusCode.INTERNAL_SERVER_ERROR.getValue(), "修改失败");
    }
}
