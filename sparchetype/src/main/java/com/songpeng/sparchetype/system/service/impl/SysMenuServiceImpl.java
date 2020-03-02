package com.songpeng.sparchetype.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.songpeng.sparchetype.common.util.TreeUtil;
import com.songpeng.sparchetype.system.entity.SysMenu;
import com.songpeng.sparchetype.system.mapper.SysMenuMapper;
import com.songpeng.sparchetype.system.service.ISysMenuService;
import com.songpeng.sparchetype.system.vo.TreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService {

	@Autowired
	private SysMenuMapper sysMenuMapper;

	/**
	 * 获取系统菜单树
	 *
	 * @return 系统菜单树
	 * @throws Exception 异常
	 */
	@Override
	public List<TreeVO<SysMenu>> listMenuTree() throws Exception {
		List<TreeVO<SysMenu>> menus = new ArrayList<>();
		List<SysMenu> sysMenus = sysMenuMapper.selectList(null);
		for (SysMenu m : sysMenus) {
			TreeVO<SysMenu> tree =  new TreeVO<>();
			tree.setId(m.getId());
			tree.setParentId(m.getParentId());
			tree.setName(m.getName());
			tree.setUrl(m.getUrl());
			menus.add(tree);
		}
		return TreeUtil.buildList(menus, "0");
	}
}
