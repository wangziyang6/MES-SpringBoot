package com.songpeng.sparchetype.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.songpeng.sparchetype.common.enums.CommonEnum;
import com.songpeng.sparchetype.system.dto.SysRoleDTO;
import com.songpeng.sparchetype.system.dto.SysUserDTO;
import com.songpeng.sparchetype.system.entity.SysRole;
import com.songpeng.sparchetype.system.entity.SysUserRole;
import com.songpeng.sparchetype.system.enums.SysRoleEnum;
import com.songpeng.sparchetype.system.mapper.SysRoleMapper;
import com.songpeng.sparchetype.system.service.ISysRoleService;
import com.songpeng.sparchetype.system.service.ISysUserRoleService;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements ISysRoleService {

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    private ISysUserRoleService sysUserRoleService;

    /**
     * 根据用户ID获取角色列表信息
     *
     * @param userId 系统用户ID
     * @return 角色列表
     * @throws Exception 异常
     */
    @Override
    public List<SysRoleDTO> listByUserId(String userId) throws Exception {
        List<SysRoleDTO> result = new ArrayList<>();

        List<SysRole> sysRoles = sysRoleMapper.listByUserId(userId);

        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(CommonEnum.FIELD_NAME_IS_DELETED.getCode(), SysRoleEnum.DELETED_NORMAL.getCode());
        List<SysRole> sysRolesAll = sysRoleMapper.selectList(null);

        for (SysRole role : sysRolesAll) {
            SysRoleDTO roleDTO = new SysRoleDTO();
            BeanUtils.copyProperties(role, roleDTO);
            for (SysRole r : sysRoles) {
                if (role.getId().equals(r.getId())) {
                    roleDTO.setChecked(true);
                }
            }
            result.add(roleDTO);
        }
        return result;
    }

    /**
     * 重新建立用户角色关系
     *
     * @param sysUserDTO 系统用户DTO
     * @throws Exception 异常
     */
    @Override
    public void rebuild(SysUserDTO sysUserDTO) throws Exception {
        if (StringUtils.isNotEmpty(sysUserDTO.getId())) {
            QueryWrapper<SysUserRole> deleteWrapper = new QueryWrapper<>();
            deleteWrapper.eq("user_id", sysUserDTO.getId());
            sysUserRoleService.remove(deleteWrapper);
        }
        if (ArrayUtils.isNotEmpty(sysUserDTO.getSysRoleIds())) {
            for (String roleId : sysUserDTO.getSysRoleIds()) {
                if (StringUtils.isEmpty(roleId)) {
                    continue;
                }
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(sysUserDTO.getId());
                sysUserRole.setRoleId(roleId);
                sysUserRoleService.save(sysUserRole);
            }
        }
    }
}
