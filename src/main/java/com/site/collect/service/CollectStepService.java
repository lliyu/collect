package com.site.collect.service;

import com.site.collect.entity.collect.CollectStep;

import java.util.List;
import java.util.Map;

public interface CollectStepService {

    void addSteps(List<CollectStep> stepss);

    Map<String, List<Object>> test(CollectStep setp);
}
