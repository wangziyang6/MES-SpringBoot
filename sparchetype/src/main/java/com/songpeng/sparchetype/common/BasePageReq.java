package com.songpeng.sparchetype.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * 基础分页查询参数
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
public class BasePageReq extends Page {

    private String orderBy = "last_upd";

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }
}
