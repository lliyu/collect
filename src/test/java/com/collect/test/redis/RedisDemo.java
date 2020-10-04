package com.collect.test.redis;

import com.google.common.collect.Sets;
import com.site.collect.SiteApplication;
import com.site.collect.pojo.dto.UserInfoDto;
import com.site.collect.utils.TokenUtil;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;;
import org.springframework.data.redis.core.*;
import org.springframework.test.context.junit4.SpringRunner;
import redis.clients.jedis.JedisCommands;
import redis.clients.jedis.MultiKeyCommands;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;

import javax.annotation.PostConstruct;
import java.util.Set;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SiteApplication.class)
public class RedisDemo {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;


    @Test
    public void keys(){
        Set<String> keys = redisTemplate.keys("*");
        keys.stream().forEach(key -> {
            System.out.println(key);
        });

    }

    @Test
    public void insert(){
        for(int i=0;i<=16;i++){
            stringRedisTemplate.opsForValue().set("key" + i, String.valueOf(i));
        }
    }

    @Test
    public void scan(){
        redisTemplate.execute((RedisCallback<Set<String>>) connection -> {
            Set<String> keys = Sets.newHashSet();

            JedisCommands commands = (JedisCommands) connection.getNativeConnection();
            MultiKeyCommands multiKeyCommands = (MultiKeyCommands) commands;

            ScanParams scanParams = new ScanParams();
            scanParams.match("key*");
            scanParams.count(1);
            ScanResult<String> scan = multiKeyCommands.scan("0", scanParams);
            while (null != scan.getStringCursor()) {
                keys.addAll(scan.getResult());
                System.out.println("cursor:" + scan.getStringCursor() + ";key:" + scan.getResult());
                if (!StringUtils.equals("0", scan.getStringCursor())) {
                    scan = multiKeyCommands.scan(scan.getStringCursor(), scanParams);
                } else {
                    break;
                }
            }
            return keys;
        });
    }


    @Test
    public void encode() throws Exception {
        UserInfoDto infoDto = new UserInfoDto();
        infoDto.setUsername("liyu");
        infoDto.setRoleid(1l);
        infoDto.setId(11l);
        String token = TokenUtil.encrypt(infoDto);
        System.out.println();
        UserInfoDto decode = TokenUtil.decrypt(token);
        System.out.println(decode);
    }

    @Test
    public void decode() throws Exception {
        System.out.println(TokenUtil.decrypt("VzmmVi5DDMk71Rd5xib3cyo85aoiskPnvNNV/4hQFAI="));
    }

    public static void main(String[] args) {
        System.out.println(111);
    }
}
