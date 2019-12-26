/**
 * date: 2019/12/24
 * author: SongPeng
 * description: 扩展layui数据表格 框架扩展
 */
layui.define(['table'], function (exports) {
    var $ = layui.jquery,
        table = layui.table;

    var sptable = {
        // 渲染表格
        render: function (param) {
            var defaultConfig = {
                elem: '#record-table',
                toolbar: '#toolbar-top',
                method: 'POST',
                limits: [10, 20, 50, 100],
                limit: 10,
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

    exports('sptable', sptable);
});
