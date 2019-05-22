package com.songpeng.common.utils;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * @author songpeng
 * @date 2019/05/22
 */
public interface SpMapper<T> extends Mapper<T>, MySqlMapper<T> {
}
