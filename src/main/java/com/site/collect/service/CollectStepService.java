package com.site.collect.service;

import com.site.collect.entity.collect.CollectStep;

import java.util.List;
import java.util.Map;

public interface CollectStepService {

    void addSteps(List<CollectStep> stepss);

//    boolean update(List<CollectStep> stepss);

    Map<String, List<Object>> test(CollectStep setp);

    CollectStep getStepByCidAndIndex(CollectStep step);

    /**
     * 获取一个采集任务的详细步骤
     * @param cid
     * @return
     */
    List<CollectStep> getStepsByCid(Integer cid);
}
