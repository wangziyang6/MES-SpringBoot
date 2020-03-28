package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 * bom头表实体
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-28
 */
@TableName(value = "sp_bom")
public class SpBom extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * bom编号
     */
    private String bomCode;

    /**
     * 物料ID
     */
    private String materielCode;

    /**
     * 物料描述
     */
    private String materielDesc;

    /**
     * 备注
     */
    private String remark;

    /**
     * 版本号
     */
    private String versionNumber;

    /**
     * BOM状态 creat创建 pass审核通过
     */
    private String state;

    /**
     * 工厂
     */
    private String factory;

    /**
     * 状态(00:删除;01:正常;02:禁用)
     */
    @TableField(value = "is_deleted")
    private String deleted;

    public String getBomCode() {
        return bomCode;
    }

    public void setBomCode(String bomCode) {
        this.bomCode = bomCode;
    }

    public String getMaterielCode() {
        return materielCode;
    }

    public void setMaterielCode(String materielCode) {
        this.materielCode = materielCode;
    }

    public String getMaterielDesc() {
        return materielDesc;
    }

    public void setMaterielDesc(String materielDesc) {
        this.materielDesc = materielDesc;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getVersionNumber() {
        return versionNumber;
    }

    public void setVersionNumber(String versionNumber) {
        this.versionNumber = versionNumber;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }


    @Override
    public String toString() {
        return "SpBom{" +
                "bomCode=" + bomCode +
                ", materielCode=" + materielCode +
                ", materielDesc=" + materielDesc +
                ", remark=" + remark +
                ", versionNumber=" + versionNumber +
                ", state=" + state +
                ", factory=" + factory +
                "}";
    }

    /**
     * 获取 状态(00:删除;01:正常;02:禁用)
     *
     * @return deleted 状态(00:删除;01:正常;02:禁用)
     */
    public String getDeleted() {
        return this.deleted;
    }

    /**
     * 设置 状态(00:删除;01:正常;02:禁用)
     *
     * @param deleted 状态(00:删除;01:正常;02:禁用)
     */
    public void setDeleted(String deleted) {
        this.deleted = deleted;
    }
}
