package com.collect.test.redis;

import com.site.collect.SiteApplication;
import com.site.collect.entity.Permission;
import com.site.collect.mapper.PermissionMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SiteApplication.class)
public class PermisionTest {

    @Autowired
    private PermissionMapper permissionMapper;


    public List<Permission> getPermi(Long fid){
        Example example = new Example(Permission.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("fatherId", fid);
        List<Permission> permissions = permissionMapper.selectByExample(example);
        return permissions;
    }

    public void update(Permission permission){
        List<Permission> permissions = getPermi(permission.getId());
        permissions.stream().forEach(permission1 -> {
            permission1.setLevels(permission.getLevels() + ":" + permission1.getCode());
            permissionMapper.updateByPrimaryKey(permission1);
            System.out.println("update:" + permission.getName() + " finished!");
            update(permission1);
        });
    }

    @Test
    public void test(){
        List<Permission> permi = getPermi((long) 0);
        permi.stream().forEach(permission -> {
            update(permission);
        });
    }
}
