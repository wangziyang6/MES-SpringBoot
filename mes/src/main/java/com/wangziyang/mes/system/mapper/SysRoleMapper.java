package com.wangziyang.mes.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.system.entity.SysRole;

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
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	List<SysRole> listByUserId(String userId) throws Exception;
}
