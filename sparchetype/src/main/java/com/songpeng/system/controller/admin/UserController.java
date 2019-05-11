package com.songpeng.system.controller.admin;

import com.songpeng.system.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户 Controller
 *
 * @author songpeng
 * @date 2019-04-19
 */
@RequestMapping("/admin/sys/user")
@Controller("adminUserController")
public class UserController {

    @Autowired
    private static UserService userService;

    /**
     * 日志记录器
     */
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

}
