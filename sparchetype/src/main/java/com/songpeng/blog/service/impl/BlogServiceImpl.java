package com.songpeng.blog.service.impl;

import com.songpeng.blog.service.BlogService;
import org.springframework.stereotype.Service;

/**
 * Controller
 * Created by songpeng on 2019/5/21.
 */
@Service
public class BlogServiceImpl implements BlogService {

    @Override
    public String hello() {
        return "hello";
    }
}
