package com.collect.test.redis;

import com.google.common.collect.Maps;
import com.site.collect.SiteApplication;
import com.site.collect.entity.Permission;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.mapper.PermissionMapper;
import com.site.collect.service.CollectStepService;
import com.site.collect.utils.data.ParseUtils;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.seimicrawler.xpath.JXDocument;
import org.seimicrawler.xpath.JXNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import tk.mybatis.mapper.entity.Example;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SiteApplication.class)
public class PermisionTest {

    @Autowired
    private PermissionMapper permissionMapper;

    @Autowired
    private CollectStepService stepService;


    @Test
    public void getPermi(){
        Example example = new Example(Permission.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("fatherId", 4l);
        List<Permission> permissions = permissionMapper.selectByExample(example);
        System.out.println(permissions);
    }

    public void update(Permission permission){
//        List<Permission> permissions = getPermi(permission.getId());
//        permissions.stream().forEach(permission1 -> {
//            permission1.setLevels(permission.getLevels() + ":" + permission1.getCode());
//            permissionMapper.updateByPrimaryKey(permission1);
//            System.out.println("update:" + permission.getName() + " finished!");
//            update(permission1);
//        });
    }

    @Test
    public void test() throws IOException {
        ////*[@id="1"]/h3/a[1]
//        String baidu = ParseUtils.testOnlineSite("http://www.baidu.com/s?ie=UTF-8&wd=baidu", "baidu");
//        System.out.println(baidu);
        String html = ParseUtils.readHtml("baidu");
        HashMap<String, String> objectObjectHashMap = Maps.newHashMap();
        objectObjectHashMap.put("accept", "*/*");
        objectObjectHashMap.put("connection", "Keep-Alive");
        objectObjectHashMap.put("user-agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36");

        Document document = Jsoup.connect("http://www.baidu.com/s?ie=UTF-8&wd=baidu").headers(objectObjectHashMap).get();
        JXDocument jxDocument = JXDocument.create(document);
        List<Object> sel = jxDocument.sel("//h3/a/text()");
        sel.stream().forEach(s -> {
            System.out.println(s);
        });
//        JXDocument byUrl = JXDocument.create(html);

    }

    @Test
    public void add(){
        CollectStep step = new CollectStep();
        step.setCollectId(1l);
        step.setName("baidu");
        step.setIndex(1);
        step.setAddr("http://www.baidu.com/s?ie=UTF-8&wd=baidu");
        step.setValue("[{\"value\":\"//h3[@class='t']/a/allText()\",\"name\":\"item\"}]");
        step.setCreateTime(new Date());
        step.setUpdateTime(new Date());
        stepService.addSteps(Arrays.asList(step));
    }
}
