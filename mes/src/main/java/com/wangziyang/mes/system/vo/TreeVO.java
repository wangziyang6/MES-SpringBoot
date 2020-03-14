package com.wangziyang.mes.system.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * @param <T>
 */
public class TreeVO<T> {
    /**
     * 节点ID
     */
    private String id;

    /**
     * 显示节点文本
     */
    private String name;

    /**
     * 节点是否被选中 true false
     */
    private boolean checked = false;

    /**
     * 类型
     */
    private String type;

    /**
     * icon
     */
    private String icon;

    /**
     * 节点属性
     */
    private String url;

    /**
     * 父ID
     */
    private String pid;

    /**
     * 权限标识
     */
    private String permission;

    /**
     * target
     */
    private String target;

    /**
     * 编码
     */
    private String code;

    /**
     * 是否有父节点
     */
    private boolean haveParent = false;

    /**
     * 是否有子节点
     */
    private boolean haveChild = false;

    /**
     * 节点的子节点
     */
    private List<TreeVO<T>> children = new ArrayList<TreeVO<T>>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public boolean isHaveParent() {
        return haveParent;
    }

    public void setHaveParent(boolean haveParent) {
        this.haveParent = haveParent;
    }

    public boolean isHaveChild() {
        return haveChild;
    }

    public void setHaveChild(boolean haveChild) {
        this.haveChild = haveChild;
    }

    public List<TreeVO<T>> getChildren() {
        return children;
    }

    public void setChildren(List<TreeVO<T>> children) {
        this.children = children;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}