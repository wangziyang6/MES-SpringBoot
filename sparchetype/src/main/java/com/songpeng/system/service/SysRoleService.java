package com.songpeng.system.service;

import com.songpeng.system.domain.SysRole;

import java.util.List;

/**
 * UserService
 *
 * @author songpeng
 * @date 2019/4/20
 */
public interface SysRoleService {
    List<SysRole> getRolesByMenuId(String menuId);
}
