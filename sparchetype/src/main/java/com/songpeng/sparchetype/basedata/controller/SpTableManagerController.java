package com.songpeng.sparchetype.basedata.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.songpeng.sparchetype.basedata.request.SpTableManagerReq;
import com.songpeng.sparchetype.basedata.service.ISpTableManagerService;
import com.songpeng.sparchetype.common.BaseController;
import com.songpeng.sparchetype.common.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-06
 */
@Api(tags = "主数据管理")
@Controller
@RequestMapping("/basedata/")
public class SpTableManagerController extends BaseController {
    @Autowired
    private ISpTableManagerService iSpTableManagerService;
    Logger log = LoggerFactory.getLogger(SpTableManagerController.class);

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


}
