package com.wangziyang.mes.basedata.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.basedata.entity.SpTableManagerItem;
import com.wangziyang.mes.basedata.mapper.SpTableManagerItemMapper;
import com.wangziyang.mes.basedata.service.ISpTableManagerItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 主数据表明细服务实现类
 * </p>
 *
 * @author WangZiYang
 * @since 2020-03-06
 */
@Service
public class SpTableManagerItemServiceImpl extends ServiceImpl<SpTableManagerItemMapper, SpTableManagerItem> implements ISpTableManagerItemService {
    /**
     * 表明细mapper
     */
    @Autowired
    public SpTableManagerItemMapper spTableManagerItemMapper;

    /**
     * 根据主表ID 查询该表的明细
     *
     * @param tableNameId 关联主表ID
     * @return 表字段明细
     */
    @Override
    public List<SpTableManagerItem> queryItemBytableNameId(String tableNameId) {
        return spTableManagerItemMapper.queryItemBytableNameId(tableNameId);
    }


    /**
     * 根据主表ID 删除明细
     *
     * @param tableNameId 关联主表ID
     */
    @Override
    public void deleteItemBytableNameId(String tableNameId) {
        spTableManagerItemMapper.deleteItemBytableNameId(tableNameId);
    }
}
