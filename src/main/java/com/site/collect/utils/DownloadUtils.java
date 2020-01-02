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

    public static void downloadImg(CollectStep step, String img) throws IOException {
        if (StringUtils.isNotBlank(img)) {
            //创建接收流的文件

            int indexOf = img.lastIndexOf('.');
            String prefix = img.substring(indexOf);
            String folder = FileDealUtils.createNewFolder("imgs/" + step.getName());
            //获取流并写入文件中
            InputStream respStream = ParseUtils.getRespStream(img);
            File file = new File(folder + "/" + UUID.randomUUID().toString() + prefix);
            Files.copy(respStream, file.toPath());
        }
    }

    public static void main(String[] args) throws IOException {
        CollectStep step = new CollectStep();
        step.setName("test");
        String img = "https://mtl.gzhuibei.com/images/img/20128/4.jpg";
        downloadImg(step, img);
    }
}
