package com.songpeng.sparchetype.common;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 基础实体类
 *
 * @author SongPeng
 * @date 2019/9/27 16:05
 */
@Data
@Accessors(chain = true)
public class BaseEntity {

    /**
     * 主键id
     */
    @TableId(type = IdType.ID_WORKER_STR)
    private String id;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime created;

    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private String createdBy;

    /**
     * 最后更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime lastUpd;

    /**
     * 最后更新人
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String lastUpdBy;
}
