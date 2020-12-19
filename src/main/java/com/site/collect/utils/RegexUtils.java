package com.site.collect.utils;

import com.google.common.collect.Lists;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 正则解析相关工具类
 */
public class RegexUtils {

    /**
     * 解析网络地址中的表达式
     * 表达式的形式很多
     * 为简单目前只是用字符串形式
     * @param content
     * @param params
     * @return
     */
    public static String matchExpression(String content, Map<String, Object> params){
        String regex = "\\$\\{[^\\}]+\\}";

        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(content);

        String expression;
        while (matcher.find()) {
            expression = matcher.group();
            String name = expression.substring(2, expression.length() - 1);
            Object o = params.get(name);
            if(o instanceof String){
                String param = (String) o;
                content = content.replace(expression, param);
            }else if(o instanceof Integer){
                Integer param = (Integer) o;
                content = content.replace(expression, String.valueOf(param));
            }
        }
        return content;
    }

    public static boolean matchUrl(String url){
        String regex = "^((https|http|ftp|rtsp|mms)?:\\/\\/)[^\\s]+";

        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(url);

        return matcher.find();
    }

    public static String replaceLineSp(String content){
        return content.replaceAll("<br>", "\r\n");
    }

    /**
     * 替换图片
     * @param content
     * @return
     */
    public static String replaceImgs(String content){
        String regex = "<img.*?src=\"(.*?)\".*?>";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(content);

        while (matcher.find()){
            //![image](https://note.youdao.com/favicon.ico)
            content = content.replace(matcher.group(), "![image](" + matcher.group(1) + ")\r\n");
        }

        return content;
    }

    /**
     * 替换所有的标签
     * @param content
     * @return
     */
    public static String replaceTitle(String content){
        return content.replaceAll("<.*?>", "");
    }

    public static boolean isWebSite(String url){
        //https://www.meitulu.com/guochan/
//        String regex = "http[s]?://www\\.[\\w]+\\.";
        String regex = "(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(url);
        return matcher.find();
    }

    public static List<String> extractPlaceholder(String format){
        String regex = "\\{(.*?)\\}";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(format);
        List<String> params = Lists.newArrayList();
        while (matcher.find()){
            params.add(matcher.group(1));
        }
        return params;
    }

    public static void main(String[] args) {
//        Map<String, Object> map = new HashMap(2);
//        map.put("name", "Jame Gosling");
//        map.put("alias", "Rod Johnson");
//
//        String line = "${name} did a great job, so ${alias} did. ${name}";
//        System.out.println(matchExpression(line, map));
//
//        String content = "12.21更新<br><img class=\"BDE_Image\" src=\"http://tiebapic.baidu.com/forum/w%3D580/sign=0145ad2823a85edffa8cfe2b795509d8/368da9773912b31b0d2509519118367adab4e17a.jpg\" size=\"112257\" width=\"450\" height=\"800\" size=\"112257\">";
//        content = replaceLineSp(content);
//        content = replaceImgs(content);
//        System.out.println(isWebSite("https://www. <a href="));
        List<String> strings = extractPlaceholder("[${name}](${url})\\r\\n\\r\\n");
        strings.stream().forEach(System.out::println);
    }
}
