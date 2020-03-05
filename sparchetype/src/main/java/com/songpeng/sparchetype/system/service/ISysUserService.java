package com.songpeng.sparchetype.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.songpeng.sparchetype.system.dto.SysUserDTO;
import com.songpeng.sparchetype.system.entity.SysUser;
import com.songpeng.sparchetype.system.request.SysUserPageReq;

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
