package com.songpeng.sparchetype.system.enums;

/**
 * 系统用户枚举
 *
 * @author SongPeng
 * @date 2019/10/17 9:45
 */
public enum ESysUser {
	/**
	 * 状态(00:删除;01:正常;02:禁用)
	 */
	STATUS_DEL("00", "删除"),

	STATUS_NORMAL("01", "正常"),

	STATUS_DISABLED("02", "禁用");

	/**
	 * The Code
	 */
	String code;
	/**
	 * The Desc
	 */
	String desc;

	public String getCode() {
		return code;
	}

	public String getDesc() {
		return desc;
	}

	ESysUser(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}
}
