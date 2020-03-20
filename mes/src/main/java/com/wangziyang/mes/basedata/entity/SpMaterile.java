package com.wangziyang.mes.basedata.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 * 物料实体
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-19
 */
public class SpMaterile extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 物料编码
     */
    private String materiel;

    /**
     * 物料描述
     */
    private String materielDesc;

    /**
     * 基本单位
     */
    private String unit;

    /**
     * 产品组
     */
    private String productGroup;

    /**
     * 物料类型
     */
    private String matType;

    /**
     * 尺寸
     */
    private String size;

    /**
     * 流程ID
     */
    private String flowId;
    /**
     * 流程描述
     */
    private String flowDesc;
    /**
     * 型号
     */
    private String model;

    /**
     * 状态(00:删除;01:正常;02:禁用)
     */
    @TableField(value = "is_deleted")
    private String deleted;


    @Override
    public String toString() {
        return "SpMaterile{" +
                "materiel=" + materiel +
                ", materielDesc=" + materielDesc +
                ", unit=" + unit +
                ", productGroup=" + productGroup +
                ", matType=" + matType +
                ", size=" + size +
                ", flow=" + flowId +
                "}";
    }

    /**
     * 获取 物料编码
     *
     * @return materiel 物料编码
     */
    public String getMateriel() {
        return this.materiel;
    }

    /**
     * 设置 物料编码
     *
     * @param materiel 物料编码
     */
    public void setMateriel(String materiel) {
        this.materiel = materiel;
    }

    /**
     * 获取 物料描述
     *
     * @return materielDesc 物料描述
     */
    public String getMaterielDesc() {
        return this.materielDesc;
    }

    /**
     * 设置 物料描述
     *
     * @param materielDesc 物料描述
     */
    public void setMaterielDesc(String materielDesc) {
        this.materielDesc = materielDesc;
    }

    /**
     * 获取 基本单位
     *
     * @return unit 基本单位
     */
    public String getUnit() {
        return this.unit;
    }

    /**
     * 设置 基本单位
     *
     * @param unit 基本单位
     */
    public void setUnit(String unit) {
        this.unit = unit;
    }

    /**
     * 获取 产品组
     *
     * @return productGroup 产品组
     */
    public String getProductGroup() {
        return this.productGroup;
    }

    /**
     * 设置 产品组
     *
     * @param productGroup 产品组
     */
    public void setProductGroup(String productGroup) {
        this.productGroup = productGroup;
    }

    /**
     * 获取 物料类型
     *
     * @return matType 物料类型
     */
    public String getMatType() {
        return this.matType;
    }

    /**
     * 设置 物料类型
     *
     * @param matType 物料类型
     */
    public void setMatType(String matType) {
        this.matType = matType;
    }

    /**
     * 获取 尺寸
     *
     * @return size 尺寸
     */
    public String getSize() {
        return this.size;
    }

    /**
     * 设置 尺寸
     *
     * @param size 尺寸
     */
    public void setSize(String size) {
        this.size = size;
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

    /**
     * 获取 型号
     *
     * @return model 型号
     */
    public String getModel() {
        return this.model;
    }

    /**
     * 设置 型号
     *
     * @param model 型号
     */
    public void setModel(String model) {
        this.model = model;
    }

    /**
     * 获取 流程
     *
     * @return flowId 流程
     */
    public String getFlowId() {
        return this.flowId;
    }

    /**
     * 设置 流程
     *
     * @param flowId 流程
     */
    public void setFlowId(String flowId) {
        this.flowId = flowId;
    }

    /**
     * 获取 流程描述
     *
     * @return flowDesc 流程描述
     */
    public String getFlowDesc() {
        return this.flowDesc;
    }

    /**
     * 设置 流程描述
     *
     * @param flowDesc 流程描述
     */
    public void setFlowDesc(String flowDesc) {
        this.flowDesc = flowDesc;
    }
}
