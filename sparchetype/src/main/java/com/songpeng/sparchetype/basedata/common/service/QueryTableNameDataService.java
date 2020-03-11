package com.songpeng.sparchetype.basedata.common.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.songpeng.sparchetype.basedata.common.request.QueryTableNameDataReq;

import java.util.List;
import java.util.Map;

/**
 * @author wangziyang
 * @since 2020/03/11
 * 基础数据通用CURD服务接口
 */
public interface QueryTableNameDataService {
    /**
     * 基础数据通用查询服务
     *
     * @param req 列组合
     * @return 数据集合
     */
    IPage<Map<String, String>> queryTableNameDataList(QueryTableNameDataReq req);

}
