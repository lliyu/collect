package com.site.collect.service;

import com.site.collect.entity.collect.CollectSetp;

import java.util.List;
import java.util.Map;

public interface CollectStepService {

    void addSteps(CollectSetp[] steps);

    Map<String, List<Object>> test(CollectSetp setp);
}
