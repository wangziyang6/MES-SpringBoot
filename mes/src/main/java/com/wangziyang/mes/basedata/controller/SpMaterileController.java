package com.wangziyang.mes.basedata.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.basedata.entity.SpMaterile;
import com.wangziyang.mes.basedata.entity.SpTableManager;
import com.wangziyang.mes.basedata.request.SpFlowReq;
import com.wangziyang.mes.basedata.service.ISpMaterileService;
import com.wangziyang.mes.common.Result;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.wangziyang.mes.common.BaseController;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  物料控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-19
 */
@Controller
@RequestMapping("/basedata/materile")
public class SpMaterileController extends BaseController {

    /**
     * 物料服务
     */
    @Autowired
    private ISpMaterileService iSpMaterileService;
    /**
     * 物料管理界面
     *
     * @param model 模型
     * @return 物料管理界面
     */
    @ApiOperation("物料管理界面UI")
    @ApiImplicitParams({@ApiImplicitParam(name = "model", value = "模型", defaultValue = "模型")})
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "basedata/materile/list";
    }


    /**
     * 物料管理修改界面
     *
     * @param model  模型
     * @param record 平台表对象
     * @return 更改界面
     */
    @ApiOperation("物料管理修改界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, SpTableManager record) {
        if (StringUtils.isNotEmpty(record.getId())) {
            SpMaterile SpMaterile = iSpMaterileService.getById(record.getId());
            model.addAttribute("result", SpMaterile);
        }
        return "basedata/materile/addOrUpdate";
    }


    /**
     * 物料管理界面分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("物料管理界面分页查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数")})
    @PostMapping("/page")
    @ResponseBody
    public Result page(SpFlowReq req) {
        IPage result = iSpMaterileService.page(req);
        return Result.success(result);
    }
}
