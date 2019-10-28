package com.songpeng.sparchetype.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.songpeng.sparchetype.system.dto.SysMenuDto;
import com.songpeng.sparchetype.system.entity.SysMenu;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {

	/**
	 * 根据角色id查询菜单列表
	 *
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	List<SysMenuDto> getMenuByRoleId(String roleId) throws Exception;
}
