package com.wangziyang.mes.basedata.common.request;

import com.wangziyang.mes.common.BasePageReq;

/**
 * @author wangziyang
 * @since 2020/03/11
 * 基础数据通用分页查询 对象
 */
public class QueryTableNameDataReq extends BasePageReq {
    /**
     * 表配置明细字段关联ID
     */
    private String tableNameId;

    /**
     * 表名称
     */
    private String tableName;

    private String col;

    /**
     * 获取 表配置明细字段关联ID
     *
     * @return tableNameId 表配置明细字段关联ID
     */
    public String getTableNameId() {
        return this.tableNameId;
    }

    /**
     * 设置 表配置明细字段关联ID
     *
     * @param tableNameId 表配置明细字段关联ID
     */
    public void setTableNameId(String tableNameId) {
        this.tableNameId = tableNameId;
    }

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

    public String getCol() {
        return col;
    }

    public void setCol(String col) {
        this.col = col;
    }
}
