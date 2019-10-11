package com.songpeng.sparchetype.blog.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@RequestMapping("/blog")
@Controller("adminBlogController")
public class BlogController {

	@GetMapping("/article/listui")
	public String listUI(Model model) {
		return "blog/article/list";
	}
}