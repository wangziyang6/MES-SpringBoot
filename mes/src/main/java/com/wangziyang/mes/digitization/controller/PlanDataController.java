package com.wangziyang.mes.digitization.controller;

import com.wangziyang.mes.common.BaseController;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统登录
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@RequestMapping("/digitization/plan")
@Controller("PlanDataController")
public class PlanDataController extends BaseController {

    Logger logger = LoggerFactory.getLogger(PlanDataController.class);

    /**
     * 工单计划数字化看板
     *
     * @param model 视图对象
     * @return 工单计划数字化看板界面
     */
    @ApiOperation("工单计划数字化看板")
    @GetMapping("/plan-ui")
    public String welcomeUI(Model model) {
        return "digitization/planDemo";
    }


}
