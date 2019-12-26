/**
 * date:2019/12/24
 * author:SongPeng
 * description:扩展layui数据表格 框架扩展
 */
layui.define(['table'], function (exports) {
    var $ = layui.jquery;
    var table = layui.table;

    var sptable = {
        // 渲染表格
        render: function (param) {
            var config = {};
            $.extend(config, param, {
                elem: '#record-table',
                toolbar: '#toolbar-top',
                method: 'POST',
                limits: [10, 20, 50, 100],
                limit: 10,
                request: {
                    pageName: 'current' //页码的参数名称，默认：page
                    , limitName: 'size' //每页数据量的参数名，默认：limit
                },
                parseData: function (res) { //res 即为原始返回的数据
                    return {
                        "code": res.code || 1, //解析接口状态
                        "msg": res.msg || '系统错误，请联系管理员', //解析提示文本
                        "count": res.data ? res.data.total : 0, //解析数据长度
                        "data": res.data ? res.data.records : [] //解析数据列表
                    };
                }
            });

            return table.render(config);
        }
    };

    exports('sptable', sptable);
});
