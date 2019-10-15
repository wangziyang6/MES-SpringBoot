package com.songpeng.sparchetype.system.controller.client;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@Controller("clientSysLoginController")
@Slf4j
public class SysLoginController {

	/**
	 * 首页默认跳转到博客主页
	 *
	 * @param model
	 * @return
	 */
	@GetMapping({"/", ""})
	public String welcomeUI(Model model) {
		return "redirect:/blog";
	}

	/**
	 * 登录页面
	 *
	 * @param model
	 * @return
	 */
	@GetMapping("/login")
	public String loginUI(Model model) {
		return "login";
	}

}
