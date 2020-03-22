package com.wangziyang.mes.basedata.common.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.basedata.common.dto.CommonDto;
import com.wangziyang.mes.basedata.common.request.QueryTableNameDataReq;
import com.wangziyang.mes.basedata.entity.SpTableManagerItem;

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
     * @param req 分页请求对象。直接作为DTO
     * @return 数据集合
     */
    List<Map<String, String>> queryTableNameDataList(QueryTableNameDataReq req);

    /**
     * 根据前台传来的ID 查询数据
     *
     * @param commonDto 通用查询对象
     * @return 单行数据集合
     */
    List<Map<String, String>> queryTableNameById(CommonDto commonDto);

    /**
     * 基础数据通用保存
     *
     * @param commonDto 通用数据传输
     */
    void commonSave(CommonDto commonDto);

    /**
     * 基础数据通用修改
     *
     * @param commonDto 通用数据传输
     */


    void commonUpdate(CommonDto commonDto);

    /**
     * 通用删除服务
     *
     * @param commonDto 通用数据传输
     */
    void commonDelete(CommonDto commonDto);
}
