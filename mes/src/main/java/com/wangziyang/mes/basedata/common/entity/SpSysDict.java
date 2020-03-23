package com.wangziyang.mes.basedata.common.entity;

import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 * 系统字典表
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-23
 */
public class SpSysDict extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 标签名
     */
    private String name;

    /**
     * 数据值
     */
    private String value;

    /**
     * 类型
     */
    private String type;

    /**
     * 描述
     */
    private String descr;

    /**
     * 排序（升序）
     */
    private Integer sortNum;

    /**
     * 父级id
     */
    private String parentId;

    /**
     * 逻辑删除：1 表示删除，0 表示未删除，2 表示禁用
     */
    private String isDeleted;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }
    public Integer getSortNum() {
        return sortNum;
    }

    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
    }
    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
    public String getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(String isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "SpSysDict{" +
            "name=" + name +
            ", value=" + value +
            ", type=" + type +
            ", descr=" + descr +
            ", sortNum=" + sortNum +
            ", parentId=" + parentId +
            ", isDeleted=" + isDeleted +
        "}";
    }
}
