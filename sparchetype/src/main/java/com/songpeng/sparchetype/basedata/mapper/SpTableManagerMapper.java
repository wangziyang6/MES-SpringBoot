package com.songpeng.sparchetype.basedata.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.songpeng.sparchetype.basedata.entity.SpTableManager;
import com.songpeng.sparchetype.basedata.entity.SpTableManagerItem;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-06
 */
public interface SpTableManagerMapper extends BaseMapper<SpTableManager> {
    List<SpTableManagerItem> queryTableFieldByName(SpTableManager req);

}
