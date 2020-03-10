package com.songpeng.sparchetype.basedata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.songpeng.sparchetype.basedata.entity.SpTableManagerItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-06
 */
public interface SpTableManagerItemMapper extends BaseMapper<SpTableManagerItem> {
    /**
     * 根据主表ID 查询该表的明细
     *
     * @param tableNameId 关联主表ID
     * @return 表字段明细
     */
    List<SpTableManagerItem> queryItemBytableNameId(@Param("tableNameId") String tableNameId);

    /**
     * 根据主表ID 删除明细
     *
     * @param tableNameId 关联主表ID
     */
    void deleteItemBytableNameId(@Param("tableNameId") String tableNameId);
}
