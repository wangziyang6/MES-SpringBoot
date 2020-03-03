package com.songpeng.sparchetype.system.entity;

import com.songpeng.sparchetype.common.BaseEntity;

/**
 * <p>
 *
 * </p>
 *
 * @author SongPeng
 * @since 2020-03-03
 */
public class SysDepartment extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String parentId;

    private String name;

    private Integer sortNum;

    /**
     * 逻辑删除：1 表示删除，0 表示未删除，2 表示禁用
     */
    private String isDeleted;


}
