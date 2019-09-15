package com.site.collect.service;

import com.github.pagehelper.PageInfo;
import com.site.collect.entity.OperatingRecord;
import com.site.collect.pojo.dto.ParamsDto;

import java.util.List;


public interface OperatingRecordService {

    /**
     * 查询操作记录
     *
     * @param dto
     * @return
     */
    PageInfo<OperatingRecord> findOperatingRecordByPage(ParamsDto dto);

    Object findUserReqTotal();

    boolean insert(OperatingRecord operatingRecord);
}
