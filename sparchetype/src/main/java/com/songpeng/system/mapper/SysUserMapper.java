package com.songpeng.system.mapper;

import com.songpeng.common.utils.CustomMapper;
import com.songpeng.system.domain.SysUser;
import com.songpeng.system.dto.SysUserDto;

import java.util.List;
import java.util.Map;

public interface SysUserMapper extends CustomMapper<SysUser> {

    List<SysUserDto> getPage(Map<String, Object> params);

    List<SysUserDto> getSysUserDtosRoles(Map<String, Object> paramMap);
}
