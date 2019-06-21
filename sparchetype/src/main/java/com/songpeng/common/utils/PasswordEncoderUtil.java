package com.songpeng.common.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @author songpeng
 * @date 2019/6/18
 */
public class PasswordEncoderUtil {

    /**
     * 使用构造方法生成对象
     */
    private static PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    /**
     * 对密码使用BCryptPasswordEncoder加密方式进行加密
     */
    public static String passwordEncoder(String password) {
        return passwordEncoder.encode(password);
    }
}
