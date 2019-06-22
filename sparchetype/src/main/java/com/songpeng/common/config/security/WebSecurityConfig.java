package com.songpeng.common.config.security;

import com.songpeng.common.utils.StringUtil;
import com.songpeng.system.service.impl.SysUserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * Controller
 *
 * @author songpeng
 * @date 2019/5/23
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private static final Logger LOGGER = LoggerFactory.getLogger(WebSecurityConfig.class);

    @Value("${security.ignoring}")
    private String securityIgnoring;

    @Value("${security.successUrl}")
    private String securitySuccessUrl;

    @Value("${security.logoutSuccessUrl}")
    private String securityLogoutSuccessUrl;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        LOGGER.debug("权限框架配置");

        String[] paths = null;
        //设置不拦截
        if (StringUtil.isNotBlank(securityIgnoring)) {
            paths = securityIgnoring.split(",");
            paths = StringUtil.clearSpace(paths);
        }

        //设置过滤器
        // TODO 1. csrf 暂时关闭
        http.authorizeRequests().antMatchers(paths).permitAll()
                .and()
                .httpBasic()
                .authenticationEntryPoint(getCustomLoginAuthEntryPoint())
                .and()
                .addFilterAt(getCustomLoginFilter(), UsernamePasswordAuthenticationFilter.class)
                .addFilterAt(getCustomSecurityInterceptor(), FilterSecurityInterceptor.class)
                .logout().logoutSuccessHandler(getCustomLogoutSuccessHandler())
                .and()
                .csrf().disable()
                .authorizeRequests()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginProcessingUrl("/login")
                .loginPage("/sign_in")
                .permitAll()
                .and()
                .logout()
                .logoutUrl("/sign_in")
                .permitAll();

        LOGGER.debug("配置忽略验证url");
    }

    @Autowired
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(getDaoAuthenticationProvider());
    }

    /**
     * spring security 配置
     *
     * @return
     */
    @Bean
    public CustomLoginAuthEntryPoint getCustomLoginAuthEntryPoint() {
        return new CustomLoginAuthEntryPoint();
    }

    /**
     * 用户验证
     *
     * @return
     */
    @Bean
    public DaoAuthenticationProvider getDaoAuthenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(new SysUserServiceImpl());
        provider.setHideUserNotFoundExceptions(false);
        provider.setPasswordEncoder(new BCryptPasswordEncoder());
        return provider;
    }

    /**
     * 登陆
     *
     * @return
     */
    @Bean
    public CustomLoginFilter getCustomLoginFilter() {
        CustomLoginFilter filter = new CustomLoginFilter();
        try {
            filter.setAuthenticationManager(this.authenticationManagerBean());
        } catch (Exception e) {
            e.printStackTrace();
        }
        filter.setAuthenticationSuccessHandler(getCustomLoginAuthSuccessHandler());
        filter.setAuthenticationFailureHandler(getCustomLoginAuthFailureHandler());

        return filter;
    }

    @Bean
    public CustomLoginAuthSuccessHandler getCustomLoginAuthSuccessHandler() {
        CustomLoginAuthSuccessHandler handler = new CustomLoginAuthSuccessHandler();
        if (StringUtil.isNotBlank(securitySuccessUrl)) {
            handler.setAuthSuccessUrl(securitySuccessUrl);
        }
        return handler;
    }

    @Bean
    public CustomLoginAuthFailureHandler getCustomLoginAuthFailureHandler() {
        return new CustomLoginAuthFailureHandler();
    }

    /**
     * 登出
     *
     * @return
     */
    @Bean
    public CustomLogoutSuccessHandler getCustomLogoutSuccessHandler() {
        CustomLogoutSuccessHandler handler = new CustomLogoutSuccessHandler();
        if (StringUtil.isNotBlank(securityLogoutSuccessUrl)) {
            handler.setLoginUrl(securityLogoutSuccessUrl);
        }
        return handler;
    }

    /**
     * 过滤器
     *
     * @return
     */
    @Bean
    public CustomSecurityInterceptor getCustomSecurityInterceptor() {
        CustomSecurityInterceptor interceptor = new CustomSecurityInterceptor();
        interceptor.setAccessDecisionManager(getCustomAccessDecisionManager());
        interceptor.setSecurityMetadataSource(getCustomMetadataSourceService());
        try {
            interceptor.setAuthenticationManager(this.authenticationManagerBean());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return interceptor;
    }

    @Bean
    public CustomAccessDecisionManager getCustomAccessDecisionManager() {
        return new CustomAccessDecisionManager();
    }

    @Bean
    public CustomFilterInvocationSecurityMetadataSource getCustomMetadataSourceService() {
        CustomFilterInvocationSecurityMetadataSource sourceService = new CustomFilterInvocationSecurityMetadataSource();
        if (StringUtil.isNotBlank(securitySuccessUrl)) {
            sourceService.setIndexUrl(securitySuccessUrl);
        }
        return sourceService;
    }

}
