package com.songpeng.sparchetype.system.dto;

import com.songpeng.sparchetype.system.entity.SysRole;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class SysRoleDto extends SysRole {

	/**
	 * 菜单列表
	 */
	List<SysMenuDto> sysMenuDtos;
}
