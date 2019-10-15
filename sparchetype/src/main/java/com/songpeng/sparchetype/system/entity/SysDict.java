package com.songpeng.sparchetype.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.songpeng.sparchetype.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统字典表
 * </p>
 *
 * @author SongPeng
 * @since 2019-08-26
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sp_sys_dict")
public class SysDict extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 标签名
     */
    private String name;

    /**
     * 数据值
     */
    private String value;

    /**
     * 类型
     */
    private String type;

    /**
     * 描述
     */
    private String descr;

    /**
     * 排序（升序）
     */
    private Integer sortNum;

    /**
     * 父级id
     */
    private String parentId;

    /**
     * 状态：逻辑已删除值(默认为 1); 逻辑未删除值(默认为 0)
     */
    private String status;

}
