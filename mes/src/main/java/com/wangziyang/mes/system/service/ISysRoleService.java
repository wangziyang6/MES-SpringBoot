package com.wangziyang.mes.system.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.system.dto.SysRoleDTO;
import com.wangziyang.mes.system.dto.SysUserDTO;
import com.wangziyang.mes.system.entity.SysRole;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
public interface ISysRoleService extends IService<SysRole> {

    /**
     * 根据用户ID获取角色列表信息
     *
     * @param userId 系统用户ID
     * @return 角色列表
     * @throws Exception 异常
     */
    List<SysRoleDTO> listByUserId(String userId) throws Exception;

    /**
     * 重新建立用户角色关系
     *
     * @param sysUserDTO 系统用户DTO
     * @throws Exception 异常
     */
    void rebuild(SysUserDTO sysUserDTO) throws Exception;
}
