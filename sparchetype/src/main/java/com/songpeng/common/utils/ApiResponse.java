package com.songpeng.common.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * API 接口统一返回对象
 *
 * @author songpeng
 * @date 2019-04-20
 */
public class ApiResponse extends HashMap<String, Object> {

    private static final long serialVersionUID = 1L;

    /**
     * 成功编码
     */
    public static final int SUCCESS_CODE = 0;

    /**
     * 成功信息
     */
    public static final String SUCCESS_MSG = "成功";

    /**
     * 非法调用编码
     */
    public static final int ILLEGAL_CALL_CODE = 94;

    /**
     * 非法调用信息
     */
    public static final String ILLEGAL_CALL_MSG = "非法调用";

    /**
     * 签名校验失败编码
     */
    public static final int SIGNATURE_ERROR_CODE = 95;

    /**
     * 签名校验失败信息
     */
    public static final String SIGNATURE_ERROR_MSG = "签名校验失败";

    /**
     * 参数缺失错误
     */
    public static final int REQUIRED_PARAM_CODE = 96;

    /**
     * 参数缺失信息
     */
    public static final String REQUIRED_PARAM_MSG = "参数缺失";

    /**
     * 参数错误
     */
    public static final int FAIL_PARAM_CODE = 97;

    /**
     * 参数错误信息
     */
    public static final String FAIL_PARAM_MSG = "参数错误";

    /**
     * 失败编码
     */
    public static final int FAIL_CODE = 98;

    /**
     * 失败信息
     */
    public static final String FAIL_MSG = "失败";

    /**
     * 异常编码
     */
    public static final int ERROR_CODE = 99;

    /**
     * 异常信息
     */
    public static final String ERROR_MSG = "接口异常";

    private static final String MSG = "msg";

    private static final String CODE = "code";

    public ApiResponse() {
        put(CODE, SUCCESS_CODE);
        put(MSG, SUCCESS_MSG);
    }

    @Override
    public Object put(String key, Object value) {
        super.put(key, value);
        return this;
    }

    public static ApiResponse ok() {
        return new ApiResponse();
    }

    public static ApiResponse ok(Map<String, Object> map) {
        ApiResponse response = new ApiResponse();
        response.putAll(map);
        return response;
    }

    public static ApiResponse ok(String msg) {
        ApiResponse response = new ApiResponse();
        response.put(MSG, msg);
        return response;
    }

    public static ApiResponse error() {
        return error(FAIL_CODE, FAIL_MSG);
    }

    public static ApiResponse error(String msg) {
        return error(FAIL_CODE, msg);
    }

    public static ApiResponse error(int code, String msg) {
        ApiResponse response = new ApiResponse();
        response.put(CODE, code);
        response.put(MSG, msg);
        return response;
    }
}
