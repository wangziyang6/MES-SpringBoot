package com.songpeng.sparchetype.system.mapper;

import com.songpeng.sparchetype.system.dto.SysUserDto;
import com.songpeng.sparchetype.system.entity.SysUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

	/**
	 * 获取用户角色菜单
	 *
	 * @param username
	 * @return
	 * @throws Exception
	 */
	SysUserDto getUserAndRoleAndMenuByUsername(String username) throws Exception;

}
