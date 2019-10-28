package com.songpeng.sparchetype.system.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@RequestMapping("/admin")
@Controller("adminSysLoginController")
@Slf4j
public class SysLoginController {

	/**
	 * 后台管理首页
	 *
	 * @param model
	 * @return
	 */
	@GetMapping({"", "/index"})
	public String indexUI(Model model) {
		// TODO 菜单树
		return "index";
	}

	/**
	 * 后台管理欢迎页
	 *
	 * @param model
	 * @return
	 */
	@GetMapping("/welcome")
	public String welcomeUI(Model model) {
		return "admin/welcome";
	}

}
