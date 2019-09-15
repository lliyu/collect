package com.site.collect.service.ipml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.OperatingRecord;
import com.site.collect.mapper.OperatingRecordMapper;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.ReqTotalDto;
import com.site.collect.pojo.dto.RequstOprDto;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.OperatingRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OperatingRecordServiceImpl implements OperatingRecordService {
    @Autowired
    private OperatingRecordMapper operatingRecordMapper;


    public PageInfo<OperatingRecord> findOperatingRecordByPage(ParamsDto dto){
        PageHelper.startPage(dto.getStartPage(), dto.getPageSize());
        List<OperatingRecord> records = operatingRecordMapper.findOperatingRecordByPage(dto);
        return new PageInfo<OperatingRecord>(records);
    }

    /**
     * 访问统计
     */
    public Object findUserReqTotal() {

        List<ReqTotalDto> reqList = operatingRecordMapper.findAllRequstCount();
        List<RequstOprDto> reqData1 = new ArrayList<>();
        List<RequstOprDto> reqData2 = new ArrayList<>();
        String[] arrNa = new String[reqList.size()];
        RequstOprDto reo = null;
        for (int i = 0, j = reqList.size(); i < j; i++) {
            if (reqList.get(i).getType().equals(1)) {
                // Method
                reo = new RequstOprDto();
                reo.setName(reqList.get(i).getNa());
                reo.setValue(reqList.get(i).getTotal());
                reqData1.add(reo);
            } else {
                // 源
                reo = new RequstOprDto();
                reo.setName(reqList.get(i).getNa());
                reo.setValue(reqList.get(i).getTotal());
                reqData2.add(reo);
            }
            arrNa[i] = reqList.get(i).getNa();
        }

        RequstOprDto r = new RequstOprDto();
        List<RequstOprDto> reqData3 = new ArrayList<>();
        r.setNetList((ArrayList) reqData1);
        r.setUsrList((ArrayList) reqData2);
        r.setArrName(arrNa);
        reqData3.add(r);

        return new BaseResponse(StatusCode.OK.getValue(), StatusCode.OK.getMsg(), reqData3);
    }

    @Override
    public boolean insert(OperatingRecord operatingRecord) {
        return operatingRecordMapper.insert(operatingRecord)>0;
    }
}
