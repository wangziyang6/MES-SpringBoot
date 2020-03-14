package com.wangziyang.mes.system.config.shiro;

import com.wangziyang.mes.common.util.HttpUtil;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author SongPeng
 * @date 2020/3/6
 */
public class SpLoginFormFilter extends FormAuthenticationFilter {

    private static final Logger logger = LoggerFactory.getLogger(SpLoginFormFilter.class);

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        if (isLoginRequest(request, response)) {
            if (isLoginSubmission(request, response)) {
                if (logger.isTraceEnabled()) {
                    logger.trace("Login submission detected.  Attempting to execute login.");
                }
                return executeLogin(request, response);
            } else {
                if (logger.isTraceEnabled()) {
                    logger.trace("Login page view.");
                }
                //allow them to see the login page
                return true;
            }
        } else {
            if (logger.isTraceEnabled()) {
                logger.trace("Attempting to access a path which requires authentication.  Forwarding to the " +
                        "Authentication url [" + getLoginUrl() + "]");
            }
            //如果是Ajax请求，不跳转登录
            if (HttpUtil.isAjax(httpServletRequest)) {
                httpServletResponse.setStatus(401);
            } else {
                saveRequestAndRedirectToLogin(request, response);
            }
            return false;
        }
    }
}
