package com.site.collect.mapper;

import com.site.collect.entity.OperatingRecord;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.ReqTotalDto;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface OperatingRecordMapper extends Mapper<OperatingRecord> {

    List<OperatingRecord> findOperatingRecordByPage(@Param("dto") ParamsDto dto);

    List<ReqTotalDto> findAllRequstCount();
}