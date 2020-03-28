package com.wangziyang.mes.technology.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wangziyang.mes.basedata.request.SpTableManagerReq;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import com.wangziyang.mes.technology.request.SpBomReq;
import com.wangziyang.mes.technology.service.ISpBomService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * BOM前端控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-28
 */
@Controller
@RequestMapping("/technology/bom")
public class SpBomController extends BaseController {
    /**
     * bom服务
     */
    @Autowired
    private ISpBomService iSpBomService;
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

        return "technology/bom/list";
    }


    /**
     * 工艺BOM分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("工艺BOM分页分页查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "请求参数", defaultValue = "请求参数")})
    @PostMapping("/page")
    @ResponseBody
    public Result page(SpBomReq req) {
           IPage result = iSpBomService.page(req);
        return Result.success(result);
    }



}
