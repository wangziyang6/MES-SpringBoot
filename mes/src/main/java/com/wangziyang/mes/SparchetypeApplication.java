package com.wangziyang.mes;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.wangziyang.mes.**.mapper*")
public class SparchetypeApplication {

    public static void main(String[] args) {
        SpringApplication.run(SparchetypeApplication.class, args);
    }

}
