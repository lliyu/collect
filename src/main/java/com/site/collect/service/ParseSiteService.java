package com.site.collect.service;

import org.springframework.context.annotation.Configuration;

import java.util.List;
import java.util.Map;

/**
 * 页面解析service
 */
public interface ParseSiteService {

    void parse(List<Long> ids);

}
