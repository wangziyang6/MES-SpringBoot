package com.wangziyang.mes.technology.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.wangziyang.mes.common.BaseEntity;

/**
 * <p>
 *工序实体类
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
@TableName(value = "sp_oper")
public class SpOper extends BaseEntity {

    private static final long serialVersionUID = 1L;
    /**
     * 工序
     */
    private String oper;
    /**
     * 工序描述
     */
    private String operDesc;


    @Override
    public String toString() {
        return "SpOper{" +
                "oper=" + oper +
                ", operDesc=" + operDesc +
                "}";
    }

    /**
     * 获取 工序
     *
     * @return oper 工序
     */
    public String getOper() {
        return this.oper;
    }

    /**
     * 设置 工序
     *
     * @param oper 工序
     */
    public void setOper(String oper) {
        this.oper = oper;
    }

    /**
     * 获取 工序描述
     *
     * @return operDesc 工序描述
     */
    public String getOperDesc() {
        return this.operDesc;
    }

    /**
     * 设置 工序描述
     *
     * @param operDesc 工序描述
     */
    public void setOperDesc(String operDesc) {
        this.operDesc = operDesc;
    }
}
