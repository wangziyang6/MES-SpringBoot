### 前端 spTable 组件使用手册

在 Layui table 基础上进行封装的自定义组件，结合框架规范，简化使用

#### 使用场景


#### 基础参数

* `elem: '#js-record-table'`
* `toolbar: '#js-record-table-toolbar-top'`
* `method: 'POST'`
* `limits: [10, 20, 50, 100]`
* `limit: 10`
* `page: true`
* `height: 'full-' + ($('#js-search-form').height() + 40)`
* `request: {pageName: 'current', limitName: 'size'}`
* `parseData: function (res) {return { "code": res.code, "msg": res.msg, "count": res.data ? res.data.total : 0, "data": res.data ? res.data.records : []};}`
* 其他参数默认配置，请参考官方文档

说明：如上配置参数，在使用时如果自己填写，那么将覆盖如上默认配置