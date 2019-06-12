package com.songpeng.system.service;

import com.github.pagehelper.PageInfo;
import com.songpeng.common.utils.PageRequest;
import com.songpeng.system.domain.SysUser;
import com.songpeng.system.dto.SysUserDto;

import java.util.Map;

/**
 * UserService
 *
 * @author songpeng
 * @date 2019/4/20.
 */
public interface SysUserService {

    /**
     * 获取用户分页
     *
     * @param pageRequest
     * @return
     */
    PageInfo<SysUserDto> getPage(PageRequest pageRequest);

    /**
     * 获取用户信息（包含权限）
     *
     * @param paramMap
     * @return
     */
    SysUserDto getUserDtoRoles(Map<String, Object> paramMap);

    void add(SysUser sysUser, String[] roles);

}
