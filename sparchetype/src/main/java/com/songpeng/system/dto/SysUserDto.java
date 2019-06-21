package com.songpeng.system.dto;

import com.songpeng.common.utils.StringUtil;
import com.songpeng.system.domain.SysRole;
import com.songpeng.system.domain.SysUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * 系统用户 dto
 *
 * @author songpeng
 * @date 2019/5/23
 */
public class SysUserDto extends SysUser implements UserDetails {

    /**
     * 用户角色集合
     */
    private List<SysRole> roleList;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<SimpleGrantedAuthority> authorityList = new ArrayList<>();
        authorityList.add(new SimpleGrantedAuthority("ROLE_USER"));

        // 加入角色权限
        if (CollectionUtils.isEmpty(roleList)) {
            for (SysRole role : roleList) {
                if (StringUtil.isNotBlank(role.getCode())) {
                    authorityList.add(new SimpleGrantedAuthority("ROLE_" + role.getCode().toUpperCase()));
                }
            }
        }
        return null;
    }

    /**
     * 账户是否过期，过期无法验证
     *
     * @return
     */
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    /**
     * 指定用户是否被锁定或者解锁，锁定的用户无法进行身份验证
     *
     * @return
     */
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    /**
     * 指示是否已过期的用户的凭据(密码)，过期的凭据防止认证
     * 帐户密码是否过期，一般有的密码要求性高的系统会使用到，比较每隔一段时间就要求用户重置密码
     *
     * @return
     */
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    /**
     * 是否被禁用，禁用的用户不能身份验证
     *
     * @return
     */
    @Override
    public boolean isEnabled() {
        return true;
    }

    public List<SysRole> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<SysRole> roleList) {
        this.roleList = roleList;
    }
}
