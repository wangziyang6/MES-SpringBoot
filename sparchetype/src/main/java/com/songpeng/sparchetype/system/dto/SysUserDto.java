package com.songpeng.sparchetype.system.dto;

import com.songpeng.sparchetype.system.entity.SysUser;

import java.util.List;

/**
 * @author SongPeng
 * @date 2019/9/30 9:49
 */
public class SysUserDto extends SysUser {

    /**
     * 角色列表
     */
    List<SysRoleDto> sysRoleDtos;

	public List<SysRoleDto> getSysRoleDtos() {
		return sysRoleDtos;
	}

	public void setSysRoleDtos(List<SysRoleDto> sysRoleDtos) {
		this.sysRoleDtos = sysRoleDtos;
	}
}
