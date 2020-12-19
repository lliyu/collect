package com.site.collect.service;

import com.site.collect.entity.collect.CollectStep;

import java.util.HashMap;

public interface TransFormatService {
    String formatToMarkdown(HashMap<String, Object> hashMap, String format);
    void contentDownload(HashMap<String, Object> hashMap, CollectStep step);
}
