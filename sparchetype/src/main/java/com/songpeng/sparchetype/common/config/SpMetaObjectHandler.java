package com.songpeng.sparchetype.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

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
		this.setInsertData(metaObject);
		this.setUpdateData(metaObject);
	}

	@Override
	public void updateFill(MetaObject metaObject) {
		log.info("start update fill ...");
		setUpdateData(metaObject);
	}

	private void setInsertData(MetaObject metaObject) {
		this.setInsertFieldValByName("createdBy", "SongPeng", metaObject);
		this.setInsertFieldValByName("created", LocalDateTime.now(), metaObject);
	}

	private void setUpdateData(MetaObject metaObject) {
		this.setUpdateFieldValByName("lastUpdBy", "SongPeng", metaObject);
		this.setUpdateFieldValByName("lastUpd", LocalDateTime.now(), metaObject);
	}
}
