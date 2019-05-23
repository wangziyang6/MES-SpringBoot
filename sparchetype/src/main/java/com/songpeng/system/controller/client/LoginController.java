package com.songpeng.system.controller.client;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 登录 Controller
 *
 * @author songpeng
 * @date 2019-04-19
 */
@Controller("clientLoginController")
public class LoginController {

    /**
     * 日志记录器
     */
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    /**
     * 访问首页
     *
     * @param model
     * @return
     */
    @GetMapping({"/", ""})
    String welcome(Model model) {
        return "redirect:/blog";
    }

    /**
     * 访问后台管理系统首页
     *
     * @param model
     * @return
     */
    @GetMapping({"/index"})
    String index(Model model) {
//        List<Tree<MenuDO>> menus = menuService.listMenuTree(getUserId());
//        model.addAttribute("menus", menus);
//        model.addAttribute("name", getUser().getName());
//        FileDO fileDO = fileService.get(getUser().getPicId());
//        if (fileDO != null && fileDO.getUrl() != null) {
//            if (fileService.isExist(fileDO.getUrl())) {
//                model.addAttribute("picUrl", fileDO.getUrl());
//            } else {
//                model.addAttribute("picUrl", "/img/photo_s.jpg");
//            }
//        } else {
//            model.addAttribute("picUrl", "/img/photo_s.jpg");
//        }
//        model.addAttribute("username", getUser().getUsername());
        return "admin/index";
    }

    @GetMapping("/main")
    String main() {
        return "admin/main";
    }

}
