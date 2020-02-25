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
public class SysRoleDto extends SysRole {

    /**
     * 菜单列表
     */
    List<SysMenuDto> sysMenuDtos;

    public List<SysMenuDto> getSysMenuDtos() {
        return sysMenuDtos;
    }

    public void setSysMenuDtos(List<SysMenuDto> sysMenuDtos) {
        this.sysMenuDtos = sysMenuDtos;
    }
}
