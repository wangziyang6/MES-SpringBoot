package com.songpeng.sparchetype.basedata.dto;

import com.songpeng.sparchetype.basedata.entity.SpTableManager;
import com.songpeng.sparchetype.basedata.entity.SpTableManagerItem;

import java.util.List;

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
