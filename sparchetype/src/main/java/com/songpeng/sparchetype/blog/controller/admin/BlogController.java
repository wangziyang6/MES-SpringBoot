package com.songpeng.sparchetype.blog.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@RequestMapping("/admin/blog")
@Controller("adminBlogController")
public class BlogController {

    Logger log = LoggerFactory.getLogger(BlogController.class);

    @GetMapping("/article/list-ui")
    public String listUI(Model model) {
        log.info("/article/list-ui");
        return "blog/article/list";
    }
}
