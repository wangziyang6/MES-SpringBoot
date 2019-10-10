package com.songpeng.sparchetype.system.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@Controller
public class SysLoginController {

	/**
	 * 博客主页
	 *
	 * @param model
	 * @return
	 */
	@GetMapping({"/", ""})
	public String welcome(Model model) {
		return "redirect:/blog";
	}

	/**
	 * 后台管理首页
	 *
	 * @param model
	 * @return
	 */
	@GetMapping("/index")
	public String index(Model model) {
		// TODO 菜单树
		return "index";
	}

	@GetMapping("/admin/welcome")
	public String welcomePage(Model model) {
		// TODO 菜单树
		return "admin/welcome";
	}
}
