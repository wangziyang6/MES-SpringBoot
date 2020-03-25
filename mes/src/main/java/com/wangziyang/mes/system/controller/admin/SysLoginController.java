package com.wangziyang.mes.system.controller.admin;

import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.system.service.ISysMenuService;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 系统登录
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@RequestMapping("/admin")
@Controller("adminSysLoginController")
public class SysLoginController extends BaseController {

    Logger logger = LoggerFactory.getLogger(SysLoginController.class);

    /**
     * 系统菜单 Service
     */
    @Autowired
    private ISysMenuService sysMenuService;

    /**
     * 后台管理首页
     *
     * @param model
     * @return
     */
    @GetMapping({"", "/index"})
    public String indexUI(Model model) {
        return "admin/index";
    }

    /**
     * 后台管理欢迎页
     *
     * @param model
     * @return
     */
    @ApiOperation("后台管理欢迎页")
    @GetMapping("/welcome-ui")
    public String welcomeUI(Model model) {
        return "admin/welcome";
    }

    /**
     * 系统首页初始化菜单树数据
     * @return 菜单树数据
     * @throws Exception 异常
     */
    @ApiOperation("系统首页初始化菜单树数据")
    @GetMapping("/list/index/menu/tree")
    @ResponseBody
    public Result tree() throws Exception {
        Map<String, Object> result = sysMenuService.listIndexMenuTree();
        return Result.success(result);
    }

    /**
     * 用户搜索系统首页初始化菜单树数据
     * @param menuName 菜单名字
     * @return 菜单树数据
     * @throws Exception 异常
     */
    @ApiOperation("系统首页初始化菜单树数据")
    @GetMapping("/list/index/menu/search/tree/{menuName}")
    @ResponseBody
    public Result searchTree(@PathVariable String menuName) throws Exception {
        Map<String, Object> result = sysMenuService.listIndexMenuSearchTree(menuName);
        return Result.success(result);
    }

}
