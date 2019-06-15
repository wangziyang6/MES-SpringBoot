package com.songpeng.system.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.songpeng.common.utils.IdUtil;
import com.songpeng.common.utils.PageRequest;
import com.songpeng.common.utils.StringUtils;
import com.songpeng.system.domain.SysUser;
import com.songpeng.system.dto.SysUserDto;
import com.songpeng.system.enmus.ESysUser;
import com.songpeng.system.mapper.SysUserMapper;
import com.songpeng.system.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * UserServiceImpl
 *
 * @author songpeng
 * @date 2019/4/20
 */
@Service
public class SysUserServiceImpl implements SysUserService, UserDetailsService {

    private static final Logger LOGGER = LoggerFactory.getLogger(SysUserServiceImpl.class);

    @Autowired
    private SysUserMapper sysUserMapper;

    /**
     * 实现 spring security UserDetailsService 中的方法
     *
     * @param username
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if (StringUtils.isBlank(username)) {
            throw new BadCredentialsException("用户名不能为空！");
        }

        // 根据用户名和正常状态获取用户信息
        Map<String, Object> paraMap = new HashMap(1) {{
            put("userName", username);
        }};
        SysUserDto userDto = getUserDtoRoles(paraMap);

        if (userDto == null) {
            throw new BadCredentialsException("未找到用户名为 " + username + " 的用户信息");
        }

        return userDto;
    }

    /**
     * 用户分页查询
     *
     * @param pageRequest
     * @return
     */
    @Override
    public PageInfo<SysUserDto> getPage(PageRequest pageRequest) {
        // 将参数传给这个方法就可以实现物理分页了
        PageHelper.startPage(pageRequest.getPageNum(), pageRequest.getPageSize());
        List<SysUserDto> users = sysUserMapper.getPage(pageRequest.getParams());
        PageInfo result = new PageInfo(users);
        return result;
    }

    @Override
    public SysUserDto getUserDtoRoles(Map<String, Object> paramMap) {
        List<SysUserDto> userDtos = sysUserMapper.getSysUserDtosRoles(paramMap);
        return userDtos.isEmpty() ? null : userDtos.get(0);
    }

    /**
     * 创建用户
     *
     * @param sysUser
     * @param roles
     */
    @Override
    public void add(SysUser sysUser, String[] roles) {
        sysUser.setId(IdUtil.nextId());
        sysUser.setStatus(ESysUser.STATUS_NORMAL.getValue());
        LOGGER.info("user insert id: {}", sysUser.getId());
        sysUserMapper.insertSelective(sysUser);
    }

}
