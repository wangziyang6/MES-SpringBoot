package com.songpeng.sparchetype.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.songpeng.sparchetype.system.dto.SysMenuDTO;
import com.songpeng.sparchetype.system.dto.SysRoleDTO;
import com.songpeng.sparchetype.system.dto.SysUserDTO;
import com.songpeng.sparchetype.system.entity.SysUser;
import com.songpeng.sparchetype.system.entity.SysUserRole;
import com.songpeng.sparchetype.system.mapper.SysUserMapper;
import com.songpeng.sparchetype.system.request.SysUserPageReq;
import com.songpeng.sparchetype.system.service.ISysMenuService;
import com.songpeng.sparchetype.system.service.ISysUserRoleService;
import com.songpeng.sparchetype.system.service.ISysUserService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    private ISysMenuService sysMenuService;

    @Autowired
    private ISysUserRoleService sysUserRoleService;

    /**
     * 保存
     *
     * @param record 用户信息
     * @throws Exception 异常
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void save(SysUserDTO record) throws Exception {
        sysUserMapper.insert(record);
//        rebuild
        if (ArrayUtils.isNotEmpty(record.getSysRoleIds())) {
            for (String roleId : record.getSysRoleIds()) {
                if (StringUtils.isEmpty(roleId)) {
                    continue;
                }
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(record.getId());
                sysUserRole.setRoleId(roleId);
                sysUserRoleService.save(sysUserRole);
            }
        }
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
        QueryWrapper<SysUserRole> deleteWrapper = new QueryWrapper<>();
        deleteWrapper.eq("user_id", record.getId());
        sysUserRoleService.remove(deleteWrapper);
        if (ArrayUtils.isNotEmpty(record.getSysRoleIds())) {
            for (String roleId : record.getSysRoleIds()) {
                if (StringUtils.isEmpty(roleId)) {
                    continue;
                }
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(record.getId());
                sysUserRole.setRoleId(roleId);
                sysUserRoleService.save(sysUserRole);
            }
        }
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
