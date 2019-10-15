package com.songpeng.sparchetype.system.dto;

import com.songpeng.sparchetype.system.entity.SysUser;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author SongPeng
 * @date 2019/9/30 9:49
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class SysUserDto extends SysUser {
}
