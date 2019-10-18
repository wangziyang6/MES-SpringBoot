package com.songpeng.sparchetype.system.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.songpeng.sparchetype.common.BaseController;
import com.songpeng.sparchetype.common.Result;
import com.songpeng.sparchetype.system.entity.SysRole;
import com.songpeng.sparchetype.system.request.SysRolePageReq;
import com.songpeng.sparchetype.system.service.ISysRoleService;
import org.apache.commons.lang3.StringUtils;
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
 * @since 2019-10-16
 */
@Controller("adminSysRoleController")
@RequestMapping("/admin/sys/role")
public class SysRoleController extends BaseController {

	@Autowired
	private ISysRoleService sysRoleService;

	@GetMapping("/list-ui")
	public String listUI(Model model) {
		return "system/role/list";
	}

	@PostMapping("/page")
	@ResponseBody
	public Result page(Page page, SysRolePageReq req) {
		QueryWrapper qw = new QueryWrapper();
		qw.orderByDesc(req.getOrderBy());
		IPage result = sysRoleService.page(page, qw);
		return Result.success(result);
	}

	@GetMapping("/add-or-upd-ui")
	public String addOrUpdUI(Model model, SysRole record) {
		if (StringUtils.isNotEmpty(record.getId())) {
			SysRole result = sysRoleService.getById(record.getId());
			model.addAttribute("result", result);
		}
		return "system/role/addOrUpd";
	}

	@PostMapping("/add-or-upd")
	@ResponseBody
	public Result addOrUpd(SysRole record) {
		sysRoleService.saveOrUpdate(record);
		return Result.success(record.getId());
	}
}
