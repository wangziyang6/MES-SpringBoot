package com.songpeng.system.service;

import com.github.pagehelper.PageInfo;
import com.songpeng.common.utils.PageRequest;
import com.songpeng.system.domain.User;

/**
 * UserService
 * @author songpeng
 * @date 2019/4/20.
 */
public interface UserService {

    /**
     * 获取用户分页
     * @param pageRequest
     * @return
     */
    PageInfo<User> getPage(PageRequest pageRequest);

}
