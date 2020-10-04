package com.site.collect.service.ipml;

import com.site.collect.service.TransFormatService;
import com.site.collect.utils.RegexUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class TransFormatServiceImpl implements TransFormatService {

    @Override
    public String formatToMarkdown(HashMap<String, Object> hashMap, String format) {
        List<String> params = RegexUtils.extractPlaceholder(format);
        for (String item : params) {
            Object res = null;
            if (hashMap.containsKey(item)) {
                res = hashMap.get(item);
                if (res instanceof String) {
                    String str = (String) res;
                    format = format.replace("${" + item + "}", str);
                }
            }
        }
        return format;
    }
}
