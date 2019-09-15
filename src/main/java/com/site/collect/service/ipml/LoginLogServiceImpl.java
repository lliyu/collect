package com.site.collect.service.ipml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.LoginLog;
import com.site.collect.mapper.LoginLogMapper;
import com.site.collect.pojo.dto.LoginTotalDto;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class LoginLogServiceImpl implements LoginLogService {
    
    @Autowired
    private LoginLogMapper loginLogMapper;
    /**
     * 查询登录次数
     *
     * @param id
     * @return
     */
    public Integer findMaxLoginTatalByUserId(Long id) {
        return loginLogMapper.findMaxLoginTatalByUserId(id);
    }

    /**
     * 用户登录日志
     *
     * @param dto 参数dto
     * @return
     */
    public PageInfo<LoginLog> findUserLoginLogByPage(ParamsDto dto) {
        PageHelper.startPage(dto.getStartPage(),dto.getPageSize());
        List<LoginLog> logs = loginLogMapper.findUserLoginLogByPage(dto);
        return new PageInfo<LoginLog>(logs);
    }

    /**
     * 统计登陆
     */
    public Object findUserLoginTotal() {

        List<LoginLog> loignList = loginLogMapper.findUserLoginTotal();
        String[] strName = new String[loignList.size()];
        int[] itotal = new int[loignList.size()];
        for (int i = 0, j = loignList.size(); i < j; i++) {
            strName[i] = loignList.get(i).getUserName();
            itotal[i] = loignList.get(i).getLoginTotal();
        }
        List<LoginTotalDto> listLoginTotal = new ArrayList<>();
        LoginTotalDto loginTotalDto = new LoginTotalDto();
        loginTotalDto.setName(strName);
        loginTotalDto.setTotal(itotal);
        listLoginTotal.add(loginTotalDto);
        return new BaseResponse(StatusCode.OK.getValue(), StatusCode.OK.getMsg(), listLoginTotal);
    }

    @Override
    public boolean insert(LoginLog loginLog) {

        return loginLogMapper.insert(loginLog)>0;
    }
}
