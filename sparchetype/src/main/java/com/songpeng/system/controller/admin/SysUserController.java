package com.songpeng.system.controller.admin;

import com.github.pagehelper.PageInfo;
import com.songpeng.common.utils.ApiResponse;
import com.songpeng.common.utils.PageRequest;
import com.songpeng.system.domain.SysUser;
import com.songpeng.system.dto.SysUserDto;
import com.songpeng.system.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
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
public class SysUserController {

    /**
     * 日志记录器
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(SysUserController.class);

    @Autowired
    private SysUserService sysUserService;

    @RequestMapping("/page")
    @ResponseBody
    public ApiResponse getPage(PageRequest pageRequest) {
        LOGGER.info("获取用户列表");
        PageInfo<SysUserDto> pageInfo = sysUserService.getPage(pageRequest);
        Map<String, Object> result = new HashMap<>(1);
        result.put("result", pageInfo);
        return ApiResponse.ok(result);
    }

    @PostMapping("/add")
    @ResponseBody
    public ApiResponse add(SysUser sysUser, String[] roles) {
        sysUserService.add(sysUser, roles);
        return ApiResponse.ok();
    }

}
