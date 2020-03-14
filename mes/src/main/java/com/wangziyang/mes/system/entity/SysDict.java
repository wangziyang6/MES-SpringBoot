package com.wangziyang.mes.system.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 * 系统字典表
 * </p>
 *
 * @author SongPeng
 * @since 2019-08-26
 */
@TableName("sp_sys_dict")
public class SysDict extends BaseEntity {

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
     * 状态：逻辑已删除值(默认为 1); 逻辑未删除值(默认为 0)
     */
    @TableField(value = "is_deleted")
    private String deleted;

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

    public String getDeleted() {
        return deleted;
    }

    public void setDeleted(String deleted) {
        this.deleted = deleted;
    }
}
