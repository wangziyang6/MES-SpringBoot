package com.songpeng.sparchetype.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

/**
 * @author SongPeng
 * @date 2019/8/27
 */
@Component
@Slf4j
public class SpMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ...");
        this.setFieldValByName("created", "SongPeng", metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ...");
        this.setFieldValByName("lastUpd", "SongPeng", metaObject);
    }
}
