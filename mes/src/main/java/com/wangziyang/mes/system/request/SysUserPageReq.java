package com.wangziyang.mes.system.request;

import com.wangziyang.mes.common.BasePageReq;

/**
 * <p>
 * 系统用户分页查询参数
 * </p>
 *
 * @author SongPeng
 * @since 2019-10-15
 */
public class SysUserPageReq extends BasePageReq {

    /**
     * 姓名
     */
    private String nameLike;

    /**
     * 用户名
     */
    private String usernameLike;

    public String getNameLike() {
        return nameLike;
    }

    public void setNameLike(String nameLike) {
        this.nameLike = nameLike;
    }

    public String getUsernameLike() {
        return usernameLike;
    }

    public void setUsernameLike(String usernameLike) {
        this.usernameLike = usernameLike;
    }
}
