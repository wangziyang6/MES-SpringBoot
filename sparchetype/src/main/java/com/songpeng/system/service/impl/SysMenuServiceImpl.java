package com.songpeng.system.service.impl;

import com.songpeng.system.domain.SysMenu;
import com.songpeng.system.mapper.SysMenuMapper;
import com.songpeng.system.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author songpeng
 * @date 2019/6/21
 */
@Service
public class SysMenuServiceImpl implements SysMenuService {

    @Autowired
    private SysMenuMapper sysMenuMapper;

    /**
     * 根据url查询所属菜单
     *
     * @param url
     * @return
     */
    @Override
    public List<SysMenu> getMenusByUrl(String url) {
        List<SysMenu> menuList = sysMenuMapper.selectAll();
        List<SysMenu> menus = new ArrayList<>();
        if (menuList != null) {
            menus.addAll(menuList.stream().filter(menu -> urlMatcher(menu.getUrl(), url)).collect(Collectors.toList()));
        }
        return menus;
    }

    /**
     * url 匹配
     *
     * @param permstr
     * @param url
     * @return
     */
    private boolean urlMatcher(String permstr, String url) {
        if (permstr == null) {
            return false;
        }
        PathMatcher matcher = new AntPathMatcher();
        return matcher.match(permstr, url);
    }
}
