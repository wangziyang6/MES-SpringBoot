package com.songpeng.sparchetype.basedata.controller;


import com.songpeng.sparchetype.basedata.entity.SpTableManagerItem;
import com.songpeng.sparchetype.basedata.service.ISpTableManagerItemService;
import com.songpeng.sparchetype.common.BaseController;
import com.songpeng.sparchetype.common.Result;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
