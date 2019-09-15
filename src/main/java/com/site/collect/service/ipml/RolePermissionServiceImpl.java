package com.site.collect.service.ipml;

import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.RolePermission;
import com.site.collect.mapper.RolePermissionMapper;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.RolePermisDto;
import com.site.collect.pojo.dto.RolePermisVo;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.RolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RolePermissionServiceImpl implements RolePermissionService {

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    /**
     * 根据角色查询角色权限
     */
    public List<RolePermission> findRolesPermisByRole(ParamsDto dto) {
        return rolePermissionMapper.findRolesPermisByRole(dto);
    }
    /**
     * 添加角色权限
     *
     * @param vo
     * @return
     */
    @Transactional
    public Object addRolesPermis(RolePermisVo vo) {
        RolePermission rp = null;
        Long roleId = vo.getRoleId();
        Long[] permisIds = vo.getPermiIds()==null?new Long[0]:vo.getPermiIds();

        Map<String,Object> map = new HashMap<>();
        map.put("rid",roleId);
        rolePermissionMapper.deleteByExample(map);

        for (int i = 0,j=permisIds.length; i < j; i++) {
            rp = new RolePermission();
            rp.setRid(roleId);
            rp.setPid(permisIds[i]);
            rolePermissionMapper.insert(rp);
        }
        return new BaseResponse(StatusCode.OK.getValue(), "保存成功");
    }

    /**
     * 根据角色id查询记录数
     * @param roleId
     * @return
     */
    public Integer findCountByRole(Long roleId,String url) {
        return rolePermissionMapper.findCountByRole(roleId, url);
    }

    /**
     * 根据父id\角色id查询角色菜单
     */
    public List<RolePermisDto> findRolesPermisByFatherId(Long fatherId, Long rid) {
        return rolePermissionMapper.findRolesPermisByFatherId(fatherId, rid);
    }
}
