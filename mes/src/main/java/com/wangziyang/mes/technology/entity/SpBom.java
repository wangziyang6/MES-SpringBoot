package com.wangziyang.mes.technology.entity;

import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 * 
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-28
 */
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
     * 逻辑删除：1 表示删除，0 表示未删除，2 表示禁用
     */
    private String isDeleted;

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
    public String getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(String isDeleted) {
        this.isDeleted = isDeleted;
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
            ", isDeleted=" + isDeleted +
        "}";
    }
}
