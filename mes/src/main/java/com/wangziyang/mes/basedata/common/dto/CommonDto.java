package com.wangziyang.mes.basedata.common.dto;

import com.wangziyang.mes.common.BaseEntity;

/**
 * @author wangziyang
 * 基础数据通用查询复杂对象
 */
public class CommonDto extends BaseEntity {
    /**
     * 表名称
     */
    private String tableName;
    /**
     * 关联表ID
     */
    private String tableNameId;
    /**
     * 列头
     */
    private String col;
    /**
     * 值
     */
    private String values;

    /**
     * 获取 表名称
     *
     * @return tableName 表名称
     */
    public String getTableName() {
        return this.tableName;
    }

    /**
     * 设置 表名称
     *
     * @param tableName 表名称
     */
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    /**
     * 获取 关联表ID
     *
     * @return tableNameId 关联表ID
     */
    public String getTableNameId() {
        return this.tableNameId;
    }

    /**
     * 设置 关联表ID
     *
     * @param tableNameId 关联表ID
     */
    public void setTableNameId(String tableNameId) {
        this.tableNameId = tableNameId;
    }

    /**
     * 获取 列头
     *
     * @return col 列头
     */
    public String getCol() {
        return this.col;
    }

    /**
     * 设置 列头
     *
     * @param col 列头
     */
    public void setCol(String col) {
        this.col = col;
    }


    /**
     * 获取 值
     *
     * @return values 值
     */
    public String getValues() {
        return this.values;
    }

    /**
     * 设置 值
     *
     * @param values 值
     */
    public void setValues(String values) {
        this.values = values;
    }
}
