package com.site.collect.utils;

import java.util.HashMap;
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
            }
        }
        return content;
    }

    public static void main(String[] args) {
        Map<String, Object> map = new HashMap(2);
        map.put("name", "Jame Gosling");
        map.put("alias", "Rod Johnson");

        String line = "${name} did a great job, so ${alias} did. ${name}";
        System.out.println(matchExpression(line, map));
//
//        String regex = "\\$\\{[^\\}]+\\}";
//
//        Pattern p = Pattern.compile(regex);
//        Matcher m = p.matcher(line);
//
//        String g;
//        while (m.find()) {
//            g = m.group();
//            g = g.substring(2, g.length() - 1);
//            line = m.replaceFirst(map.get(g) + "");
//            m = p.matcher(line);
//        }
//        System.out.println(line);
    }
}
