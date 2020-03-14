/**
 * 组件：扩展layui数据表格
 */
layui.define(['table'], function (exports) {
    var $ = layui.jquery,
        table = layui.table;

    var spTable = {
        // 渲染表格
        render: function (param) {
            var defaultConfig = {
                elem: '#js-record-table',
                toolbar: '#js-record-table-toolbar-top',
                method: 'POST',
                limits: [10, 20, 50, 100],
                limit: 10,
                page: true,
                height: 'full-' + ($('#js-search-form').height() + 40),
                request: {
                    pageName: 'current'
                    , limitName: 'size'
                },
                parseData: function (res) {
                    return {
                        "code": res.code,
                        "msg": res.msg,
                        "count": res.data ? res.data.total : 0,
                        "data": res.data ? res.data.records : []
                    };
                }
            };

            var config = $.extend({}, defaultConfig, param, {
            });

            return table.render(config);
        }
    };

    exports('spTable', spTable);
});
