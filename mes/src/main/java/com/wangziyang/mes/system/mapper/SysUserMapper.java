package com.wangziyang.mes.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.system.dto.SysUserDTO;
import com.wangziyang.mes.system.entity.SysUser;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

	SysUserDTO selectUserAndRoleByUsername(String username) throws Exception;
}
