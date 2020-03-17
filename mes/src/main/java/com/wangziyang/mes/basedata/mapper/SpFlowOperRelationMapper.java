package com.wangziyang.mes.basedata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.basedata.entity.SpFlowOperRelation;
import com.wangziyang.mes.basedata.vo.SpOperVo;
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
     *
     * @return 工序关系集合
     */
    List<SpOperVo> queryOperRelationByFlowId(@Param("flowId") String flowId);

}
