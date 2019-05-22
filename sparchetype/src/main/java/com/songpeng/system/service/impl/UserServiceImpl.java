package com.songpeng.system.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.songpeng.common.utils.PageRequest;
import com.songpeng.system.domain.User;
import com.songpeng.system.mapper.UserMapper;
import com.songpeng.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * UserServiceImpl
 *
 * @author songpeng
 * @date 2019/4/20
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public PageInfo<User> getPage(PageRequest pageRequest) {
        //将参数传给这个方法就可以实现物理分页了，非常简单。
        PageHelper.startPage(pageRequest.getPageNum(), pageRequest.getPageSize());
        List<User> users = userMapper.getPage(pageRequest.getParams());
        PageInfo result = new PageInfo(users);
        return result;
    }

}
