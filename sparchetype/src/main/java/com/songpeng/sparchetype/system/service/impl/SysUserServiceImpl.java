package com.songpeng.sparchetype.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.songpeng.sparchetype.system.dto.SysUserDto;
import com.songpeng.sparchetype.system.entity.SysUser;
import com.songpeng.sparchetype.system.mapper.SysUserMapper;
import com.songpeng.sparchetype.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

	@Autowired
	private SysUserMapper sysUserMapper;

	/**
	 * 获取用户角色菜单
	 *
	 * @param username
	 * @return
	 * @throws Exception
	 */
	@Override
	public SysUserDto getUserAndRoleAndMenuByUsername(String username) throws Exception {
		return sysUserMapper.getUserAndRoleAndMenuByUsername(username);
	}
}
