package com.wangziyang.mes.basedata.controller;


import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.basedata.dto.SpTableManagerDto;
import com.wangziyang.mes.basedata.entity.SpTableManager;
import com.wangziyang.mes.basedata.entity.SpTableManagerItem;
import com.wangziyang.mes.basedata.request.SpTableManagerReq;
import com.wangziyang.mes.basedata.service.ISpTableManagerItemService;
import com.wangziyang.mes.basedata.service.ISpTableManagerService;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 *
 * 主数据表头控制器
 *
 *
 * @author WangZiYang
 * @since 2020-03-06
 */
@Api(tags = "主数据管理")
@Controller
@RequestMapping("/basedata/manager")
public class SpTableManagerController extends BaseController {
    /**
     * 主数据平台管理服务
     */
    @Autowired
    public ISpTableManagerService iSpTableManagerService;
    /**
     * 字段明细表
     */
    @Autowired
    public ISpTableManagerItemService iSpTableManagerItemService;
    Logger log = LoggerFactory.getLogger(SpTableManagerController.class);

    /**
     * 主数据管理平台界面
     *
     * @param model 模型
     * @return 主数据管理平台界面
     */
    @ApiOperation("主数据管理平台UI")
    @ApiImplicitParams({@ApiImplicitParam(name = "model", value = "模型", defaultValue = "模型")})
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "basedata/manager/list";
    }

    /**
     * 主数据管理平台修改界面
     *
     * @param model  模型
     * @param record 平台表对象
     * @return 更改界面
     */
    @ApiOperation("主数据管理平台修改界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SpTableManager record) {
        if (StringUtils.isNotEmpty(record.getId())) {
            SpTableManager spTableManager = iSpTableManagerService.getById(record.getId());
            model.addAttribute("result", spTableManager);
        }
        return "basedata/manager/addOrUpdate";
    }


    /**
     * 主数据表头分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("主数据表头分页查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数")})
    @PostMapping("/page")
    @ResponseBody
    public Result page(SpTableManagerReq req) {
        IPage result = iSpTableManagerService.page(req);
        return Result.success(result);
    }

    /**
     * 根据表名称查询该表的全部字段
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("主根据表名称查询该表的全部字段")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "表名称", defaultValue = "请求参数")})
    @PostMapping("/by/tableName")
    @ResponseBody
    public Result queryTableFieldByName(SpTableManager req) throws Exception {
        List<SpTableManagerItem> result = iSpTableManagerService.queryTableFieldByName(req);
        return Result.success(result);
    }

    /**
     * 主数据表头修改+表字段明细修改
     *
     * @param record 平台表对象，表明细集合
     * @return 执行结果
     */
    @ApiOperation("主数据表头修改")
    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(@RequestBody SpTableManagerDto record) {
        //分解DTO 转化实体类
        SpTableManager spTableManager = new SpTableManager();
        BeanUtils.copyProperties(record, spTableManager);
        List<SpTableManagerItem> spTableManagerItems = record.getSpTableManagerItems();
        if (CollectionUtil.isEmpty(spTableManagerItems)) {
            Result.failure("显示的，详细的字段不可以为空");
        } else {
            iSpTableManagerService.saveOrUpdate(spTableManager);
            //先删除已有的数据，然后插入
            if (StringUtils.isNotEmpty(record.getId())) {
                iSpTableManagerItemService.deleteItemBytableNameId(record.getId());
            } else {
                for (SpTableManagerItem spTableManagerItem : spTableManagerItems) {
                    spTableManagerItem.setTableNameId(spTableManager.getId());
                }
            }
            iSpTableManagerItemService.saveOrUpdateBatch(spTableManagerItems);
        }
        return Result.success(record.getId());
    }

    /**
     * 级联删除主表头+明细
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("级联删除主表头+明细")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "表信息", defaultValue = "表信息")})
    @PostMapping("delete/by/tableNameId")
    @ResponseBody
    public Result deleteByTableNameId(SpTableManager req) throws Exception {
        iSpTableManagerService.removeById(req.getId());
        iSpTableManagerItemService.deleteItemBytableNameId(req.getId());
        return Result.success();
    }
}

