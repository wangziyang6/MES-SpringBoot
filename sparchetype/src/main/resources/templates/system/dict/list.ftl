<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>系统字典列表</title>
    <meta name="Description" content="基于layUI数据表格操作"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
    <div class="weadmin-body">
        <div class="layui-row">
            <form class="layui-form layui-col-md12 we-search" lay-filter="search-form-filter">
                <div class="layui-input-inline">
                    <select name="cateid">
                        <option>请选择分类</option>
                        <option>文章</option>
                        <option>会员</option>
                        <option>权限</option>
                    </select>
                </div>
                <div class="layui-inline">
                    <input class="layui-input" placeholder="开始日" name="start" id="start">
                </div>
                <div class="layui-inline">
                    <input class="layui-input" placeholder="截止日" name="end" id="end">
                </div>
                <div class="layui-inline">
                    <input type="text" name="keyword" placeholder="请输入关键字" autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn" lay-submit lay-filter="search-form-btn-filter"><i class="layui-icon">&#xe615;</i></button>
            </form>
        </div>
        <!--数据表格-->
        <table class="layui-hide" id="record-table" lay-filter="table-filter"></table>
    </div>
</body>
<script type="text/html" id="toolbar-top">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="getCheckData"><i class="layui-icon">&#xe640;</i>批量删除</button>
    <@shiro.hasPermission name="nemu:add">
        <button class="layui-btn layui-btn-sm" onclick="WeAdminShow('添加字典','${request.contextPath}/admin/sys/dict/add-or-upd-ui',600,400)">
            <i class="layui-icon">&#xe61f;</i>添加
        </button>
    </@shiro.hasPermission>
  </div>
</script>

<script type="text/html" id="operateTpl">
    <a title="编辑" onclick="WeAdminEdit('编辑','${request.contextPath}/admin/sys/dict/add-or-upd-ui', '{{ d.id }}', 600, 400)" href="javascript:;">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="查看" onclick="WeAdminShow('查看字典','./show.html',600,400)" href="javascript:;">
        <i class="layui-icon">&#xe63c;</i>
    </a>
    <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>
<script type="text/javascript">
    layui.extend({
        admin: '${request.contextPath}/js/admin'
    });

    layui.use(['table', 'jquery','form', 'admin', 'laydate'], function() {
        var table = layui.table,
            $ = layui.jquery,
            form = layui.form,
            admin = layui.admin,
            laydate = layui.laydate;

        laydate.render({
            elem: '#start'
        });
        laydate.render({
            elem: '#end'
        });

        var tableIns = table.render({
            elem: '#record-table',
            cellMinWidth: 80,
            toolbar: '#toolbar-top',
            method: 'POST',
            event: true,
            page: true,
            url: '${request.contextPath}/admin/sys/dict/page',
            request: {
              pageName: 'current' //页码的参数名称，默认：page
              ,limitName: 'size' //每页数据量的参数名，默认：limit
            },
            parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.data ? res.data.total : 0, //解析数据长度
                    "data": res.data ? res.data.records : [] //解析数据列表
                };
            },
            cols: [
                [{
                    type: 'checkbox'
                }, {
                    field: 'name', title: '标签名'
                }, {
                    field: 'value',title: '标签值'
                }, {
                    field: 'type',title: '类别'
                }, {
                    field: 'descr',title: '描述'
                }, {
                    field: 'status',title: '状态'
                }, {
                    field: 'operate',title: '操作', toolbar: '#operateTpl', unresize: true
                }]
            ],
            done: function(res, curr, count){
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
            }
        });

        /*
         * 数据表格中form表单元素是动态插入,所以需要更新渲染下
         * http://www.layui.com/doc/modules/form.html#render
         */
        $(function(){
            form.render();
        });

        form.on('submit(search-form-btn-filter)', function(data){
            tableIns.reload({
                // 设定异步数据接口的额外参数，任意设
                where: data.field,
                page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            // 阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });

        //头工具栏事件
        table.on('toolbar(table-filter)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var checkStatus = table.checkStatus('record-table'),
                        data = checkStatus.data;
                    if(data.length > 0) {
                        layer.confirm('确认要删除吗？' + JSON.stringify(data), function(index) {
                            layer.msg('删除成功', {
                                icon: 1
                            });
                            //找到所有被选中的，发异步进行删除
                            $(".layui-table-body .layui-form-checked").parents('tr').remove();
                        });
                    } else {
                        layer.msg("请先选择需要删除的文章！");
                    }
                    break;
                case 'recommend':
                    var checkStatus = table.checkStatus('record-table'),
                        data = checkStatus.data;
                    if(data.length > 0) {
                        layer.msg("您点击了推荐操作");
                        for(var i = 0; i < data.length; i++) {
                            data[i].recommend = "checked";
                            form.render();
                        }

                    } else {
                        layer.msg("请先选择");
                    }
                    break;
                case 'top':
                    layer.msg("您点击了置顶操作");
                    break;
                case 'review':
                    layer.msg("您点击了审核操作");
                    break;
            };
        });

        /*用户-删除*/
        window.member_del = function(obj, id) {
            layer.confirm('确认要删除吗？', function(index) {
                //发异步删除数据
                $(obj).parents("tr").remove();
                layer.msg('已删除!', {
                    icon: 1,
                    time: 1000
                });
            });
        }
    });

    function delAll(argument) {
        var data = tableCheck.getData();
        layer.confirm('确认要删除吗？' + data, function(index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {
                icon: 1
            });
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</html>