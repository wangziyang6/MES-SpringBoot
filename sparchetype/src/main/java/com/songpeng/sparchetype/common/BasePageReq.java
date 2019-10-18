package com.songpeng.sparchetype.common;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 基础分页查询参数
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@Data
@Accessors(chain = true)
public class BasePageReq {

	private String orderBy = "last_upd";

}
