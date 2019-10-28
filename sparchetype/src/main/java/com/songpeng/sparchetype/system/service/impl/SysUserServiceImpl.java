package com.songpeng.sparchetype.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.songpeng.sparchetype.system.dto.SysMenuDto;
import com.songpeng.sparchetype.system.dto.SysRoleDto;
import com.songpeng.sparchetype.system.dto.SysUserDto;
import com.songpeng.sparchetype.system.entity.SysMenu;
import com.songpeng.sparchetype.system.entity.SysUser;
import com.songpeng.sparchetype.system.mapper.SysMenuMapper;
import com.songpeng.sparchetype.system.mapper.SysUserMapper;
import com.songpeng.sparchetype.system.service.ISysUserService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Autowired
	private SysMenuMapper sysMenuMapper;

	/**
	 * 获取用户角色菜单
	 *
	 * @param username
	 * @return
	 * @throws Exception
	 */
	@Override
	public SysUserDto getUserAndRoleAndMenuByUsername(String username) throws Exception {
		SysUserDto result = sysUserMapper.getUserAndRoleByUsername(username);
		if (CollectionUtils.isNotEmpty(result.getSysRoleDtos())) {
			for (SysRoleDto rDto : result.getSysRoleDtos()) {
				List<SysMenuDto> menus = sysMenuMapper.getMenuByRoleId(rDto.getId());
				rDto.setSysMenuDtos(menus);
			}
		}
		return result;
	}

}
