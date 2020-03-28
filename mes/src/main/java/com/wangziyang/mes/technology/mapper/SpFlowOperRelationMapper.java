package com.wangziyang.mes.technology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.technology.entity.SpFlowOperRelation;
import com.wangziyang.mes.technology.vo.SpOperVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
public interface SpFlowOperRelationMapper extends BaseMapper<SpFlowOperRelation> {
    /**
     * 根据流程ID查询下挂的全部工序
     * @param flowId 流程关联ID
     * @return 工序关系集合
     */
    List<SpOperVo> queryOperRelationByFlowId(@Param("flowId") String flowId);

    /**
     * 删除流程下挂的全部工序
     * @param flowId 流程关联ID
     */
    void  deleteOperRelationByFlowId(@Param("flowId") String flowId);

}
