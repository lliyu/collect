package com.site.collect.service.ipml;

import com.site.collect.entity.collect.CollectStep;
import com.site.collect.service.TransFormatService;
import com.site.collect.utils.DownloadUtils;
import com.site.collect.utils.RegexUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Service
public class TransFormatServiceImpl implements TransFormatService {

    private Logger logger = LoggerFactory.getLogger(TransFormatServiceImpl.class);

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

    @Override
    public void contentDownload(HashMap<String, Object> hashMap, CollectStep step) {
        List<String> params = RegexUtils.extractPlaceholder(step.getFormat());
        for (String item : params) {
            Object res = null;
            if (hashMap.containsKey(item)) {
                res = hashMap.get(item);
                if (res instanceof String) {
                    String str = (String) res;
                    str = step.getFormat().replace("${" + item + "}", str);
                    if (RegexUtils.matchUrl(str)) {
                        try {
                            DownloadUtils.downloadImg(step, str);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }else {
                        logger.warn(str + "并不是一个合法的网络地址");
                    }
                }
            }
        }
    }
}
