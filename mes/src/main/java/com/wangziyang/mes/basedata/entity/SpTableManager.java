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
@TableName("sp_table_manager")
public class SpTableManager extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 表名称
     */
    private String tableName;

    /**
     * 表描述
     */
    private String tableDesc;

    /**
     * 逻辑删除：1 表示删除，0 表示未删除，2 表示禁用
     */
    private String isDeleted;

    /**
     * 授权(多个用逗号分隔，如：sys:menu:list,sys:menu:create)
     */
    private String permission;

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
     * 获取 表描述
     *
     * @return tableDesc 表描述
     */
    public String getTableDesc() {
        return this.tableDesc;
    }

    /**
     * 设置 表描述
     *
     * @param tableDesc 表描述
     */
    public void setTableDesc(String tableDesc) {
        this.tableDesc = tableDesc;
    }

    /**
     * 获取 逻辑删除：1 表示删除，0 表示未删除，2 表示禁用
     *
     * @return isDeleted 逻辑删除：1 表示删除，0 表示未删除，2 表示禁用
     */
    public String getIsDeleted() {
        return this.isDeleted;
    }

    /**
     * 设置 逻辑删除：1 表示删除，0 表示未删除，2 表示禁用
     *
     * @param isDeleted 逻辑删除：1 表示删除，0 表示未删除，2 表示禁用
     */
    public void setIsDeleted(String isDeleted) {
        this.isDeleted = isDeleted;
    }

    /**
     * 获取 授权(多个用逗号分隔，如：sys:menu:listsys:menu:create)
     *
     * @return permission 授权(多个用逗号分隔，如：sys:menu:listsys:menu:create)
     */
    public String getPermission() {
        return this.permission;
    }

    /**
     * 设置 授权(多个用逗号分隔，如：sys:menu:listsys:menu:create)
     *
     * @param permission 授权(多个用逗号分隔，如：sys:menu:listsys:menu:create)
     */
    public void setPermission(String permission) {
        this.permission = permission;
    }


}
