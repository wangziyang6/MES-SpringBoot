package com.songpeng.sparchetype.system.dto;

import com.songpeng.sparchetype.system.entity.SysUser;

import java.util.List;

/**
 * @author SongPeng
 * @date 2019/9/30 9:49
 */
public class SysUserDTO extends SysUser {

    /**
     * 角色列表
     */
    List<SysRoleDTO> sysRoleDtos;

	public List<SysRoleDTO> getSysRoleDtos() {
		return sysRoleDtos;
	}

	public void setSysRoleDtos(List<SysRoleDTO> sysRoleDtos) {
		this.sysRoleDtos = sysRoleDtos;
	}
}
