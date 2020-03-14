package com.wangziyang.mes.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * 基础分页查询参数
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
public class BasePageReq extends Page {

    private String orderBy = "update_time";

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }
}
