### 前端 Ajax 工具类使用说明

封装 Jquery Ajax 请求方法，并对 session 失效进行检测，通过整合 Shiro，利用拦截器解决 Ajax 302 无法跳转登录页问题。

```
// spUtil.ajax()
spUtil.ajax({
    url: '${request.contextPath}/admin/sys/user/page',
    async: false,
    type: 'POST',
    // 是否显示 loading
    showLoading: true,
    // 是否序列化参数
    serializable: false,
    // 参数
    data: {
        current: 1,
        size: 10
    },
    success: function (data) {
        console.log(data);
    }
});
```

