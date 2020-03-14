package com.wangziyang.mes.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 *
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-16
 */
@TableName("sp_sys_menu")
public class SysMenu extends BaseEntity {

    private static final long serialVersionUID = 1L;

	/**
	 * 编码
	 */
	private String code;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Integer getSortNum() {
		return sortNum;
	}

	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
