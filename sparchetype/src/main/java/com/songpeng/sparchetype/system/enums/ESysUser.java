package com.songpeng.sparchetype.system.enums;

/**
 * 系统用户枚举
 *
 * @author SongPeng
 * @date 2019/10/17 9:45
 */
public enum ESysUser {
	STATUS_NORMAL("0", "正常"),

	STATUS_DEL("1", "删除"),

	STATUS_DISABLED("2", "禁用");

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
