package com.site.collect.utils;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.site.collect.entity.collect.CollectStep;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 分页处理
 */
public class PageDealUtils {

    public static List<Map<String, Object>> pageReplace(CollectStep step, Map<String, Object> params){
        List<Map<String, Object>> objects = Lists.newArrayList();
        String pages = (String) params.get("page");
        int page = Integer.valueOf(pages);
        page = page/50;
        for (int i = 0; i < page; i++) {
            HashMap<String, Object> objectObjectHashMap = JSON.parseObject(JSON.toJSONString(params), HashMap.class);
            objectObjectHashMap.put("page", i);
            String expression = RegexUtils.matchExpression(step.getAddr(), objectObjectHashMap);
            System.out.println("page:" + expression);
            objectObjectHashMap.put("url", expression);
            objectObjectHashMap.put("step", step);
            objects.add(objectObjectHashMap);
        }
        return objects;
    }
}
