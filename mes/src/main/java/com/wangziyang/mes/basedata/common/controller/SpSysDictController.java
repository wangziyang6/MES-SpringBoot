package com.wangziyang.mes.basedata.common.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wangziyang.mes.basedata.common.entity.SpSysDict;
import com.wangziyang.mes.basedata.common.service.ISpSysDictService;
import com.wangziyang.mes.common.BaseController;
import com.wangziyang.mes.common.Result;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 * 系统字典表 前端控制器
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-23
 */
@Controller
@RequestMapping("/basedata/dict")
public class SpSysDictController extends BaseController {
    /**
     * 字典表服务
     */
    @Autowired
    public ISpSysDictService iSpSysDictService;

    /**
     * 查询字典表数据
     *
     * @param type 字典表 数据类型
     * @return 字典数据结果集合
     */
    @GetMapping("/list/{type}")
    @ApiOperation("根据表类型，字典表集合查询")
    @ResponseBody
    public Result queryDictList(@PathVariable String type) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("type", type);
        List<SpSysDict> list = iSpSysDictService.list(queryWrapper);
        return Result.success(list);
    }

}
