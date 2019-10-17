package com.songpeng.sparchetype.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.songpeng.sparchetype.system.dto.SysUserDto;
import com.songpeng.sparchetype.system.entity.SysUser;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
public interface ISysUserService extends IService<SysUser> {

	/**
	 * 获取用户角色菜单
	 *
	 * @param username
	 * @return
	 * @throws Exception
	 */
	SysUserDto getUserAndRoleAndMenuByUsername(String username) throws Exception;
}
