package com.wangziyang.mes.technology.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wangziyang.mes.basedata.request.SpTableManagerReq;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.dto.SpFlowDto;
import com.wangziyang.mes.technology.entity.SpFlow;
import com.wangziyang.mes.technology.service.ISpFlowOperRelationService;
import com.wangziyang.mes.technology.service.ISpFlowService;
import com.wangziyang.mes.technology.service.ISpOperService;
import com.wangziyang.mes.technology.vo.SpOperVo;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 流程与工序关系控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-14
 */
@Controller
@RequestMapping("/basedata/flow/process")
public class SpFlowOperRelationController extends BaseController {
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
     * 流程与工序基础数据服务
     */
    @Autowired
    public ISpFlowOperRelationService iSpFlowOperRelationService;

    /**
     * 流程与工序关系管理界面
     *
     * @param model 模型
     * @return 流程与工序关系管理界面
     */
    @ApiOperation("流程与工序关系管理界面UI")
    @ApiImplicitParams({@ApiImplicitParam(name = "model", value = "模型", defaultValue = "模型")})
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "technology/flowprocess/list";
    }


    /**
     * 流程与工序关系管理编辑界面
     *
     * @param model  模型
     * @param record 平台表对象
     * @return 更改界面
     */
    @ApiOperation("流程与工序关系管理编辑界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SpFlow record) throws Exception {
        List<SpOperVo> allSpOperVos = iSpFlowOperRelationService.allOperViewServer();
        //全部工序
        model.addAttribute("allOper", allSpOperVos);
        if (StringUtils.isNotEmpty(record.getId())) {
            SpFlow flowbyId = iSpFlowService.getById(record.getId());
            //当前流程信息
            model.addAttribute("flow", flowbyId);
            List<SpOperVo> currentSpOperVos = iSpFlowOperRelationService.currentOperViewServer(record.getId());
            model.addAttribute("currentOper", currentSpOperVos);
        }
        return "technology/flowprocess/addOrUpdate";
    }


    /**
     * 流程信息分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("流程信息分页查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数")})
    @PostMapping("/page")
    @ResponseBody
    public Result page(SpTableManagerReq req) {
        //   IPage result = iSpTableManagerService.page(req);
        return Result.success();
    }


    /**
     * 流程与工序关系管理新增+修改
     *
     * @param spFlowDto 流程与工序DTO
     * @return 执行结果
     */
    @ApiOperation("流程与工序关系管理新增+修改")
    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(@RequestBody SpFlowDto spFlowDto) throws Exception {
        return iSpFlowOperRelationService.addOrUpdate(spFlowDto);
    }

    /**
     * 删除流程与工序关系
     *
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("删除流程与工序关系")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "流程实体", defaultValue = "流程实体")})
    @PostMapping("/delete")
    @ResponseBody
    public Result deleteByTableNameId(SpFlowDto req) throws Exception {
        //先删除流程头表
        iSpFlowService.removeById(req.getId());
        //删除流程关系表
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("flow_id", req.getId());
        iSpFlowOperRelationService.remove(queryWrapper);
        return Result.success();
    }

}

