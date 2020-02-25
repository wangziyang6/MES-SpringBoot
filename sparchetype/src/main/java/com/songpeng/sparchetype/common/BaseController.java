package com.songpeng.sparchetype.common;

import com.songpeng.sparchetype.system.entity.SysUser;
import org.apache.shiro.SecurityUtils;

/**
 * 基础前端控制器
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
public class BaseController {

    public SysUser getSysUser() {
        return (SysUser) SecurityUtils.getSubject().getPrincipal();
    }
}
