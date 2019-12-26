package com.site.collect.service;

import com.site.collect.entity.collect.CollectStep;

import java.util.List;

/**
 * 页面解析service
 */
public interface ParseSiteService {

    void parse(List<Long> ids);
    public void parseStep(CollectStep collectStep);

}
