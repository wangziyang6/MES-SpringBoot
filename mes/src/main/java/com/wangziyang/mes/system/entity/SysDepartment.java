package com.wangziyang.mes.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 *
 * </p>
 *
 * @author SongPeng
 * @since 2020-03-03
 */
@TableName("sp_sys_department")
public class SysDepartment extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String parentId;

    private String name;

    private Integer sortNum;

    /**
     * 逻辑删除：1 表示删除，0 表示未删除，2 表示禁用
     */
    private String isDeleted;

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSortNum() {
        return sortNum;
    }

    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
    }

    public String getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(String isDeleted) {
        this.isDeleted = isDeleted;
    }
}
