package com.songpeng.system.mapper;

import com.songpeng.common.utils.SpMapper;
import com.songpeng.system.domain.SysUser;
import com.songpeng.system.dto.SysUserDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SysUserMapper extends SpMapper<SysUser> {

    List<SysUserDto> getPage(Map<String, Object> params);

    List<SysUserDto> getSysUserDtosRoles(Map<String, Object> paramMap);
}
