package com.wangziyang.mes.basedata.dto;

import com.wangziyang.mes.basedata.entity.SpTableManager;
import com.wangziyang.mes.basedata.entity.SpTableManagerItem;

import java.util.List;

/**
 * 基础主数据管理DTO
 *
 * @author wangziyang
 * @since 20200316
 */
public class SpTableManagerDto extends SpTableManager {
    /**
     * 表显示的字段
     */
    private List<SpTableManagerItem> spTableManagerItems;

    /**
     * 获取 表显示的字段
     *
     * @return spTableManagerItems 表显示的字段
     */
    public List<SpTableManagerItem> getSpTableManagerItems() {
        return this.spTableManagerItems;
    }

    /**
     * 设置 表显示的字段
     *
     * @param spTableManagerItems 表显示的字段
     */
    public void setSpTableManagerItems(List<SpTableManagerItem> spTableManagerItems) {
        this.spTableManagerItems = spTableManagerItems;
    }
}
