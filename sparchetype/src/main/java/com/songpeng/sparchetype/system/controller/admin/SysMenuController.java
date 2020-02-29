package com.songpeng.sparchetype.system.controller.admin;


import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.songpeng.sparchetype.common.BaseController;
import com.songpeng.sparchetype.common.Result;
import com.songpeng.sparchetype.system.entity.SysMenu;
import com.songpeng.sparchetype.system.service.ISysMenuService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
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

	@ApiOperation("系统菜单树")
	@GetMapping("/tree")
	@ResponseBody
	public Result tree() {
		JSONObject jsonObject = JSONUtil.parseObj("{\n" +
				"  \"code\": 200,\n" +
				"  \"msg\": \"ok\",\n" +
				"  \"data\": [\n" +
				"    {\n" +
				"      \"id\": \"1\",\n" +
				"      \"name\": \"xxx\",\n" +
				"      \"state\": 0,\n" +
				"      \"createTime\": \"2019/11/18 10:44:00\",\n" +
				"      \"haveChild\": true\n" +
				"    },\n" +
				"    {\n" +
				"      \"id\": \"2\",\n" +
				"      \"name\": \"xxx\",\n" +
				"      \"state\": 0,\n" +
				"      \"createTime\": \"2019/11/18 10:44:00\",\n" +
				"      \"haveChild\": true\n" +
				"    },\n" +
				"    {\n" +
				"      \"id\": \"3\",\n" +
				"      \"name\": \"xxx\",\n" +
				"      \"state\": 0,\n" +
				"      \"createTime\": \"2019/11/18 10:44:00\",\n" +
				"      \"haveChild\": true\n" +
				"    },\n" +
				"    {\n" +
				"      \"id\": \"4\",\n" +
				"      \"name\": \"xxx\",\n" +
				"      \"state\": 0,\n" +
				"      \"createTime\": \"2019/11/18 10:44:00\",\n" +
				"      \"haveChild\": false\n" +
				"    },\n" +
				"    {\n" +
				"      \"id\": \"5\",\n" +
				"      \"name\": \"xxx\",\n" +
				"      \"state\": 0,\n" +
				"      \"createTime\": \"2019/11/18 10:44:00\",\n" +
				"      \"haveChild\": false\n" +
				"    }\n" +
				"  ]\n" +
				"}");
		return Result.success(jsonObject);
	}
}
