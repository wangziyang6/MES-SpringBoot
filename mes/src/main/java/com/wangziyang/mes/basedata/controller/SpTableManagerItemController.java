package com.wangziyang.mes.basedata.controller;


import com.wangziyang.mes.basedata.entity.SpTableManagerItem;
import com.wangziyang.mes.basedata.service.ISpTableManagerItemService;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 基础主数据，表明细控制器
 *
 * @author WangZiYang
 * @since 2020-03-06
 */
@Controller
@RequestMapping("/basedata/manager/item")
public class SpTableManagerItemController extends BaseController {


    /**
     * 业务表字段明细
     */
    @Autowired
    private ISpTableManagerItemService iSpTableManagerItemService;

    /**
     * 主数据维护界面
     *
     * @param model 模型
     * @return 主数据维护界面
     */
    @ApiOperation("主数据管理平台UI")
    @ApiImplicitParams({@ApiImplicitParam(name = "model", value = "模型", defaultValue = "模型")})
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "basedata/manageritem/list";
    }

    /**
     * 根据表名称查询该表的全部字段数据库明细
     *
     * @param tableNameId 主表ID
     * @return Result 执行结果
     */
    @ApiOperation("根据表名称查询该表的全部字段数据库明细")
    @ApiImplicitParams({@ApiImplicitParam(name = "tableNameId", value = "主表ID", defaultValue = "请求参数")})
    @PostMapping("/by/tableNameId")
    @ResponseBody
    public Result queryTableFieldByName(@RequestParam(value = "tableNameId") String tableNameId) throws Exception {
        List<SpTableManagerItem> result = iSpTableManagerItemService.queryItemBytableNameId(tableNameId);
        return Result.success(result);
    }

}
