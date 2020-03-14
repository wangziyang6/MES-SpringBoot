package com.wangziyang.mes.common.enums;

/**
 * 系统用户枚举
 *
 * @author SongPeng
 * @date 2019/10/17 9:45
 */
public enum CommonEnum {

    /**
     * 类型：0 目录；1 菜单；2 按钮
     */
    FIELD_NAME_IS_DELETED("is_deleted", "数据库删除标记字段名"),

    FIELD_NAME_CREATE_TIME("create_time", "数据库创建时间字段名"),

    FIELD_NAME_CREATE_USERNAME("create_username", "数据库创建用户名字段名"),

    FIELD_NAME_UPDATE_TIME("update_time", "数据库更新时间字段名"),

    FIELD_NAME_UPDATE_USERNAME("update_username", "数据库更新用户名字段名");

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

    CommonEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }
}
