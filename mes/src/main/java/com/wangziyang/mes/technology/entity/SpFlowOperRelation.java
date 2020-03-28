package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 *流程与工序关系实体
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
@TableName("sp_flow_oper_relation")
public class SpFlowOperRelation extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 流程ID
     */
    private String flowId;

    /**
     * 流程代码
     */
    private String flow;

    /**
     * 前道工序ID
     */
    private String perOperId;

    /**
     * 前道工序代码
     */
    private String perOper;

    /**
     * 当前工序ID
     */
    private String operId;

    /**
     * 当前工序
     */
    private String oper;

    /**
     * 下道工序ID
     */
    private String nextOperId;

    /**
     * 下道工序
     */
    private String nextOper;

    /**
     * 排序
     */
    private Integer sortNum;

    /**
     * 工序类型（首道工序firstOper;最后一道工序lastOper）
     */
    private String operType;


    /**
     * 获取 流程ID
     *
     * @return flowId 流程ID
     */
    public String getFlowId() {
        return this.flowId;
    }

    /**
     * 设置 流程ID
     *
     * @param flowId 流程ID
     */
    public void setFlowId(String flowId) {
        this.flowId = flowId;
    }

    /**
     * 获取 流程代码
     *
     * @return flow 流程代码
     */
    public String getFlow() {
        return this.flow;
    }

    /**
     * 设置 流程代码
     *
     * @param flow 流程代码
     */
    public void setFlow(String flow) {
        this.flow = flow;
    }

    /**
     * 获取 前道工序ID
     *
     * @return perOperId 前道工序ID
     */
    public String getPerOperId() {
        return this.perOperId;
    }

    /**
     * 设置 前道工序ID
     *
     * @param perOperId 前道工序ID
     */
    public void setPerOperId(String perOperId) {
        this.perOperId = perOperId;
    }

    /**
     * 获取 前道工序代码
     *
     * @return perOper 前道工序代码
     */
    public String getPerOper() {
        return this.perOper;
    }

    /**
     * 设置 前道工序代码
     *
     * @param perOper 前道工序代码
     */
    public void setPerOper(String perOper) {
        this.perOper = perOper;
    }

    /**
     * 获取 当前工序ID
     *
     * @return operId 当前工序ID
     */
    public String getOperId() {
        return this.operId;
    }

    /**
     * 设置 当前工序ID
     *
     * @param operId 当前工序ID
     */
    public void setOperId(String operId) {
        this.operId = operId;
    }

    /**
     * 获取 当前工序
     *
     * @return oper 当前工序
     */
    public String getOper() {
        return this.oper;
    }

    /**
     * 设置 当前工序
     *
     * @param oper 当前工序
     */
    public void setOper(String oper) {
        this.oper = oper;
    }

    /**
     * 获取 下道工序ID
     *
     * @return nextOperId 下道工序ID
     */
    public String getNextOperId() {
        return this.nextOperId;
    }

    /**
     * 设置 下道工序ID
     *
     * @param nextOperId 下道工序ID
     */
    public void setNextOperId(String nextOperId) {
        this.nextOperId = nextOperId;
    }

    /**
     * 获取 下道工序
     *
     * @return nextOper 下道工序
     */
    public String getNextOper() {
        return this.nextOper;
    }

    /**
     * 设置 下道工序
     *
     * @param nextOper 下道工序
     */
    public void setNextOper(String nextOper) {
        this.nextOper = nextOper;
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
     * 获取 工序类型（首道工序firstOper;最后一道工序lastOper）
     *
     * @return operType 工序类型（首道工序firstOper;最后一道工序lastOper）
     */
    public String getOperType() {
        return this.operType;
    }

    /**
     * 设置 工序类型（首道工序firstOper;最后一道工序lastOper）
     *
     * @param operType 工序类型（首道工序firstOper;最后一道工序lastOper）
     */
    public void setOperType(String operType) {
        this.operType = operType;
    }
}
