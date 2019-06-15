package com.songpeng.system.enmus;

/**
 * 用户对象枚举
 *
 * @author songpeng
 * @date 2019/6/15
 */
public enum ESysUser {
    /**
     * 用户状态：已删除
     */
    STATUS_DELETED("0", "删除"),

    /**
     * 用户状态：正常
     */
    STATUS_NORMAL("1", "正常"),

    /**
     * 用户状态：禁用
     */
    STATUS_DISABLED("2", "禁用");

    private String value;

    private String desc;

    ESysUser(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
