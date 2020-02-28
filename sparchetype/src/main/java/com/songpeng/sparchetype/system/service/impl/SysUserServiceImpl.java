package com.songpeng.sparchetype.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.songpeng.sparchetype.system.dto.SysMenuDTO;
import com.songpeng.sparchetype.system.dto.SysRoleDTO;
import com.songpeng.sparchetype.system.dto.SysUserDTO;
import com.songpeng.sparchetype.system.entity.SysUser;
import com.songpeng.sparchetype.system.mapper.SysMenuMapper;
import com.songpeng.sparchetype.system.mapper.SysUserMapper;
import com.songpeng.sparchetype.system.service.ISysUserService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
	public SysUserDTO getUserAndRoleAndMenuByUsername(String username) throws Exception {
		SysUserDTO result = sysUserMapper.selectUserAndRoleByUsername(username);
		if (CollectionUtils.isNotEmpty(result.getSysRoleDtos())) {
			for (SysRoleDTO rDto : result.getSysRoleDtos()) {
				List<SysMenuDTO> menus = sysMenuMapper.selectMenuByRoleId(rDto.getId());
				rDto.setSysMenuDtos(menus);
			}
		}
		return result;
	}

}
