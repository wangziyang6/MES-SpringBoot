package com.songpeng.sparchetype.basedata.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.songpeng.sparchetype.basedata.entity.SpTableManagerItem;

import java.util.List;

/**
 * <p>
 * 服务类
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
