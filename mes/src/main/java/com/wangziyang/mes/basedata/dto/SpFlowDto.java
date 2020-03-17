package com.wangziyang.mes.basedata.dto;

import com.wangziyang.mes.basedata.entity.SpFlow;
import com.wangziyang.mes.basedata.entity.SpFlowOperRelation;

import java.util.List;

/**
 * 流程DTO
 */
public class SpFlowDto extends SpFlow {
    /**
     * 流程与工序关系集合
     */
    private List<SpFlowOperRelation> spFlowOperRelationList;

    /**
     * 获取 流程与工序关系集合
     *
     * @return spFlowOperRelationList 流程与工序关系集合
     */
    public List<SpFlowOperRelation> getSpFlowOperRelationList() {
        return this.spFlowOperRelationList;
    }

    /**
     * 设置 流程与工序关系集合
     *
     * @param spFlowOperRelationList 流程与工序关系集合
     */
    public void setSpFlowOperRelationList(List<SpFlowOperRelation> spFlowOperRelationList) {
        this.spFlowOperRelationList = spFlowOperRelationList;
    }
}
