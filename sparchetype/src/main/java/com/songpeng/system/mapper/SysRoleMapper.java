package com.songpeng.system.mapper;

import com.songpeng.common.utils.CustomMapper;
import com.songpeng.system.domain.SysRole;

import java.util.List;

public interface SysRoleMapper extends CustomMapper<SysRole> {

    List<SysRole> getRolesByUserId(String userId);

    List<SysRole> getRolesByMenuId(String menuId);
}
