package com.songpeng.common.utils;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author songpeng
 * @date 2019/6/22
 */
public class JsonUtil {

    public static void writeJson(HttpServletResponse response, ApiResponse responseData) {
        PrintWriter writer;
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try {
            writer = response.getWriter();
            writer.write(JSONObject.toJSONString(responseData));
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
