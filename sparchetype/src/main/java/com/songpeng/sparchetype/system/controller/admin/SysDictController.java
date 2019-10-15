package com.songpeng.sparchetype.system.controller.admin;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.songpeng.sparchetype.common.BaseController;
import com.songpeng.sparchetype.common.Result;
import com.songpeng.sparchetype.system.dto.SysDictDto;
import com.songpeng.sparchetype.system.entity.SysDict;
import com.songpeng.sparchetype.system.service.ISysDictService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;

/**
 * <p>
 * 系统字典表 前端控制器
 * </p>
 *
 * @author SongPeng
 * @since 2019-08-26
 */
@Controller("adminSysDictController")
@RequestMapping("/admin/sys/dict")
@Slf4j
public class SysDictController extends BaseController {

	@Autowired
	private ISysDictService sysDictService;

	@PostMapping("/add")
	@ResponseBody
	public Result add(SysDict sysDict) {
		boolean save = sysDictService.save(sysDict);
		return Result.success(sysDict.getId());
	}

	@GetMapping("/list-ui")
	public String listUI(Model model) {
		return "system/dict/list";
	}

	@GetMapping("/add-or-upd-ui")
	public String addOrUpdUI(Model model) {
		return "system/dict/addOrUpd";
	}

	@PostMapping("/page")
    @ResponseBody
	public Result page(Page page) {
		IPage result = sysDictService.page(page);
		return Result.success(result);
	}
}
