package com.site.collect.service.ipml;

import com.site.collect.entity.UserRole;
import com.site.collect.mapper.UserRoleMapper;
import com.site.collect.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public boolean insert(UserRole userRole) {
        return userRoleMapper.insert(userRole)>0;
    }
}
