package com.collect.test.redis;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import com.site.collect.SiteApplication;
import com.site.collect.pojo.dto.UserInfoDto;
import com.site.collect.utils.TokenUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SiteApplication.class)
public class RedisDemo {

    @Autowired
    private RedisTemplate redisTemplate;

    @Test
    public void keys(){
        Set<String> keys = redisTemplate.keys("*");
        keys.stream().forEach(key -> {
            System.out.println(key);
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
    public void decode() throws NoSuchPaddingException, NoSuchAlgorithmException, IllegalBlockSizeException, BadPaddingException, InvalidKeyException, IOException {
//        System.out.println(TokenUtil.decode("VzmmVi5DDMk71Rd5xib3cyo85aoiskPnvNNV/4hQFAI="));
    }
}
