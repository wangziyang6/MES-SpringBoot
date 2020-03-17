package com.wangziyang.mes.basedata.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.basedata.dto.SpFlowDto;
import com.wangziyang.mes.basedata.entity.SpFlow;
import com.wangziyang.mes.basedata.entity.SpFlowOperRelation;
import com.wangziyang.mes.basedata.entity.SpOper;
import com.wangziyang.mes.basedata.mapper.SpFlowOperRelationMapper;
import com.wangziyang.mes.basedata.service.ISpFlowOperRelationService;
import com.wangziyang.mes.basedata.service.ISpFlowService;
import com.wangziyang.mes.basedata.service.ISpOperService;
import com.wangziyang.mes.basedata.vo.SpOperVo;
import com.wangziyang.mes.common.Result;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
@Service
public class SpFlowOperRelationServiceImpl extends ServiceImpl<SpFlowOperRelationMapper, SpFlowOperRelation> implements ISpFlowOperRelationService {

    Logger log = LoggerFactory.getLogger(SpFlowOperRelationServiceImpl.class);

    /**
     * 流程基础数据服务
     */
    @Autowired
    public ISpFlowService iSpFlowService;

    /**
     * 工序基础数据服务
     */
    @Autowired
    public ISpOperService iSpOperService;

    /**
     * 全部工序集合
     *
     * @return 工序VO集合
     * @throws Exception 异常
     */
    @Override
    public List<SpOperVo> allOperViewServer() throws Exception {
        List<SpOper> operList = iSpOperService.list();
        List<SpOperVo> spOperVos = new ArrayList<>();
        //得出全部的工序数据
        for (SpOper spOper : operList) {
            SpOperVo operVo = new SpOperVo();
            operVo.setValue(spOper.getId());
            operVo.setTitle(spOper.getOper());
            spOperVos.add(operVo);
        }
        return spOperVos;
    }

    /**
     * 绘制当前流程下的工序
     *
     * @return 工序VO集合
     * @throws Exception 异常
     */
    @Override
    public List<SpOperVo> currentOperViewServer(String flowId) throws Exception {

        return null;
    }

    /**
     * 流程与工序关系新增与修改
     *
     * @param spFlowDto 流程信息DTO
     * @return 执行结果
     * @throws Exception 异常
     */
    public Result addOrUpdate(SpFlowDto spFlowDto) throws Exception {
        List<SpOperVo> spOperVoList = spFlowDto.getSpOperVoList();
        List<SpFlowOperRelation> spFlowOperRelationList = new ArrayList<>();
        StringBuilder processBuild = new StringBuilder();
        if (CollectionUtil.isEmpty(spOperVoList)) {
            throw new Exception("流程下的工序不能为空");
        }
        SpFlow spFlow = new SpFlow();
        BeanUtils.copyProperties(spFlowDto, spFlow);
        String flowId = spFlow.getId();
        String flow = spFlow.getFlow();
        if (StringUtils.isNotEmpty(flowId)) {
            //TODO  根据流程ID 批量删除下挂的工序
        }
        // 批量处理需要插入数据库的工序
        log.info("开始处理流程下工序关系");
        for (int i = 0; i < spOperVoList.size(); i++) {
            SpFlowOperRelation relation = new SpFlowOperRelation();
            relation.setFlowId(flowId);//流程ID
            relation.setFlow(flow);//流程编号
            if (i == 0) {//首个工序
                relation.setPerOperId("");
                relation.setPerOper("");
                //下一道工序
                relation.setNextOperId(spOperVoList.get(i + 1).getValue());
                relation.setNextOper(spOperVoList.get(i + 1).getTitle());
            } else if (i + 1 >= spOperVoList.size()) {//末尾工序
                //前一道工序
                relation.setPerOperId(spOperVoList.get(i - 1).getValue());
                relation.setPerOper(spOperVoList.get(i - 1).getTitle());
                relation.setNextOperId("");
                relation.setNextOper("");
            } else {
                //前一道工序
                relation.setPerOperId(spOperVoList.get(i - 1).getValue());
                relation.setPerOper(spOperVoList.get(i - 1).getTitle());
                //下一道工序
                relation.setNextOperId(spOperVoList.get(i + 1).getValue());
                relation.setNextOper(spOperVoList.get(i + 1).getTitle());
            }
            //当前工序
            relation.setOperId(spOperVoList.get(i).getValue());
            relation.setOper(spOperVoList.get(i).getTitle());
            relation.setSortNum(i + 1);//顺序
            processBuild.append("123->");
            spFlowOperRelationList.add(relation);
        }
        log.info("本次流程时序" + processBuild.toString());
        spFlow.setProcess(processBuild.toString());
        //保存流程头表信息
        iSpFlowService.saveOrUpdate(spFlow);
        saveOrUpdateBatch(spFlowOperRelationList);
        return Result.success();
    }

}
