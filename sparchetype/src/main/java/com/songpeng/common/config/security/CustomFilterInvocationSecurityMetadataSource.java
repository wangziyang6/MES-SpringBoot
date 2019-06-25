package com.songpeng.common.config.security;

import com.songpeng.common.utils.StringUtil;
import com.songpeng.system.domain.SysMenu;
import com.songpeng.system.domain.SysRole;
import com.songpeng.system.service.SysMenuService;
import com.songpeng.system.service.SysRoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.PropertySource;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.CollectionUtils;
import org.springframework.util.PathMatcher;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * 权限资源: 获取请求url需要的权限
 * 主要责任就是当访问一个url时返回这个url所需要的访问权限
 *
 * @author SongPeng
 * @date 2019/6/21
 */
@Component
public class CustomFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    private static final Logger LOGGER = LoggerFactory.getLogger(CustomFilterInvocationSecurityMetadataSource.class);

    @Value("${security.ignoring}")
    private String securityIgnoring;

    @Value("${security.intercept}")
    private String securityIntercept;

    @Autowired
    private SysMenuService sysMenuService;

    @Autowired
    private SysRoleService sysRoleService;

    private PathMatcher matcher = new AntPathMatcher();

    private String indexUrl = "/index.html";

    /**
     * 方法返回本次访问需要的权限，可以有多个权限。
     * 在上面的实现中如果没有匹配的url直接返回null，
     * 也就是没有配置权限的url默认都为白名单，想要换成默认是黑名单只要修改这里即可
     *
     * @param object
     * @return
     * @throws IllegalArgumentException
     */
    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        //获取当前访问url
        String url = ((FilterInvocation) object).getRequestUrl();
        LOGGER.info("获取当前访问url = {}", url);
        int firstQuestionMarkIndex = url.indexOf("?");
        if (firstQuestionMarkIndex != -1) {
            url = url.substring(0, firstQuestionMarkIndex);
        }
        List<ConfigAttribute> result = new ArrayList<>();

        try {
            //设置不拦截
            if (StringUtil.isNotBlank(securityIgnoring)) {
                String[] paths = securityIgnoring.split(",");
                //判断是否符合规则
                for (String path : paths) {
                    String temp = StringUtil.clearSpace(path);
                    if (matcher.match(temp, url)) {
                        ConfigAttribute attribute = new SecurityConfig("ROLE_ANONYMOUS");
                        result.add(attribute);
                        return result;
                    }
                }
            }

            //如果不是拦截列表里的
            if (!isIntercept(url)) {
                ConfigAttribute attribute = new SecurityConfig("ROLE_ANONYMOUS");
                result.add(attribute);
                return result;
            }

            //查询匹配的url
            List<SysMenu> menuList = sysMenuService.getMenusByUrl(url);
            if (!CollectionUtils.isEmpty(menuList)) {
                for (SysMenu menu : menuList) {
                    //查询拥有该菜单权限的角色列表
                    List<SysRole> roles = sysRoleService.getRolesByMenuId(menu.getId());
                    if (!CollectionUtils.isEmpty(roles)) {
                        for (SysRole role : roles) {
//                            ConfigAttribute conf = new SecurityConfig(role.getCode());
                            ConfigAttribute conf = new SecurityConfig("ROLE_" + role.getCode().toUpperCase());
                            result.add(conf);
                        }
                    }
                }
            }
        } catch (Exception e) {
            LOGGER.error("获取本次访问需要的权限异常", e);
        }
        return result;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }

    /**
     * 判断是否需要过滤
     *
     * @param url
     * @return
     */
    public boolean isIntercept(String url) {
        if (StringUtil.isNotBlank(securityIntercept)) {
            String[] filterPaths = securityIntercept.split(",");
            for (String filter : filterPaths) {
                if (matcher.match(StringUtil.clearSpace(filter), url) & !matcher.match(indexUrl, url)) {
                    return true;
                }
            }
        }

        return false;
    }

    public String getIndexUrl() {
        return indexUrl;
    }

    public void setIndexUrl(String indexUrl) {
        this.indexUrl = indexUrl;
    }
}
