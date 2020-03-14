### 前端 spLayer 组件使用手册

在 Layui layer 基础上进行封装的自定义组件，结合框架规范，简化使用

#### 使用场景

spLayer 主要使用场景是在页面中打开 iframe 窗口，其余场景可以使用 layer 官方提供方式即可，封装 iframe 的原因是配置过多，而其余不封装的原因是官方使用方式足够精简，不做过渡封装，如遇到特殊需求，考虑对spLayer再次扩展。

#### 基础参数

* `type: 2` iframe层
* `fixed: false` 不固定，可移动窗口
* `maxmin: true` 开启最大最小化
* `btn: ['确定', '取消']` 默认弹出窗口右下角是确定取消按钮
    * 确定按钮点击后的回调函数做了个性化处理
        1. 提交弹出窗口中的 `#js-submit` 按钮所在表单
        2. `spCallback` 执行回调函数，回调函数的参数是弹出窗口中表单提交或者搜索面板选中数据的返回结果
        3. 默认关闭弹出窗口操作
        4. 默认重载父页面 `indow.location.reload();`
        5. 其他配置参考 layer 官方文档
* `spCallback: function(result) {}` 回调函数，result 是弹出窗口中表单提交或者搜索面板选中数据的返回结果，使用此回调函数的目的是获取到子页面数据后，需要操作当前页面的逻辑，比如如下场景：
    1. `reload: false` 设置参数 reload 为 false，此时点击弹出窗口确定按钮后，当前页面不会重载，比如当你需要根据弹出窗口中的数据结果，进行当前页面局部刷新时，就可以采用此方式
    2. `resources/templates/common/spSearchPanel4SysUser.ftl` 文件是示例，使用场景是，当下拉框数据过多，需要弹窗进行分页数据展示，并且带有查询功能，选中数据后，进行页面赋值，那么此时弹出窗口确定按钮点击后，回调函数中会接收到选中数据
* spSearchPanel4SysUser 使用方法
    1. 编写弹窗页面：复制`resources/templates/common/spSearchPanel4SysUser.ftl`文件到当前文件夹
    2. 在需要打开此弹窗的页面编写如下代码接口，注意更改属性 content 中的路径，将路径中的 spSearchPanel4SysUser 替换为自定义的文件名即可
    
```
// 测试搜索弹框
var index = spLayer.open({
    area: ['680px', '500px'],
    reload: false,
    content: '${request.contextPath}/admin/common/ui/spSearchPanel4SysUser',
    spCallback: function (result) {
        console.log(result);
        // 个性化操作，如：页面赋值
    }
});
```