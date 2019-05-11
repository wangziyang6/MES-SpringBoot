package com.songpeng.system.controller.client;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 登录 Controller
 *
 * @author songpeng
 * @date 2019-04-19
 */
@Controller("clientLoginController")
public class LoginController {

    /**
     * 日志记录器
     */
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    /**
     * 访问首页
     *
     * @param model
     * @return
     */
    @GetMapping({"/", ""})
    String welcome(Model model) {
        return "redirect:/blog";
    }

}
