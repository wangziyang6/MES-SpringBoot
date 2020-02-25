package com.songpeng.sparchetype.system.controller.admin;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.songpeng.sparchetype.common.BaseController;
import com.songpeng.sparchetype.common.Result;
import com.songpeng.sparchetype.system.entity.SysMenu;
import com.songpeng.sparchetype.system.service.ISysMenuService;
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
	public Result page(Page page) {
		IPage result = sysMenuService.page(page);
		return Result.success(result);
	}

	@GetMapping("/add-or-upd-ui")
	public String addOrUpdUI(Model model, SysMenu record) {
		if (StringUtils.isNotEmpty(record.getId())) {
			SysMenu result = sysMenuService.getById(record.getId());
			model.addAttribute("result", result);
		}
		return "admin/system/menu/addOrUpd";
	}

	@PostMapping("/add-or-upd")
	@ResponseBody
	public Result addOrUpd(SysMenu record) {
		sysMenuService.saveOrUpdate(record);
		return Result.success(record.getId());
	}
}
