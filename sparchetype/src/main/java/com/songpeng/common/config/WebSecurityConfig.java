package com.songpeng.common.config;

import com.songpeng.system.service.impl.SysUserServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * Controller
 *
 * @author songpeng
 * @date 2019/5/23
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    UserDetailsService customUserService() { //注册UserDetailsService 的bean
        return new SysUserServiceImpl();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        // user Details Service验证
        auth.userDetailsService(customUserService());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // TODO 1. csrf 暂时关闭
        http.authorizeRequests().anyRequest().permitAll().and().csrf().disable();
//                .anyRequest().authenticated() //任何请求,登录后可以访问
//                .and()
//                .formLogin()
//                .loginPage("/login")
//                .failureUrl("/login?error")
//                .permitAll() //登录页面用户任意访问
//                .and()
//                .logout().permitAll(); //注销行为任意访问
    }
}
