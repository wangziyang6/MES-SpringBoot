package com.songpeng.system.service;

import com.songpeng.system.domain.SysMenu;

import java.util.List;

/**
 * SysMenuService
 *
 * @author songpeng
 * @date 2019/4/20
 */
public interface SysMenuService {

    /**
     * 根据url查询所属菜单
     *
     * @param url
     * @return
     */
    List<SysMenu> getMenusByUrl(String url);
}
