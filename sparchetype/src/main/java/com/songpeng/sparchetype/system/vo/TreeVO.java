package com.songpeng.sparchetype.system.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
     * 节点属性
     */
    private String url;

    /**
     * 父ID
     */
    private String parentId;

    /**
     * 是否有父节点
     */
    private boolean hasParent = false;

    /**
     * 是否有子节点
     */
    private boolean hasChildren = false;

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

    public boolean isHasParent() {
        return hasParent;
    }

    public void setHasParent(boolean hasParent) {
        this.hasParent = hasParent;
    }

    public boolean isHasChildren() {
        return hasChildren;
    }

    public void setHasChildren(boolean hasChildren) {
        this.hasChildren = hasChildren;
    }

    public List<TreeVO<T>> getChildren() {
        return children;
    }

    public void setChildren(List<TreeVO<T>> children) {
        this.children = children;
    }
}