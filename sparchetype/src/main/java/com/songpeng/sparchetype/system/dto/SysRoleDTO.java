package com.songpeng.sparchetype.system.dto;

import com.songpeng.sparchetype.system.entity.SysRole;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
public class SysRoleDTO extends SysRole {

    /**
     * 菜单列表
     */
    List<SysMenuDTO> sysMenuDtos;

    public List<SysMenuDTO> getSysMenuDtos() {
        return sysMenuDtos;
    }

    public void setSysMenuDtos(List<SysMenuDTO> sysMenuDtos) {
        this.sysMenuDtos = sysMenuDtos;
    }
}
