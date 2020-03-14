package com.wangziyang.mes.system.config.swagger;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 配置类
 *
 * @author SongPeng
 * @date 2020/2/25
 */
@Configuration
@EnableSwagger2
@ConfigurationProperties(prefix = "swagger")
public class SwaggerConfig {
    @Value("${swagger.enable}")
    private boolean enable;
    @Value("${swagger.controller}")
    private String controller;
    @Value("${swagger.title}")
    private String title;
    @Value("${swagger.description}")
    private String description;
    @Value("${swagger.version}")
    private String version;
    @Value("${swagger.license}")
    private String license;
    @Value("${swagger.licenseUrl}")
    private String licenseUrl;

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .enable(enable)
                .pathMapping("/")
                .select()
                .apis(RequestHandlerSelectors.basePackage(controller))
                .paths(PathSelectors.any())
                .build().apiInfo(new ApiInfoBuilder()
                        .title(title)
                        .description(description)
                        .version(version)
                        .license(license)
                        .licenseUrl(licenseUrl)
                        .build());
    }

}