package com.craffic.spring.oauth2.server.test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
public class PasswordEncoderTest {
    public static void main(String[] args) {
        // secret加密
        System.out.println(new BCryptPasswordEncoder().encode("secret"));
    }
}
