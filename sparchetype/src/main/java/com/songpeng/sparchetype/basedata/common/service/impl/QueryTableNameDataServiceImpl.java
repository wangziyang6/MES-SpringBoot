package com.songpeng.sparchetype.basedata.common.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.inject.internal.util.$Nullable;
import com.songpeng.sparchetype.basedata.common.mapper.QueryTableNameDataMapper;
import com.songpeng.sparchetype.basedata.common.request.QueryTableNameDataReq;
import com.songpeng.sparchetype.basedata.common.service.QueryTableNameDataService;
import com.songpeng.sparchetype.basedata.entity.SpTableManagerItem;
import com.songpeng.sparchetype.basedata.service.ISpTableManagerItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
     * 基础数据通用查询服务
     *
     * @param page 分页对象
     * @return 数据集合
     */
    @Override
    public IPage<Map<String, String>> queryTableNameDataList(QueryTableNameDataReq page) {
        List<SpTableManagerItem> spTableManagerItems = iSpTableManagerItemService.queryItemBytableNameId(page.getTableNameId());
        StringBuilder col = new StringBuilder();
        for (SpTableManagerItem spTableManagerItem : spTableManagerItems) {
            col.append(spTableManagerItem.getField() + ",");
        }
        //剔除拼接最后的一个逗号
        String lastCol = col.substring(0, col.length() - 1);
        page.setCol(lastCol);
        page.setRecords(queryTableNameDataMapper.queryTableNameDataList(page));
        return page;
    }
}
