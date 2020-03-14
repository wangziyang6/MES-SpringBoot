package com.wangziyang.mes.common;

import java.util.HashMap;

/**
 * 通用返回结果类
 *
 * @author SongPeng
 * @date 2019/10/14 13:27
 */
public class Result<T> extends HashMap<String, Object> {

    public static <T> Result<T> success() {
        return restResult(null, 0, "操作成功");
    }

    public static <T> Result<T> success(T data) {
        return restResult(data, 0, "操作成功");
    }

    public static <T> Result<T> success(T data, String msg) {
        return restResult(data, 0, msg);
    }

    public static <T> Result<T> failure() {
        return restResult(null, 1, "操作失败");
    }

    public static <T> Result<T> failure(String msg) {
        return restResult(null, 1, msg);
    }

    public static <T> Result<T> failure(T data) {
        return restResult(data, 1, "操作失败");
    }

    public static <T> Result<T> failure(T data, String msg) {
        return restResult(data, 1, msg);
    }

    private static <T> Result<T> restResult(T data, int code, String msg) {
        Result<T> apiResult = new Result<>();
        apiResult.put("code", code);
        apiResult.put("data", data);
        apiResult.put("msg", msg);
        return apiResult;
    }

}
