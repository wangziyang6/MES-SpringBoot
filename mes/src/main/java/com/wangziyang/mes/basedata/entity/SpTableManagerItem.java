package com.wangziyang.mes.basedata.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 *
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-06
 */
@TableName("sp_table_manager_item")
public class SpTableManagerItem extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 表名称id
     */
    private String tableNameId;

    /**
     * 字段
     */
    private String field;

    /**
     * 字段描述
     */
    private String fieldDesc;

    /**
     * 排序
     */
    private Integer sortNum;
    /**
     * 是否必填
     */
    private String mustFill;

    /**
     * 获取 表名称id
     *
     * @return tableNameId 表名称id
     */
    public String getTableNameId() {
        return this.tableNameId;
    }

    /**
     * 设置 表名称id
     *
     * @param tableNameId 表名称id
     */
    public void setTableNameId(String tableNameId) {
        this.tableNameId = tableNameId;
    }

    /**
     * 获取 字段
     *
     * @return field 字段
     */
    public String getField() {
        return this.field;
    }

    /**
     * 设置 字段
     *
     * @param field 字段
     */
    public void setField(String field) {
        this.field = field;
    }

    /**
     * 获取 字段描述
     *
     * @return fieldDesc 字段描述
     */
    public String getFieldDesc() {
        return this.fieldDesc;
    }

    /**
     * 设置 字段描述
     *
     * @param fieldDesc 字段描述
     */
    public void setFieldDesc(String fieldDesc) {
        this.fieldDesc = fieldDesc;
    }

    /**
     * 获取 排序
     *
     * @return sortNum 排序
     */
    public Integer getSortNum() {
        return this.sortNum;
    }

    /**
     * 设置 排序
     *
     * @param sortNum 排序
     */
    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
    }

    /**
     * 获取 是否必填
     *
     * @return mustFill 是否必填
     */
    public String getMustFill() {
        return this.mustFill;
    }

    /**
     * 设置 是否必填
     *
     * @param mustFill 是否必填
     */
    public void setMustFill(String mustFill) {
        this.mustFill = mustFill;
    }
}
