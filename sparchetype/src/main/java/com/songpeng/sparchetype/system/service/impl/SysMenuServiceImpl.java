package com.songpeng.sparchetype.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.songpeng.sparchetype.system.entity.SysMenu;
import com.songpeng.sparchetype.system.mapper.SysMenuMapper;
import com.songpeng.sparchetype.system.service.ISysMenuService;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService {

	/**
	 * 根据用户 id 获取用户权限集合
	 *
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Override
	public Set<String> getMenusByUserId(String userId) throws Exception {
		return null;
	}
}
