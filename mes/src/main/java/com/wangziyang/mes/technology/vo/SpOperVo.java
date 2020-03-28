package com.wangziyang.mes.technology.vo;

/**
 * 流程与工序穿梭数据展示对象
 *
 * @author wangziyang
 * @since 2020/03/16
 */
public class SpOperVo {
    /**
     * 具体的存储的ID值
     */
    private String value;
    /**
     * 显示标题
     */
    private String title;

    /**
     * 获取 具体的存储的ID值
     *
     * @return value 具体的存储的ID值
     */
    public String getValue() {
        return this.value;
    }

    /**
     * 设置 具体的存储的ID值
     *
     * @param value 具体的存储的ID值
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * 获取 显示标题
     *
     * @return title 显示标题
     */
    public String getTitle() {
        return this.title;
    }

    /**
     * 设置 显示标题
     *
     * @param title 显示标题
     */
    public void setTitle(String title) {
        this.title = title;
    }
}
