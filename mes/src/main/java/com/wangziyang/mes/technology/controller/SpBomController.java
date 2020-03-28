package com.wangziyang.mes.technology.controller;


import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.wangziyang.mes.common.BaseController;

/**
 * <p>
 *  BOM前端控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-28
 */
@Controller
@RequestMapping("/technology/bom")
public class SpBomController extends BaseController {
    /**
     * 工艺BOM管理界面
     *
     * @param model 模型
     * @return 工艺BOM管理界面
     */
    @ApiOperation("工艺BOM管理界面UI")
    @ApiImplicitParams({@ApiImplicitParam(name = "model", value = "模型", defaultValue = "模型")})
    @GetMapping("/list-ui")
    public String listUI(Model model) {
        return "basedata/flowprocess/list";
    }

}
