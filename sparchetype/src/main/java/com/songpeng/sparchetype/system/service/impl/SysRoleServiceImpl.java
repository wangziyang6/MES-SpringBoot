package com.songpeng.sparchetype.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.songpeng.sparchetype.system.dto.SysRoleDTO;
import com.songpeng.sparchetype.system.entity.SysRole;
import com.songpeng.sparchetype.system.enums.SysRoleEnum;
import com.songpeng.sparchetype.system.mapper.SysRoleMapper;
import com.songpeng.sparchetype.system.service.ISysRoleService;
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
        queryWrapper.eq("delete", SysRoleEnum.DELETED_NORMAL.getCode());
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
}
