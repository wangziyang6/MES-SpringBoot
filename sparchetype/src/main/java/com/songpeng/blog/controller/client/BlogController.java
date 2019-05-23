package com.songpeng.blog.controller.client;

import com.songpeng.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Controller
 * Created by songpeng on 2019/5/11.
 */
@RequestMapping("/blog")
@Controller("clientBlogController")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @GetMapping
    String blog() {
        return "client/blog/index";
    }

}
