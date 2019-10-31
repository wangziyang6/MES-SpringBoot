<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>系统用户列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">用户姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">用户性别</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sex" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">用户城市</label>
                    <div class="layui-input-inline">
                        <input type="text" name="city" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">用户职业</label>
                    <div class="layui-input-inline">
                        <input type="text" name="classify" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn" lay-submit="" lay-filter="data-search-btn">搜索</a>
                </div>
            </div>
        </form>
        <table class="layui-hide" id="record-table" lay-filter="table-filter"></table>
    </div>
</div>
<script type="text/html" id="toolbar-top">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="getCheckData"><i class="layui-icon">&#xe640;</i>批量删除</button>
    <@shiro.hasPermission name="user:add">
        <button class="layui-btn layui-btn-sm" onclick="WeAdminShow('添加用户','${request.contextPath}/admin/sys/user/add-or-upd-ui',600,400)">
            <i class="layui-icon">&#xe61f;</i>添加
        </button>
    </@shiro.hasPermission>
  </div>
</script>

<script type="text/html" id="operateTpl">
    <a title="编辑" onclick="WeAdminEdit('编辑','${request.contextPath}/admin/sys/user/add-or-upd-ui', '{{ d.id }}', 600, 400)" href="javascript:;">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="查看" onclick="WeAdminShow('查看用户','./show.html',600,400)" href="javascript:;">
        <i class="layui-icon">&#xe63c;</i>
    </a>
    <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        var tableIns = table.render({
            elem: '#record-table',
            cellMinWidth: 80,
            height:'full-80',
            toolbar: '#toolbar-top',
            method: 'POST',
            limits: [10, 20, 50, 100],
            limit: 10,
            page: true,
            url: '${request.contextPath}/admin/sys/user/page',
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
                    field: 'name', title: '姓名', width: 120
                }, {
                    field: 'username', title: '用户名', width: 130
                }, {
                    field: 'password', title: '密码', width: 90
                }, {
                    field: 'deptId', title: '部门id', width: 90
                }, {
                    field: 'email', title: '邮箱', width: 90
                }, {
                    field: 'mobile', title: '手机号', width: 120
                }, {
                    field: 'tel', title: '固定电话', width: 120
                }, {
                    field: 'sex', title: '性别', width: 60
                }, {
                    field: 'birthday', title: '出生年月日', width: 120
                }, {
                    field: 'picId', title: '图片id', width: 90
                }, {
                    field: 'idCard', title: '身份证', width: 120
                }, {
                    field: 'hobby', title: '爱好', width: 90
                }, {
                    field: 'province', title: '省份', width: 90
                }, {
                    field: 'city', title: '城市', width: 90
                }, {
                    field: 'district', title: '区县', width: 90
                }, {
                    field: 'street', title: '街道', width: 90
                }, {
                    field: 'streetNumber', title: '门牌号', width: 90
                }, {
                    field: 'descr', title: '描述', width: 90
                }, {
                    field: 'status', title: '状态', width: 90
                }, {
                    fixed: 'right', field: 'operate',title: '操作', toolbar: '#operateTpl', unresize: true, width: 90
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
    });
</script>
</body>
</html>