package com.songpeng.system.controller.admin;

import com.github.pagehelper.PageInfo;
import com.songpeng.common.utils.ApiResponse;
import com.songpeng.common.utils.PageRequest;
import com.songpeng.system.domain.User;
import com.songpeng.system.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

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
    private UserService userService;

    /**
     * 日志记录器
     */
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping("/page")
    @ResponseBody
    public ApiResponse getPage(PageRequest pageRequest) {
        logger.info("获取用户列表");
        PageInfo<User> pageInfo = userService.getPage(pageRequest);
        Map<String, Object> res = new HashMap<>(2);
        res.put("result", pageInfo);
        return ApiResponse.ok(res);
    }

}
