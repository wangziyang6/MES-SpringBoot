package com.songpeng.sparchetype.basedata.common.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.songpeng.sparchetype.basedata.common.dto.CommonDto;
import com.songpeng.sparchetype.basedata.common.request.QueryTableNameDataReq;
import com.songpeng.sparchetype.basedata.common.service.TableNameDataService;
import com.songpeng.sparchetype.common.BaseController;
import com.songpeng.sparchetype.common.Result;
import com.songpeng.sparchetype.system.entity.SysUser;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author wangziyang
 *
 * <p>对基础数据表CURD控制器</p>
 * @since 2020/03/11
 */
@Controller
@RequestMapping("basedata/common")
public class TableNameDataController  extends BaseController {
    /**
     * 通用基础数据service
     */
    @Autowired
    private TableNameDataService tableNameDataService;

    /**
     * 根据参数查询的表名称，拼接SQL语句分页查询
     *
     * @param req 请求参数
     * @return Result 执行结果
     */
    @ApiOperation("根据参数查询的表名称，拼接SQL语句分页查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "req", value = "tableName,tableNameId", defaultValue = "请求参数")})
    @PostMapping("/page")
    @ResponseBody
    public Result page(QueryTableNameDataReq req) throws Exception {
        if (StringUtils.isEmpty(req.getTableName()) || StringUtils.isEmpty(req.getTableNameId())) {
            throw new Exception("未选中表信息");
        }
        IPage<Map<String, String>> page = tableNameDataService.queryTableNameDataList(req);
        return Result.success(page);
    }

    /**
     * 主数据维护修改界面
     *
     * @param model     模型
     * @param commonDto 通用查询对象
     * @return 更改界面
     */
    @ApiOperation("主数据维护修改界面")
    @GetMapping("/add-or-update-ui")
    public String addOrUpdateUI(Model model, CommonDto commonDto) throws Exception {
        if (StringUtils.isNotEmpty(commonDto.getId())) {
            List<Map<String, String>> maps = tableNameDataService.queryTableNameById(commonDto);
            model.addAttribute("result", maps);
        }
        model.addAttribute("table", commonDto);
        return "basedata/manageritem/addOrUpdate";
    }


    /**
     * 主数据通用修改和新增
     *
     * @param request 请求对象
     * @return 执行结果
     */
    @ApiOperation("主数据表头修改")
    @PostMapping("/add-or-update")
    @ResponseBody
    public Result addOrUpdate(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        SysUser user =getSysUser();
        if (StringUtils.isNotEmpty(id)) {
            //TODO 修改当前数据
            tableNameDataService.commonUpdate(request,user);
        } else {
            //TODO 新增当前表数据
            tableNameDataService.commonSave(request,user);
        }
        return Result.success();
    }
}