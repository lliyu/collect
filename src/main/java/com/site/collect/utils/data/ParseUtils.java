package com.site.collect.utils.data;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.site.collect.entity.collect.Item;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.seimicrawler.xpath.JXDocument;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.*;
import java.text.MessageFormat;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ParseUtils {
    //配置ObjectMapper对象
    private static final ObjectMapper objectMapper = new ObjectMapper()
            .configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);

    public static void testOnlineSite(String url, String keyword) throws IOException {
        String source = System.getProperty("user.dir") + "/src/test/java/resource";
        File dir = new File(source);
        if(!dir.exists())
            dir.mkdirs();
        File file = new File(source + MessageFormat.format("/html" + "-{0}.txt", keyword));
        if(!file.exists())
            file.createNewFile();
        //将读取到的结果写入到文件中

        String resp = ObtainWebContentUtils.getContent(url);
//        System.out.println(resp);
        FileOutputStream fos = new FileOutputStream(file);
        fos.write(resp.getBytes());
        fos.close();
    }

    public static String readHtml(String keyword) throws IOException {
        String source = System.getProperty("user.dir") + MessageFormat.format("/src/test/java/resource/html-{0}.txt", keyword);
        File file = new File(source);
        if(!file.exists())
            return "";
        FileReader fr = new FileReader(file);
        BufferedReader br = new BufferedReader(fr);
        StringBuilder html = new StringBuilder();
        String res = "";
        while ((res = br.readLine())!=null){
            html.append(res);
        }
        br.close();
        return html.toString();
    }

    public static String parseSite(String html){
        //正则解析
        String regex = "<div class=\"headline\">.*?<a href=\"//(.*?)\" title=\"(.*?)\".*?>.*?</div>";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(html.toString());
        if (matcher.find()){
            return matcher.group(1);
        }
        return "";
    }

    public static List<Object> parse(String url, Item item) throws IOException {
        JXDocument document = JXDocument.createByUrl(url);
        List<Object> sel = document.sel(item.getValue());

        return sel;
    }

//    public static OnlineSite parseInfo(String html){
//        String imgRe = "\"media_id\".*?\"cover\":\"(.*?)\"";
//        String urlRe = "\"media_id\":(.*?),";
//        String titleRe = "<div class=\"headline\">.*?<a.*?title=\"(.*?)\"";
//        Pattern pattern = Pattern.compile(imgRe);
//        Matcher matcher = pattern.matcher(html);
//        OnlineSite site = null;
//        site = new OnlineSite();
//        if (matcher.find()){
//            site.setImg("https:" + RegexUtils.replaceImageChar(matcher.group(1)));
//        }
//
//        pattern = Pattern.compile(urlRe);
//        matcher = pattern.matcher(html);
//        if(matcher.find()){
//            site.setUrl(MessageFormat.format("https://bilibili.com/bangumi/media/md{0}", matcher.group(1)));
//        }
//
//        pattern = Pattern.compile(titleRe);
//        matcher = pattern.matcher(html);
//        if(matcher.find()){
//            site.setName(matcher.group(1));
//        }
//        return site;
//    }

    public static void main(String[] args) throws IOException {
//        testOnlineSite("http://www.baidu.com/s?ie=UTF-8&wd=baidu", "baidu");
        String baidu = readHtml("baidu");
//        parse(baidu);
    }
}
