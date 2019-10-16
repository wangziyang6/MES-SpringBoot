package com.songpeng.sparchetype.system.entity;

import com.songpeng.sparchetype.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 *
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class SysMenu extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 菜单名称
	 */
	private String name;

	/**
	 * 菜单URL
	 */
	private String url;

	/**
	 * 父菜单ID，一级菜单设为0
	 */
	private String parentId;

	/**
	 * 层级：1级、2级、3级......
	 */
	private String grade;

	/**
	 * 排序
	 */
	private Integer sortNum;

	/**
	 * 类型：0 目录；1 菜单；2 按钮
	 */
	private String type;

	/**
	 * 授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)
	 */
	private String permission;

	/**
	 * 菜单图标
	 */
	private String icon;

	/**
	 * 描述
	 */
	private String descr;

}
