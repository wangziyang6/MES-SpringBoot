package com.songpeng.sparchetype.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.songpeng.sparchetype.system.entity.SysMenu;
import com.songpeng.sparchetype.system.vo.TreeVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
public interface ISysMenuService extends IService<SysMenu> {

    /**
     * 系统首页初始化菜单树数据
     *
     * @return 系统首页初始化菜单树数据
     * @throws Exception 异常
     */
    Map<String, Object> listIndexMenuTree() throws Exception;

    /**
     * 获取系统菜单树
     *
     * @return 系统菜单树
     * @throws Exception 异常
     */
    List<TreeVO<SysMenu>> listMenuTree() throws Exception;
}
