package com.site.collect.utils;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import com.site.collect.pojo.dto.UserInfoDto;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Value;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.util.Map;

public class TokenUtil {

    @Value("${token.aes.key}")
    private static String encodeRules = "ca017d0ff169b425";

    // 加密
    public static String encrypt(UserInfoDto infoDto) throws Exception {

        Map<String, String> infos = Maps.newHashMap();
        infos.put("id", String.valueOf(infoDto.getId()));
        infos.put("username", infoDto.getUsername());
        infos.put("roleid", String.valueOf(infoDto.getRoleid()));
        String content = JSON.toJSONString(infos);

        byte[] raw = encodeRules.getBytes("utf-8");
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");//"算法/模式/补码方式"
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(content.getBytes("utf-8"));

        return new Base64().encodeToString(encrypted);//此处使用BASE64做转码功能，同时能起到2次加密的作用。
    }

    // 解密
    public static UserInfoDto decrypt(String token) throws Exception {
        byte[] raw = encodeRules.getBytes("utf-8");
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] encrypted1 = new Base64().decode(token);//先用base64解密
        byte[] original = cipher.doFinal(encrypted1);
        String originalString = new String(original, "utf-8");
        UserInfoDto infoDto = JSON.parseObject(originalString, UserInfoDto.class);
        return infoDto;
    }

}
