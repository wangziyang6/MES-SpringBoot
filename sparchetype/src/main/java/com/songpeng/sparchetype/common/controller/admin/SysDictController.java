package com.songpeng.sparchetype.common.controller.admin;


import com.songpeng.sparchetype.common.BaseController;
import com.songpeng.sparchetype.common.entity.SysDict;
import com.songpeng.sparchetype.common.service.ISysDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * <p>
 * 系统字典表 前端控制器
 * </p>
 *
 * @author SongPeng
 * @since 2019-08-26
 */
@RestController
@RequestMapping("/admin/sys/dict")
public class SysDictController extends BaseController {

    @Autowired
    private ISysDictService sysDictService;

    @PostMapping("add")
    public String add(SysDict sysDict) {
        sysDict.setCreated(LocalDateTime.now()).setCreatedBy("test").setLastUpd(LocalDateTime.now()).setLastUpdBy("test");
        boolean save = sysDictService.save(sysDict);
        return "success: " + save;
    }
}
