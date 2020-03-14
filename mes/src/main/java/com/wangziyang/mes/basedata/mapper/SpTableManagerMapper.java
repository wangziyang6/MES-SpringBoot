package com.wangziyang.mes.basedata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wangziyang.mes.basedata.entity.SpTableManager;
import com.wangziyang.mes.basedata.entity.SpTableManagerItem;

import java.util.List;

/**
 * 主数据表头Mapper 接口
 *
 * @author WangZiYang
 * @since 2020-03-06
 */
public interface SpTableManagerMapper extends BaseMapper<SpTableManager> {
    /**
     * 查询表对应的字段
     *
     * @param req 表信息
     * @return 字段信息
     */
    List<SpTableManagerItem> queryTableFieldByName(SpTableManager req);
}
