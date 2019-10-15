package com.songpeng.sparchetype.system.entity;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableName;
import com.songpeng.sparchetype.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sp_sys_user")
public class SysUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 姓名
     */
    private String name;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 部门id
     */
    private String deptId;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 手机号
     */
    private String mobile;

    /**
     * 固定电话
     */
    private String tel;

    /**
     * 性别(0:女;1:男;2:其他)
     */
    private String sex;

    /**
     * 出生年月日
     */
    private LocalDateTime birthday;

    /**
     * 图片id，对应sys_file表中的id
     */
    private String picId;

    /**
     * 身份证
     */
    private String idCard;

    /**
     * 爱好
     */
    private String hobby;

    /**
     * 省份
     */
    private String province;

    /**
     * 城市
     */
    private String city;

    /**
     * 区县
     */
    private String district;

    /**
     * 街道
     */
    private String street;

    /**
     * 门牌号
     */
    private String streetNumber;

    /**
     * 描述
     */
    private String descr;

    /**
     * 状态(0:删除;1:正常;2:禁用)
     */
    private String status;


}
