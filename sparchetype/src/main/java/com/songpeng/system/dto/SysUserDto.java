package com.songpeng.system.dto;

import com.songpeng.system.domain.SysRole;
import com.songpeng.system.domain.SysUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

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

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
//        List<RoleGrantedAuthority> authorityList = new ArrayList<>();
//        authorityList.add(new RoleGrantedAuthority("ROLE_USER"));
//
//        // 加入角色权限
//        if (roleList != null && !roleList.isEmpty()) {
//            for (SysRole role : roleList) {
//                if (StringUtils.isNotBlank(role.getCode())) {
//                    authorityList.add(new RoleGrantedAuthority("ROLE_" + role.getCode().toUpperCase()));
//                }
//            }
//        }
//        return authorityList;
        return null;
    }

    /**
     * 账户是否过期，过期无法验证
     * @return
     */
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    /**
     * 指定用户是否被锁定或者解锁，锁定的用户无法进行身份验证
     * @return
     */
    @Override
    public boolean isAccountNonLocked() {
        return false;
    }

    /**
     * 指示是否已过期的用户的凭据(密码)，过期的凭据防止认证
     * @return
     */
    @Override
    public boolean isCredentialsNonExpired() {
        return false;
    }

    /**
     * 是否被禁用，禁用的用户不能身份验证
     * @return
     */
    @Override
    public boolean isEnabled() {
        return false;
    }
}
