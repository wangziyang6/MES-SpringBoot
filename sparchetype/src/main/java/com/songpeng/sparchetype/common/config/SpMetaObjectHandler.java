package com.songpeng.sparchetype.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.songpeng.sparchetype.system.entity.SysUser;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * @author SongPeng
 * @date 2019/8/27
 */
@Component
public class SpMetaObjectHandler implements MetaObjectHandler {

    Logger log = LoggerFactory.getLogger(SpMetaObjectHandler.class);

    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ...");
        this.setInsertData(metaObject);
        this.setUpdateData(metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ...");
        setUpdateData(metaObject);
    }

    private void setInsertData(MetaObject metaObject) {
        SysUser sysUser = (SysUser) SecurityUtils.getSubject().getPrincipal();
        this.setInsertFieldValByName("createdBy", sysUser.getUsername(), metaObject);
        this.setInsertFieldValByName("created", LocalDateTime.now(), metaObject);
    }

    private void setUpdateData(MetaObject metaObject) {
        SysUser sysUser = (SysUser) SecurityUtils.getSubject().getPrincipal();
        this.setUpdateFieldValByName("lastUpdBy", sysUser.getUsername(), metaObject);
        this.setUpdateFieldValByName("lastUpd", LocalDateTime.now(), metaObject);
    }
}
