package com.songpeng.sparchetype.system.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.songpeng.sparchetype.common.BaseController;
import com.songpeng.sparchetype.common.Result;
import com.songpeng.sparchetype.system.entity.SysUser;
import com.songpeng.sparchetype.system.request.SysUserPageReq;
import com.songpeng.sparchetype.system.service.ISysUserService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
@Controller("adminSysUserController")
@RequestMapping("/admin/sys/user")
public class SysUserController extends BaseController {

    Logger log = LoggerFactory.getLogger(SysUserController.class);

    @Autowired
    private ISysUserService sysUserService;

    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "admin/system/user/list";
    }

    @PostMapping("/page")
    @ResponseBody
    public Result page(SysUserPageReq req) {
        getSysUser();
        QueryWrapper qw = new QueryWrapper();
        qw.orderByDesc(req.getOrderBy());
        IPage result = sysUserService.page(req, qw);
        return Result.success(result);
    }

    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(SysUser record, Model model) {
        if (StringUtils.isNotEmpty(record.getId())) {
            SysUser result = sysUserService.getById(record.getId());
            model.addAttribute("result", result);
        }
        return "admin/system/user/addOrUpdate";
    }

    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SysUser record) {
        sysUserService.saveOrUpdate(record);
        return Result.success(record.getId());
    }
}
