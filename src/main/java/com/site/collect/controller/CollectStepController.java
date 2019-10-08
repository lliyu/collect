package com.site.collect.controller;

import com.site.collect.entity.collect.CollectSetp;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.CollectStepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/step")
public class CollectStepController {

    @Autowired
    private CollectStepService stepService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse addSteps(@RequestParam(value = "steps[]") CollectSetp[] setps){
        stepService.addSteps(setps);
        return new BaseResponse(200, "");
    }

}
