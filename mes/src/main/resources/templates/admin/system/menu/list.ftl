<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>系统菜单列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <div>
            <div class="layui-btn-group">
                <button class="layui-btn" id="js-expand-fold-all">全部展开/折叠</button>
                <button class="layui-btn" id="testtt">testtt</button>
            </div>
            <table id="js-record-table" class="layui-table" lay-filter="js-record-table-filter"></table>
        </div>
    </div>
</div>
<!-- 表格操作列 -->
<script type="text/html" id="js-record-table-bar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="add">添加</a>
</script>

<!-- 表格状态列 -->
<script type="text/html" id="js-record-table-state">
    <input type="checkbox" lay-filter="ckState" value="{{d.id}}" lay-skin="switch"
           lay-text="正常|锁定" {{d.state==0?'checked':''}}/>
</script>
<script>
    layui.use(['table', 'treeTable', 'spLayer'], function () {
        var table = layui.table,
            treeTable = layui.treeTable,
            spLayer = layui.spLayer;

        // 渲染表格
        var insTb = treeTable.render({
            elem: '#js-record-table',
            tree: {
                iconIndex: 1,
                idName: 'id',  // 自定义id字段的名称
                isPidData: true  // 是否是pid形式数据
            },
            cols: [
                {type: 'numbers'},
                {field: 'name', title: '名称', width: 160},
                {
                    field: 'type', title: '类型', width: 160, templet: function (d) {
                        return d.icon ? {'0': '目录', '1': '菜单', '2': '按钮'}[d.type] : '';
                    }
                },
                {
                    field: 'icon', title: '图标', width: 160, templet: function (d) {
                        return d.icon ? '<i class="' + d.icon + ' fa-lg"></i>' : '';
                    }
                },
                {field: 'url', title: '地址', width: 180},
                {field: 'permission', title: '权限标识', width: 180},
                {templet: '#js-record-table-state', title: '状态', width: 100},
                {align: 'center', toolbar: '#js-record-table-bar', title: '操作', width: 150}
            ],
            reqData: function (data, callback) {
                $.ajax({
                    type: "GET",
                    url: "${request.contextPath}/admin/sys/menu/tree",
                    async: true,
                    success: function (result) {
                        if (result.code === 0) {
                            callback(result.data);
                        } else {
                            layer.alert(result.msg, {
                                icon: 2
                            })
                        }
                    },
                    error: function (e) {
                        layer.alert(e, {
                            icon: 2
                        })
                    }
                });
            },
            style: 'margin-top:0;'
        });

        /**
         * 监听
         */
        treeTable.on('tool(js-record-table)', function (obj) {
            var event = obj.event;

            if (event == 'del') {
                layer.msg('点击了删除', {icon: 1});
            }

            if (event == 'edit') {
                spLayer.open({
                    title: '编辑',
                    area: ['800px', '500px'],
                    // 请求url参数
                    spWhere: {id: obj.data.id},
                    content: '${request.contextPath}/admin/sys/menu/add-or-update-ui'
                });
            }

            if (event == 'add') {
                spLayer.open({
                    title: '新增',
                    area: ['800px', '500px'],
                    // 请求url参数
                    spWhere: {},
                    content: '${request.contextPath}/admin/sys/menu/add-or-update-ui'
                });
            }
        });

        // 全部展开、折叠标记
        var expandFoldFlag = true;
        /**
         * 全部展开、折叠
         */
        $('#js-expand-fold-all').click(function () {
            if (expandFoldFlag) {
                insTb.expandAll();
                expandFoldFlag = false;
            } else {
                insTb.foldAll();
                expandFoldFlag = true;
            }
        });
    });
</script>
</body>
</html>