package com.songpeng.sparchetype.basedata.common.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.songpeng.sparchetype.basedata.common.dto.CommonDto;
import com.songpeng.sparchetype.basedata.common.request.QueryTableNameDataReq;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author wangziyang
 * @since 2020/03/11
 * 基础数据通用CURD服务接口
 */
public interface QueryTableNameDataService {
    /**
     * 基础数据通用分页查询服务
     *
     * @param req 列组合
     * @return 数据集合
     */
    IPage<Map<String, String>> queryTableNameDataList(QueryTableNameDataReq req);

    /**
     * 根据前台传来的ID 查询数据
     *
     * @param commonDto 通用查询对象
     * @return 单行数据集合
     */
    List<Map<String, String>> queryTableNameById( CommonDto commonDto);

    /**
     * 拼接列功能
     * @return 列
     */
    String buildCol(String tableNameId);

}
