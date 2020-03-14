package com.wangziyang.mes.basedata.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.basedata.entity.SpTableManagerItem;

import java.util.List;

/**
 * <p>
 * 主数据表明细服务类
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-06
 */
public interface ISpTableManagerItemService extends IService<SpTableManagerItem> {
    /**
     * 根据主表ID 查询该表的明细
     *
     * @param tableNameId 关联主表ID
     * @return 表字段明细
     */
    List<SpTableManagerItem> queryItemBytableNameId(String tableNameId);

    /**
     * 根据主表ID 删除明细
     *
     * @param tableNameId 关联主表ID
     */
    void deleteItemBytableNameId(String tableNameId);


}
