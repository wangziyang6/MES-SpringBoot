package com.songpeng.sparchetype.company.client;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 公司
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@Api(tags = "公司")
@RequestMapping("/client/company")
@Controller("clientCompanyController")
public class CompanyController {

    Logger log = LoggerFactory.getLogger(CompanyController.class);

    @ApiOperation("公司首页")
    @ApiImplicitParams({@ApiImplicitParam(name ="model", value = "模型", defaultValue = "模型")})
    @GetMapping({"", "/index-ui"})
    public String indexUI(Model model) {
        return "client/company/index";
    }

    @ApiOperation("公司关于页")
    @ApiImplicitParams({@ApiImplicitParam(name ="model", value = "模型", defaultValue = "模型")})
    @GetMapping("/about-ui")
    public String aboutUI(Model model) {
        return "client/company/about";
    }

    @ApiOperation("公司案例页")
    @ApiImplicitParams({@ApiImplicitParam(name ="model", value = "模型", defaultValue = "模型")})
    @GetMapping("/case-ui")
    public String caseUI(Model model) {
        return "client/company/case";
    }

    @ApiOperation("公司新闻动态页")
    @ApiImplicitParams({@ApiImplicitParam(name ="model", value = "模型", defaultValue = "模型")})
    @GetMapping("/news-ui")
    public String newsUI(Model model) {
        return "client/company/news";
    }

    @ApiOperation("公司新闻动态详情页")
    @ApiImplicitParams({@ApiImplicitParam(name ="model", value = "模型", defaultValue = "模型")})
    @GetMapping("/news/detail-ui")
    public String newsDetailUI(Model model) {
        return "client/company/newsDetail";
    }

    @ApiOperation("公司产品页")
    @ApiImplicitParams({@ApiImplicitParam(name ="model", value = "模型", defaultValue = "模型")})
    @GetMapping("/product-ui")
    public String productUI(Model model) {
        return "client/company/product";
    }
}
