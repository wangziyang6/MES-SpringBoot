<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>系统菜单列表</title>
    <meta name="Description" content="基于layUI数据表格操作"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
    <style>
        .layui-btn:not(.layui-btn-lg ):not(.layui-btn-sm):not(.layui-btn-xs) {
            height: 34px;
            line-height: 34px;
            padding: 0 8px;
        }
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div>
            <div class="layui-btn-group">
                <button class="layui-btn" id="btn-expand">全部展开</button>
                <button class="layui-btn" id="btn-fold">全部折叠</button>
            </div>
            <table id="munu-table" class="layui-table" lay-filter="munu-table"></table>
        </div>
    </div>
</div>
<!-- 表格操作列 -->
<script type="text/html" id="demoTreeTableBar1">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<!-- 表格状态列 -->
<script type="text/html" id="demoTreeTableState1">
    <input type="checkbox" lay-filter="ckState" value="{{d.id}}" lay-skin="switch"
           lay-text="正常|锁定" {{d.state==0?'checked':''}}/>
</script>
<script>
    layui.use(['table', 'treeTable'], function () {
        var table = layui.table,
            treeTable = layui.treeTable;

        // 渲染表格
        var insTb = treeTable.render({
            elem: '#munu-table',
            tree: {
                iconIndex: 1
            },
            cols: [
                {type: 'numbers'},
                {field: 'id', title: 'ID'},
                {field: 'name', title: 'name', width: 160, edit: 'text'},
                {field: 'createTime', title: '创建时间', width: 180, edit: 'text'},
                {templet: '#demoTreeTableState1', title: '状态', width: 100},
                {align: 'center', toolbar: '#demoTreeTableBar1', title: '操作', width: 120}
            ],
            reqData: function (data, callback) {
                $.get('${request.contextPath}/admin/sys/menu/tree', function (res) {
                    console.log(res.data.data)
                    callback(res.data.data);
                });
            },
            style: 'margin-top:0;'
        });

        treeTable.on('edit(demoTreeTable1)', function (obj) {
            console.log(obj);
            if (true) {
                layer.tips('格式不正确', $(this), {tips: [1, '#FF5722']});
                return false;
            }
        });
    });
</script>
</body>
</html>