package com.wangziyang.mes.basedata.dto;

import com.wangziyang.mes.basedata.entity.SpFlow;
import com.wangziyang.mes.basedata.entity.SpFlowOperRelation;
import com.wangziyang.mes.basedata.vo.SpOperVo;

import java.util.List;

/**
 * 流程DTO
 */
public class SpFlowDto extends SpFlow {
    /**
     * 流程与工序关系集合
     */
    private List<SpOperVo> spOperVoList;

    public List<SpOperVo> getSpOperVoList() {
        return spOperVoList;
    }

    public void setSpOperVoList(List<SpOperVo> spOperVoList) {
        this.spOperVoList = spOperVoList;
    }
}
