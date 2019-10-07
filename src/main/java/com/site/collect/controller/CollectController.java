package com.site.collect.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.github.pagehelper.PageInfo;
import com.site.collect.entity.collect.CollectEntity;
import com.site.collect.entity.collect.CollectSetp;
import com.site.collect.pojo.dto.CollectDto;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.CollectService;
import com.site.collect.service.CollectStepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/collect")
public class CollectController {

    @Autowired
    private CollectService collectService;
    @Autowired
    private CollectStepService collectStepService;

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public PageInfo<CollectEntity> list(CollectDto collectDto){
        List<CollectEntity> page = collectService.page(collectDto);
        return new PageInfo<CollectEntity>(page);
    }

    @ResponseBody
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public BaseResponse list(Long id){
        CollectDto info = collectService.getCollectInfoById(id);
        return new BaseResponse(200, "", info);
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public BaseResponse delete(Long[] ids){
        collectService.delete(ids);
        return new BaseResponse(200, "删除成功");
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public BaseResponse add(CollectDto collectDto){
        Long id = collectService.add(collectDto);
        return new BaseResponse(200, "删除成功", id);
    }

    @ResponseBody
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public BaseResponse test(CollectSetp setp){
        Map<String, List<Object>> test = collectStepService.test(setp);
        return new BaseResponse(200, "", JSON.toJSONString(test, SerializerFeature.PrettyFormat, SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteDateUseDateFormat));
    }

}
