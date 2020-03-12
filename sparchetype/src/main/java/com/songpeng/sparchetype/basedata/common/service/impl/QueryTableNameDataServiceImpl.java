package com.songpeng.sparchetype.basedata.common.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.songpeng.sparchetype.basedata.common.dto.CommonDto;
import com.songpeng.sparchetype.basedata.common.mapper.QueryTableNameDataMapper;
import com.songpeng.sparchetype.basedata.common.request.QueryTableNameDataReq;
import com.songpeng.sparchetype.basedata.common.service.QueryTableNameDataService;
import com.songpeng.sparchetype.basedata.entity.SpTableManagerItem;
import com.songpeng.sparchetype.basedata.service.ISpTableManagerItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 基础数据通用查询service
 *
 * @author wangziyang
 * @since 2020/03/11
 */
@Service
public class QueryTableNameDataServiceImpl implements QueryTableNameDataService {
    /**
     * 基础数据通用查询mpapper
     */
    @Autowired
    public QueryTableNameDataMapper queryTableNameDataMapper;
    /**
     * 查询配置表明细服务
     */
    @Autowired
    public ISpTableManagerItemService iSpTableManagerItemService;

    /**
     * 基础数据通用分页查询服务
     *
     * @param page 分页对象
     * @return 数据集合
     */
    @Override
    public IPage<Map<String, String>> queryTableNameDataList(QueryTableNameDataReq page) {
        page.setCol(buildCol(page.getTableNameId()));
        page.setRecords(queryTableNameDataMapper.queryTableNameDataList(page));
        return page;
    }

    /**
     *
     * 根据前台传来的ID 查询数据
     *
     * @param commonDto 通用查询对象
     * @return 单行数据集合
     */
    @Override
    public List<Map<String, String>> queryTableNameById(CommonDto commonDto) {
        commonDto.setCol(buildCol(commonDto.getTableNameId()));
        return queryTableNameDataMapper.queryTableNameById(commonDto);
    }

    /**
     * 根据表ID构建对应的查询列
     *
     * @param tableNameId 表明细关联ID
     * @return 构造好的列
     */
    @Override
    public String buildCol(String tableNameId) {
        List<SpTableManagerItem> spTableManagerItems = iSpTableManagerItemService.queryItemBytableNameId(tableNameId);
        StringBuilder col = new StringBuilder();
        for (SpTableManagerItem spTableManagerItem : spTableManagerItems) {
            col.append(spTableManagerItem.getField() + ",");
        }
        //剔除拼接最后的一个逗号
        String lastCol = col.substring(0, col.length() - 1);
        return lastCol;
    }
}
