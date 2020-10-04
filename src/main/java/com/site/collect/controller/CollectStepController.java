package com.site.collect.controller;

import com.alibaba.fastjson.JSONArray;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.CollectStepService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/step")
public class CollectStepController {

    @Autowired
    private CollectStepService stepService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse addSteps(@RequestParam(value = "steps", required = false) String setps){
        stepService.addSteps(JSONArray.parseArray(setps, CollectStep.class));
        return new BaseResponse(200, "");
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse update(@RequestParam(value = "steps", required = false) String setps){
        stepService.addSteps(JSONArray.parseArray(setps, CollectStep.class));
        return new BaseResponse(200, "");
    }

    @RequestMapping(value = "/{cid}/steps", method = RequestMethod.GET)
    @ResponseBody
    public BaseResponse steps(@PathVariable("cid") Integer cid){
        List<CollectStep> steps = stepService.getStepsByCid(cid);
        return BaseResponse.success(steps);
    }

}
