```
<!--搜索框-->
<div class="row">
<th:block sec:authorize="hasAuthority('sys:user:query')">
    <div class="col-lg-12">
        <div class="form-inline" id="query">
            <div class="form-group">
                <label class="control-label">表名：</label>
                <input type="text" placeholder="请输入表名" name="name"
                       class="form-control iform-control">
            </div>
            <div class="form-group">
                <label class="control-label">表说明：</label>
                <input type="text" placeholder="请输入表说明" name="username"
                       class="form-control iform-control">
            </div>
            <div class="form-group">
                <label class="control-label">父表名：</label>
                <input type="text" placeholder="请输入父表名" name="username"
                       class="form-control iform-control">
            </div>
        </div>
    </div>
</th:block>
```

1. 登录状态失效？
2. 登录用户如何控制访问权限？比如直接访问路径
3. 

本文细分角色和权限，并将用户、角色、权限和资源均采用数据库存储，并且自定义滤器，代替原有的FilterSecurityInterceptor过滤器， 
并分别实现AccessDecisionManager、InvocationSecurityMetadataSourceService和UserDetailsService，并在配置文件中进行相应配置。

spring security的简单原理：
使用众多的拦截器对url拦截，以此来管理权限。但是这么多拦截器，笔者不可能对其一一来讲，主要讲里面核心流程的两个。

首先，权限管理离不开登陆验证的，所以登陆验证拦截器AuthenticationProcessingFilter要讲； 
还有就是对访问的资源管理吧，所以资源管理拦截器AbstractSecurityInterceptor要讲；

但拦截器里面的实现需要一些组件来实现，所以就有了AuthenticationManager、accessDecisionManager等组件来支撑。

现在先大概过一遍整个流程，用户登陆，会被AuthenticationProcessingFilter拦截，调用AuthenticationManager的实现，而且AuthenticationManager会调用ProviderManager来获取用户验证信息（不同的Provider调用的服务不同，因为这些信息可以是在数据库上，可以是在LDAP服务器上，可以是xml配置文件上等），如果验证通过后会将用户的权限信息封装一个User放到spring的全局缓存SecurityContextHolder中，以备后面访问资源时使用。 
访问资源（即授权管理），访问url时，会通过AbstractSecurityInterceptor拦截器拦截，其中会调用FilterInvocationSecurityMetadataSource的方法来获取被拦截url所需的全部权限，在调用授权管理器AccessDecisionManager，这个授权管理器会通过spring的全局缓存SecurityContextHolder获取用户的权限信息，还会获取被拦截的url和被拦截url所需的全部权限，然后根据所配的策略（有：一票决定，一票否定，少数服从多数等），如果权限足够，则返回，权限不够则报错并调用权限不足页面。


### 参考

* https://blog.csdn.net/u012373815/article/details/54633046