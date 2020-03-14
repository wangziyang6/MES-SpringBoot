package com.wangziyang.mes.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.system.entity.SysDict;
import com.wangziyang.mes.system.mapper.SysDictMapper;
import com.wangziyang.mes.system.service.ISysDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统字典表 服务实现类
 * </p>
 *
 * @author SongPeng
 * @since 2019-08-26
 */
@Service
public class SysDictServiceImpl extends ServiceImpl<SysDictMapper, SysDict> implements ISysDictService {

    @Autowired
    private SysDictMapper sysDictMapper;
}
