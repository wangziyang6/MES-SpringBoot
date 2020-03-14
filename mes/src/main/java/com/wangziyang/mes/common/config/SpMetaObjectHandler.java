package com.wangziyang.mes.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.wangziyang.mes.system.entity.SysUser;
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

    Logger logger = LoggerFactory.getLogger(SpMetaObjectHandler.class);

    @Override
    public void insertFill(MetaObject metaObject) {
        logger.info("start insert fill ...");
        this.setInsertData(metaObject);
        this.setUpdateData(metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        logger.info("start update fill ...");
        this.setUpdateData(metaObject);
    }

    private void setInsertData(MetaObject metaObject) {
        SysUser sysUser = (SysUser) SecurityUtils.getSubject().getPrincipal();
        this.setInsertFieldValByName("createUsername", sysUser.getUsername(), metaObject);
        this.setInsertFieldValByName("createTime", LocalDateTime.now(), metaObject);
    }

    private void setUpdateData(MetaObject metaObject) {
        SysUser sysUser = (SysUser) SecurityUtils.getSubject().getPrincipal();
        this.setUpdateFieldValByName("updateUsername", sysUser.getUsername(), metaObject);
        this.setUpdateFieldValByName("updateTime", LocalDateTime.now(), metaObject);
    }
}
