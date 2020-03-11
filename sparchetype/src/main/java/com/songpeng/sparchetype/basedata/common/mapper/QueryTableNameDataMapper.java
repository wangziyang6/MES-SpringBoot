package com.songpeng.sparchetype.basedata.common.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.songpeng.sparchetype.basedata.common.request.QueryTableNameDataReq;
import com.songpeng.sparchetype.basedata.entity.SpTableManagerItem;

import java.util.List;
import java.util.Map;

/**
 * 基础数据查询maper
 *
 * @author WANGZIYANG
 * @since 2020/03/11
 */
public interface QueryTableNameDataMapper extends BaseMapper<SpTableManagerItem> {
    /**
     * 基础数据通用查询服务
     *
     * @param col       列组合
     * @param tableName 表名称
     * @return 数据集合
     */
    List<Map<String, String>> queryTableNameDataList(QueryTableNameDataReq req);
}
