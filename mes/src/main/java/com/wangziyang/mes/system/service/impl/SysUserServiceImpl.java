package com.wangziyang.mes.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.system.dto.SysMenuDTO;
import com.wangziyang.mes.system.dto.SysRoleDTO;
import com.wangziyang.mes.system.dto.SysUserDTO;
import com.wangziyang.mes.system.entity.SysUser;
import com.wangziyang.mes.system.mapper.SysUserMapper;
import com.wangziyang.mes.system.service.ISysMenuService;
import com.wangziyang.mes.system.service.ISysRoleService;
import com.wangziyang.mes.system.service.ISysUserService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wangziyang songpeng
 * @since 2019-10-15
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private ISysMenuService sysMenuService;

    @Autowired
    private ISysRoleService sysRoleService;

    /**
     * 保存
     *
     * @param record 用户信息
     * @throws Exception 异常
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void save(SysUserDTO record) throws Exception {
        //MD5算法计算3次
        String result = new Md5Hash(record.getPassword(), record.getUsername(),3).toString();
        record.setPassword(result);
        sysUserMapper.insert(record);
        sysRoleService.rebuild(record);
    }

    /**
     * 更新
     *
     * @param record 用户信息
     * @throws Exception 异常
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(SysUserDTO record) throws Exception {
        sysUserMapper.updateById(record);
        sysRoleService.rebuild(record);
    }

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
        if (CollectionUtils.isNotEmpty(result.getSysRoleDTOs())) {
            for (SysRoleDTO rDto : result.getSysRoleDTOs()) {
                List<SysMenuDTO> menus = sysMenuService.listByRoleId(rDto.getId());
                rDto.setSysMenuDtos(menus);
            }
        }
        return result;
    }

}
