package com.site.collect.service.ipml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.Role;
import com.site.collect.mapper.RoleMapper;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.vo.RoleVo;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    /**
     * @desc: 查询角色
     */
    public PageInfo<Role> findRoleByPage(ParamsDto dto) {
        PageHelper.startPage(dto.getStartPage(), dto.getPageSize());
        List<Role> roles = roleMapper.findRoleByPage(dto);
        return new PageInfo<Role>(roles);
    }

    /**
     * @desc: 新增角色
     */
    public Object addRoles(RoleVo vo) {
        Role r = new Role();
        r.setName(vo.getName());
        r.setDescription(vo.getDescription());
        roleMapper.insert(r);
        return new BaseResponse(StatusCode.OK.getValue(), "新增成功");
    }

    /**
     * @desc: 删除角色
     */
    public Object delRole(String[] ids) {

        for (String id : ids) {
            roleMapper.deleteByPrimaryKey(id);
        }
        return new BaseResponse(StatusCode.OK.getValue(), "删除成功");
    }

    /**
     * 绑定角色下拉框
     *
     * @return
     */
   public List<Role> findAllRoles() {
       return roleMapper.findAllRoles();
   }
}
