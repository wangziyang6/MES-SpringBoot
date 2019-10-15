package com.songpeng.sparchetype.common;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.HashMap;

/**
 * 分页返回结果类
 *
 * @author SongPeng
 * @date 2019/10/14 13:27
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Result<T> extends HashMap<String, Object> {

	public static <T> Result<T> success() {
		return restResult(null, 0, null);
	}

	public static <T> Result<T> success(T data) {
		return restResult(data, 0, null);
	}

	public static <T> Result<T> success(T data, String msg) {
		return restResult(data, 0, msg);
	}

	public static <T> Result<T> failure() {
		return restResult(null, 1, null);
	}

	public static <T> Result<T> failure(String msg) {
		return restResult(null, 1, msg);
	}

	public static <T> Result<T> failure(T data) {
		return restResult(data, 1, null);
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
