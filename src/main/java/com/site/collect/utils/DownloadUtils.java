package com.site.collect.utils;

import com.site.collect.entity.collect.CollectStep;
import com.site.collect.utils.data.ParseUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.UUID;

/**
 * 下载工具类
 */
public class DownloadUtils {

    public static void downloadImg(CollectStep step, String url) throws IOException {
        if (StringUtils.isNotBlank(url)) {
            //创建接收流的文件

            int indexOf = url.lastIndexOf('.');
            String prefix = url.substring(indexOf);
            String folder = FileDealUtils.createNewFolder("url/映话/" + step.getName());
            //获取流并写入文件中
            InputStream respStream = ParseUtils.getRespStream(url);
            File file = new File(folder + "/" + UUID.randomUUID().toString() + prefix);
            Files.copy(respStream, file.toPath());
        }///Users/liyu/programmer/java/manage-system/src/test/java/resource/url/映话/糗百故事采集/9363f612-b875-4f05-b3ee-4b199bf53645.mp4
    }

    public static void main(String[] args) throws IOException {
        CollectStep step = new CollectStep();
        step.setName("test");
        String img = "https://mtl.gzhuibei.com/images/img/20128/4.jpg";
        downloadImg(step, img);
    }
}
