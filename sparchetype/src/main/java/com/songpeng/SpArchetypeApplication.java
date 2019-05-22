package com.songpeng;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 启动类
 *
 * @author songpeng
 * @date 2019-04-19
 */
@SpringBootApplication
@tk.mybatis.spring.annotation.MapperScan(basePackages = "com.songpeng.*.mapper")
public class SpArchetypeApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpArchetypeApplication.class, args);
    }

}
