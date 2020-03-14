package com.wangziyang.mes.system.controller.admin;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.system.entity.SysMenu;
import com.wangziyang.mes.system.request.SysMenuPageReq;
import com.wangziyang.mes.system.service.ISysMenuService;
import com.wangziyang.mes.system.vo.TreeVO;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
@Controller("adminSysMenuController")
@RequestMapping("/admin/sys/menu")
public class SysMenuController extends BaseController {

    @Autowired
    private ISysMenuService sysMenuService;

    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "admin/system/menu/list";
    }

    @PostMapping("/page")
    @ResponseBody
    public Result page(SysMenuPageReq req) {
        IPage result = sysMenuService.page(req);
        return Result.success(result);
    }

    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SysMenu record) {
        if (StringUtils.isNotEmpty(record.getId())) {
            SysMenu result = sysMenuService.getById(record.getId());
            model.addAttribute("result", result);
        }
        return "admin/system/menu/addOrUpdate";
    }

    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SysMenu record) {
        sysMenuService.saveOrUpdate(record);
        return Result.success(record.getId());
    }

    @ApiOperation("系统管理菜单树表格数据")
    @GetMapping("/tree")
    @ResponseBody
    public Result tree() throws Exception {
        List<TreeVO<SysMenu>> sysMenus = sysMenuService.listMenuTree();
        return Result.success(sysMenus);
    }
}
