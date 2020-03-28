package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 * 流程实体类
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
@TableName(value = "sp_flow")
public class SpFlow extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 流程
     */
    private String flow;

    /**
     * 流程描述
     */
    private String flowDesc;

    /**
     * 流程时序绘制 A——>B——>C
     */
    private String process;



    @Override
    public String toString() {
        return "SpFlow{" +
            "flow=" + flow +
            ", flowDesc=" + flowDesc +
            ", process=" + process +
        "}";
    }

    /**
     * 获取 流程
     *
     * @return flow 流程
     */
    public String getFlow() {
        return this.flow;
    }

    /**
     * 设置 流程
     *
     * @param flow 流程
     */
    public void setFlow(String flow) {
        this.flow = flow;
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

    /**
     * 获取 流程时序绘制 A——>B——>C
     *
     * @return process 流程时序绘制 A——>B——>C
     */
    public String getProcess() {
        return this.process;
    }

    /**
     * 设置 流程时序绘制 A——>B——>C
     *
     * @param process 流程时序绘制 A——>B——>C
     */
    public void setProcess(String process) {
        this.process = process;
    }
}
