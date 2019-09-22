package com.site.collect.utils;

import com.site.collect.pojo.dto.UserInfoDto;
import sun.misc.BASE64Encoder;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class TokenUtil {

    public static String generaToken(UserInfoDto infoDto){
        MessageDigest md = null;
        String token = null;
        try {
            md = MessageDigest.getInstance("md5");
            byte md5[] =  md.digest((infoDto.getUsername() + "-" + infoDto.getRoleid() + "-" + System.currentTimeMillis()).getBytes());
            BASE64Encoder encoder = new BASE64Encoder();
            token = encoder.encode(md5);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return token;
    }
}
