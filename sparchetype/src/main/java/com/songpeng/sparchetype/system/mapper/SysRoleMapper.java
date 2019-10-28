package com.songpeng.sparchetype.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.songpeng.sparchetype.system.dto.SysUserDto;
import com.songpeng.sparchetype.system.entity.SysRole;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {

	/**
	 * 根据用户 id 获取角色列表
	 *
	 * @param username
	 * @return
	 * @throws Exception
	 */
	List<SysRole> getRolesByUserId(String userId) throws Exception;
}
