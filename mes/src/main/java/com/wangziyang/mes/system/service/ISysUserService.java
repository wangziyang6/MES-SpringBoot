package com.wangziyang.mes.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.system.dto.SysUserDTO;
import com.wangziyang.mes.system.entity.SysUser;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
public interface ISysUserService extends IService<SysUser> {

    /**
     * 保存
     *
     * @param record 用户信息
     * @throws Exception 异常
     */
    void save(SysUserDTO record) throws Exception;

    /**
     * 更新
     *
     * @param record 用户信息
     * @throws Exception 异常
     */
    void update(SysUserDTO record) throws Exception;

    /**
     * 获取用户角色菜单
     *
     * @param username 系统用户名
     * @return 返回结果
     * @throws Exception 异常
     */
    SysUserDTO getUserAndRoleAndMenuByUsername(String username) throws Exception;
}
