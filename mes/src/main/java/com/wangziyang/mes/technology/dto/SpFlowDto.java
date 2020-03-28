package com.wangziyang.mes.technology.dto;

import com.wangziyang.mes.technology.entity.SpFlow;
import com.wangziyang.mes.technology.vo.SpOperVo;

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
