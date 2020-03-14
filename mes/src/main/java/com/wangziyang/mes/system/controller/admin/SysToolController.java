package com.wangziyang.mes.system.controller.admin;


import com.wangziyang.mes.common.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>
 * 前端工具集控制器
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-31
 */
@Controller("adminSysToolController")
@RequestMapping("/admin/sys/tool")
public class SysToolController extends BaseController {

    Logger logger = LoggerFactory.getLogger(SysToolController.class);

    /**
     * 图标列表
     *
     * @param model
     * @return
     */
    @GetMapping("/icon-ui")
    public String iconUI(Model model) {
        return "admin/system/tool/icon";
    }

    /**
     * 图标选择
     *
     * @param model
     * @return
     */
    @GetMapping("/icon-picker-ui")
    public String iconPickerUI(Model model) {
        return "admin/system/tool/iconPicker";
    }

    /**
     * 颜色选择
     *
     * @param model
     * @return
     */
    @GetMapping("/color-select-ui")
    public String colorSelectUI(Model model) {
        return "admin/system/tool/colorSelect";
    }

    /**
     * 颜色选择
     *
     * @param model
     * @return
     */
    @GetMapping("/editor-ui")
    public String editorUI(Model model) {
        return "admin/system/tool/editor";
    }

    /**
     * 颜色选择
     *
     * @param model
     * @return
     */
    @GetMapping("/form-step-ui")
    public String formStepUI(Model model) {
        return "admin/system/tool/formStep";
    }

}
