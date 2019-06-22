package com.songpeng.system.service.impl;

import com.songpeng.system.domain.SysRole;
import com.songpeng.system.mapper.SysRoleMapper;
import com.songpeng.system.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author songpeng
 * @date 2019/6/21
 */
@Service
public class SysRoleServiceImpl implements SysRoleService {

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Override
    public List<SysRole> getRolesByMenuId(String menuId) {
        return sysRoleMapper.getRolesByMenuId(menuId);
    }
}
