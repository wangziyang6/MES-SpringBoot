package com.songpeng.sparchetype.common.advice;

import com.songpeng.sparchetype.common.Result;
import com.songpeng.sparchetype.common.util.HttpUtil;
import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @author SongPeng
 * @date 2019/10/14 14:14
 */
@ControllerAdvice
public class ExceptionAdvice {

    Logger log = LoggerFactory.getLogger(ExceptionAdvice.class);

    @ExceptionHandler(AuthorizationException.class)
    @ResponseBody
    public Object handleAuthorizationException(AuthorizationException e, HttpServletRequest request) {
        log.error(e.getMessage(), e);
        if (HttpUtil.isAjax(request)) {
            return Result.failure("未授权");
        }
        return new ModelAndView("error/403");
    }

    @ExceptionHandler(DuplicateKeyException.class)
    @ResponseBody
    public Object handleDuplicateKeyException(DuplicateKeyException e, HttpServletRequest request) {
        log.error(e.getMessage(), e);
        if (HttpUtil.isAjax(request)) {
            return Result.failure("数据重复");
        }
        return new ModelAndView("error/403");
    }

    @ExceptionHandler({Exception.class})
    @ResponseBody
    public Object handleException(Exception e, HttpServletRequest request) {
        log.error(e.getMessage(), e);
        if (HttpUtil.isAjax(request)) {
            return Result.failure("服务器错误，请联系管理员");
        }
        return new ModelAndView("error/500");
    }

}
