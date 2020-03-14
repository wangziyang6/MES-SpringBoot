package com.wangziyang.mes.system.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.system.dto.SysRoleDTO;
import com.wangziyang.mes.system.dto.SysUserDTO;
import com.wangziyang.mes.system.entity.SysUser;
import com.wangziyang.mes.system.request.SysUserPageReq;
import com.wangziyang.mes.system.service.ISysRoleService;
import com.wangziyang.mes.system.service.ISysUserService;
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

import java.util.List;

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

    Logger logger = LoggerFactory.getLogger(SysUserController.class);

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private ISysRoleService sysRoleService;

    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "admin/system/user/list";
    }

    @PostMapping("/page")
    @ResponseBody
    public Result page(SysUserPageReq req) throws Exception {
        QueryWrapper qw = new QueryWrapper();
        if (StringUtils.isNotEmpty(req.getNameLike())) {
            qw.likeRight("name", req.getNameLike());
        }
        if (StringUtils.isNotEmpty(req.getUsernameLike())) {
            qw.likeRight("username", req.getUsernameLike());
        }
        qw.orderByDesc(req.getOrderBy());
        IPage page = sysUserService.page(req, qw);
        return Result.success(page);
    }

    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(SysUser record, Model model) throws Exception {
        if (StringUtils.isNotEmpty(record.getId())) {
            SysUser result = sysUserService.getById(record.getId());
            model.addAttribute("result", result);
        }
        List<SysRoleDTO> sysRoles = sysRoleService.listByUserId(record.getId());
        model.addAttribute("sysRoles", sysRoles);
        return "admin/system/user/addOrUpdate";
    }

    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(SysUserDTO record) throws Exception {
        if (StringUtils.isEmpty(record.getId())) {
            sysUserService.save(record);
        } else {
            sysUserService.update(record);
        }
        return Result.success(record.getId());
    }
}
