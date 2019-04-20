package com.songpeng.system.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户 Controller
 *
 * @author songpeng
 * @date 2019-04-19
 */
@RequestMapping("/admin/sys/user")
@Controller("adminUserController")
public class UserController {

    /**
     * 日志记录器
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @ResponseBody
    @RequestMapping("/page")
    public String page() {
        int a = 10 / 0;
        return "hello 悟空";
    }
}
