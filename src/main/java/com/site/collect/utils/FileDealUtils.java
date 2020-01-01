package com.site.collect.utils;

import java.io.File;
import java.io.IOException;

/**
 * 文件处理工具类
 */
public class FileDealUtils {

    public static String createNewFolder(String folder) throws IOException {
        String source = System.getProperty("user.dir") + "/src/test/java/resource/" + folder;
        File dir = new File(source);
        if(!dir.exists())
            dir.mkdirs();
        return dir.getPath();
    }
}
