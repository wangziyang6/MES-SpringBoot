package com.wangziyang.mes.system.dto;

import com.wangziyang.mes.system.entity.SysUser;

import java.util.List;

/**
 * @author SongPeng
 * @date 2019/9/30 9:49
 */
public class SysUserDTO extends SysUser {

    private static final long serialVersionUID = 1L;

    /**
     * 角色ID列表
     */
    private String[] sysRoleIds;

    /**
     * 角色列表
     */
    private List<SysRoleDTO> sysRoleDTOs;

    public List<SysRoleDTO> getSysRoleDTOs() {
        return sysRoleDTOs;
    }

    public void setSysRoleDTOs(List<SysRoleDTO> sysRoleDTOs) {
        this.sysRoleDTOs = sysRoleDTOs;
    }

    public String[] getSysRoleIds() {
        return sysRoleIds;
    }

    public void setSysRoleIds(String[] sysRoleIds) {
        this.sysRoleIds = sysRoleIds;
    }
}
