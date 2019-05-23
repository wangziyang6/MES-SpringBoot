package com.songpeng.common.advice;

import com.songpeng.common.utils.ApiResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Controller
 *
 * @author songpeng
 * @date 2019-04-20
 */
@ControllerAdvice
public class ApiAdvice {

    public static final Logger LOGGER = LoggerFactory.getLogger(ApiAdvice.class);

    /**
     * 应用到所有@RequestMapping注解方法，在其执行之前初始化数据绑定器
     *
     * @param binder
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {

    }

    /**
     * 把值绑定到Model中，使全局@RequestMapping可以获取到该值
     *
     * @param model
     */
    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("author", "Song Peng");
    }

    /**
     * API接口调用异常处理
     *
     * @param e 异常信息
     * @return API调用结果对象
     */
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(MissingServletRequestParameterException.class)
    @ResponseBody
    public ApiResponse handleMissingServletRequestParameterException(HttpServletRequest request, MissingServletRequestParameterException e) throws Exception {
        return ApiResponse.error(ApiResponse.REQUIRED_PARAM_CODE, ApiResponse.REQUIRED_PARAM_MSG);
    }

    /**
     * API接口调用异常处理
     *
     * @param e 异常信息
     * @return API调用结果对象
     */
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ApiResponse handle(HttpServletRequest request, Exception e) throws Exception {
        LOGGER.error("API接口调用异常: {}", request.getRequestURI(), e);
        return ApiResponse.error(ApiResponse.ERROR_CODE, ApiResponse.ERROR_MSG);
    }

}
