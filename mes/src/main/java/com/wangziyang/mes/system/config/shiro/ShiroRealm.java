package com.wangziyang.mes.system.config.shiro;

import com.wangziyang.mes.system.dto.SysMenuDTO;
import com.wangziyang.mes.system.dto.SysRoleDTO;
import com.wangziyang.mes.system.dto.SysUserDTO;
import com.wangziyang.mes.system.enums.SysUserEnum;
import com.wangziyang.mes.system.service.ISysUserService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Shiro 安全管理器领域模型
 * <p>
 * 如下可以使用 @Autowired，是因为 ShiroRealm 在 ShiroConfig 中已经配置
 *
 * @author SongPeng
 * @date 2019/10/17 8:08
 */
public class ShiroRealm extends AuthorizingRealm {

	Logger logger = LoggerFactory.getLogger(ShiroRealm.class);

    @Autowired
    private ISysUserService sysUserService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SysUserDTO user = (SysUserDTO) principalCollection.getPrimaryPrincipal();
        Set<String> perms = new HashSet<>();
        if (CollectionUtils.isNotEmpty(user.getSysRoleDTOs())) {
            for (SysRoleDTO sr : user.getSysRoleDTOs()) {
                if (CollectionUtils.isEmpty(sr.getSysMenuDtos())) {
                    continue;
                }
                for (SysMenuDTO sm : sr.getSysMenuDtos()) {
                    if (StringUtils.isNotEmpty(sm.getPermission())) {
                        perms.addAll(Arrays.asList(sm.getPermission().trim().split(",")));
                    }
                }
            }
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(perms);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String) authenticationToken.getPrincipal();
        SysUserDTO user = null;
        try {
            user = sysUserService.getUserAndRoleAndMenuByUsername(username);
        } catch (Exception e) {
            logger.error("账号数据查询异常,请联系管理员", e);
            throw new UnknownAccountException("账号数据查询异常,请联系管理员");
        }

        // 账号不存在
        if (null == user) {
            logger.error("账号不存在");
            throw new UnknownAccountException("账号不存在");
        }

        // 账号锁定
        if (!user.getDeleted().equals(SysUserEnum.DELETED_NORMAL.getCode())) {
            logger.error("账号已被锁定,请联系管理员");
            throw new LockedAccountException("账号已被锁定,请联系管理员");
        }
        // TODO 根据用户名（唯一不可变）作为密码加盐，当然也可以自定义加盐方式，如增加数据库字段等
        ByteSource byteSource = ByteSource.Util.bytes(username);
        return new SimpleAuthenticationInfo(user, user.getPassword(), byteSource, getName());
    }
}
