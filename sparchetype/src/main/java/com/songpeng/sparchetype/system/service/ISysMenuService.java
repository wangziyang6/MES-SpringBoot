package com.songpeng.sparchetype.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.songpeng.sparchetype.system.entity.SysMenu;

import java.util.Set;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
public interface ISysMenuService extends IService<SysMenu> {

	/**
	 * 根据用户 id 获取用户权限集合
	 *
	 * @param id
	 * @return
	 * @throws Exception
	 */
	Set<String> getMenusByUserId(String userId) throws Exception;
}
