package com.songpeng.sparchetype.system.controller.admin;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.songpeng.sparchetype.common.Result;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@RequestMapping("/admin")
@Controller("adminSysLoginController")
public class SysLoginController {

    Logger log = LoggerFactory.getLogger(SysLoginController.class);

    /**
     * 后台管理首页
     *
     * @param model
     * @return
     */
    @GetMapping({"", "/index"})
    public String indexUI(Model model) {
        return "admin/index";
    }

    /**
     * 后台管理欢迎页
     *
     * @param model
     * @return
     */
    @GetMapping("/welcome-ui")
    public String welcomeUI(Model model) {
        return "admin/welcome";
    }

    @ApiOperation("系统首页初始化菜单树数据")
    @GetMapping("/tree")
    @ResponseBody
    public Result tree() {
        JSONObject jsonObject = JSONUtil.parseObj("{\n" +
                "  \"clearInfo\": {\n" +
                "    \"clearUrl\": \"json/clear.json\"\n" +
                "  },\n" +
                "  \"homeInfo\": {\n" +
                "    \"title\": \"首页\",\n" +
                "    \"icon\": \"fa fa-home\",\n" +
                "    \"href\": \"admin/welcome-ui\"\n" +
                "  },\n" +
                "  \"logoInfo\": {\n" +
                "    \"title\": \"后台管理\",\n" +
                "    \"image\": \"image/logo.png\",\n" +
                "    \"href\": \"\"\n" +
                "  },\n" +
                "  \"menuInfo\": {\n" +
                "    \"currency\": {\n" +
                "      \"title\": \"常规管理\",\n" +
                "      \"icon\": \"fa fa-address-book\",\n" +
                "      \"child\": [\n" +
                "        {\n" +
                "          \"title\": \"系统管理\",\n" +
                "          \"href\": \"\",\n" +
                "          \"icon\": \"fa fa-gears\",\n" +
                "          \"target\": \"_self\",\n" +
                "          \"child\": [\n" +
                "            {\n" +
                "              \"title\": \"用户管理\",\n" +
                "              \"href\": \"/admin/sys/user/list-ui\",\n" +
                "              \"icon\": \"fa fa-user\",\n" +
                "              \"target\": \"_self\"\n" +
                "            },\n" +
                "            {\n" +
                "              \"title\": \"角色管理\",\n" +
                "              \"href\": \"/admin/sys/role/list-ui\",\n" +
                "              \"icon\": \"fa fa-child\",\n" +
                "              \"target\": \"_self\"\n" +
                "            },\n" +
                "            {\n" +
                "              \"title\": \"菜单管理\",\n" +
                "              \"href\": \"/admin/sys/menu/list-ui\",\n" +
                "              \"icon\": \"fa fa-bars\",\n" +
                "              \"target\": \"_self\"\n" +
                "            }\n" +
                "          ]\n" +
                "        },\n" +
                "        {\n" +
                "          \"title\": \"异常页面\",\n" +
                "          \"href\": \"\",\n" +
                "          \"icon\": \"fa fa-exclamation-triangle\",\n" +
                "          \"target\": \"_self\",\n" +
                "          \"child\": [\n" +
                "            {\n" +
                "              \"title\": \"404页面\",\n" +
                "              \"href\": \"/404-ui\",\n" +
                "              \"icon\": \"fa fa-hourglass-end\",\n" +
                "              \"target\": \"_self\"\n" +
                "            }\n" +
                "          ]\n" +
                "        },\n" +
                "        {\n" +
                "          \"title\": \"Swagger\",\n" +
                "          \"href\": \"\",\n" +
                "          \"icon\": \"fa fa-bug\",\n" +
                "          \"target\": \"_self\",\n" +
                "          \"child\": [\n" +
                "            {\n" +
                "              \"title\": \"API\",\n" +
                "              \"href\": \"/swagger-ui.html\",\n" +
                "              \"icon\": \"fa fa-hourglass-end\",\n" +
                "              \"target\": \"_self\"\n" +
                "            }\n" +
                "          ]\n" +
                "        }\n" +
                "      ]\n" +
                "    },\n" +
                "    \"component\": {\n" +
                "      \"title\": \"组件管理\",\n" +
                "      \"icon\": \"fa fa-lemon-o\",\n" +
                "      \"child\": [\n" +
                "        {\n" +
                "          \"title\": \"图标列表\",\n" +
                "          \"href\": \"/admin/sys/tool/icon-ui\",\n" +
                "          \"icon\": \"fa fa-dot-circle-o\",\n" +
                "          \"target\": \"_self\"\n" +
                "        },\n" +
                "        {\n" +
                "          \"title\": \"图标选择\",\n" +
                "          \"href\": \"/admin/sys/tool/icon-picker-ui\",\n" +
                "          \"icon\": \"fa fa-adn\",\n" +
                "          \"target\": \"_self\"\n" +
                "        },\n" +
                "        {\n" +
                "          \"title\": \"颜色选择\",\n" +
                "          \"href\": \"/admin/sys/tool/color-select-ui\",\n" +
                "          \"icon\": \"fa fa-dashboard\",\n" +
                "          \"target\": \"_self\"\n" +
                "        },\n" +
                "        {\n" +
                "          \"title\": \"分步表单\",\n" +
                "          \"href\": \"/admin/sys/tool/form-step-ui\",\n" +
                "          \"icon\": \"fa fa-navicon\",\n" +
                "          \"target\": \"_self\"\n" +
                "        },\n" +
                "        {\n" +
                "          \"title\": \"富文本编辑器\",\n" +
                "          \"href\": \"/admin/sys/tool/editor-ui\",\n" +
                "          \"icon\": \"fa fa-edit\",\n" +
                "          \"target\": \"_self\"\n" +
                "        },\n" +
                "        {\n" +
                "          \"title\": \"登录-1\",\n" +
                "          \"href\": \"page/login-1.html\",\n" +
                "          \"icon\": \"fa fa-stumbleupon-circle\",\n" +
                "          \"target\": \"_blank\"\n" +
                "        },\n" +
                "        {\n" +
                "          \"title\": \"登录-2\",\n" +
                "          \"href\": \"page/login-2.html\",\n" +
                "          \"icon\": \"fa fa-viacoin\",\n" +
                "          \"target\": \"_blank\"\n" +
                "        }\n" +
                "      ]\n" +
                "    },\n" +
                "    \"other\": {\n" +
                "      \"title\": \"其它管理\",\n" +
                "      \"icon\": \"fa fa-slideshare\",\n" +
                "      \"child\": [\n" +
                "        {\n" +
                "          \"title\": \"多级菜单\",\n" +
                "          \"href\": \"\",\n" +
                "          \"icon\": \"fa fa-meetup\",\n" +
                "          \"target\": \"\",\n" +
                "          \"child\": [\n" +
                "            {\n" +
                "              \"title\": \"按钮1\",\n" +
                "              \"href\": \"page/button.html\",\n" +
                "              \"icon\": \"fa fa-calendar\",\n" +
                "              \"target\": \"_self\",\n" +
                "              \"child\": [\n" +
                "                {\n" +
                "                  \"title\": \"按钮2\",\n" +
                "                  \"href\": \"page/button.html\",\n" +
                "                  \"icon\": \"fa fa-snowflake-o\",\n" +
                "                  \"target\": \"_self\",\n" +
                "                  \"child\": [\n" +
                "                    {\n" +
                "                      \"title\": \"按钮3\",\n" +
                "                      \"href\": \"page/button.html\",\n" +
                "                      \"icon\": \"fa fa-snowflake-o\",\n" +
                "                      \"target\": \"_self\"\n" +
                "                    },\n" +
                "                    {\n" +
                "                      \"title\": \"表单4\",\n" +
                "                      \"href\": \"page/form.html\",\n" +
                "                      \"icon\": \"fa fa-calendar\",\n" +
                "                      \"target\": \"_self\"\n" +
                "                    }\n" +
                "                  ]\n" +
                "                }\n" +
                "              ]\n" +
                "            }\n" +
                "          ]\n" +
                "        }\n" +
                "      ]\n" +
                "    }\n" +
                "  }\n" +
                "}");
        return Result.success(jsonObject);
    }

}
