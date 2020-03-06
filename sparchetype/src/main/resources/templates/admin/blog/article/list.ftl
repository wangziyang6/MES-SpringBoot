<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>文章列表</title>
    <meta name="Description" content="基于layUI数据表格操作"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>

<body>
    <div class="weadmin-nav">
        <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">文章管理</a>
            <a><cite>文章列表</cite></a>
        </span>
        <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon" style="line-height:30px">&#xe669;</i>
        </a>
    </div>
    <div class="">
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
        <table class="layui-hide" id="articleList" lay-filter="table-filter"></table>
    </div>
<script type="text/html" id="toolbar-top">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="getCheckData"><i class="layui-icon">&#xe640;</i>批量删除</button>
    <button class="layui-btn layui-btn-sm" lay-event="recommend"><i class="layui-icon">&#xe6c6;</i>推荐</button>
    <button class="layui-btn layui-btn-sm" lay-event="top"><i class="layui-icon">&#xe619;</i>置顶</button>
    <button class="layui-btn layui-btn-sm" lay-event="review"><i class="layui-icon">&#xe6b2;</i>审核</button>
    <button class="layui-btn layui-btn-sm" onclick="WeAdminShow('添加用户','./add.html',600,400)"><i class="layui-icon">&#xe61f;</i>添加</button>
  </div>
</script>
<script type="text/html" id="recommendTpl">
    <input type="checkbox" name="zzz" lay-skin="switch" lay-text="已推荐|未推荐" {{d.recommend}}>
</script>
<script type="text/html" id="topTpl">
    <input type="checkbox" name="show" lay-skin="switch" lay-text="已置顶|未置顶" {{d.top}}>
</script>
<script type="text/html" id="reviewTpl">
  <!-- 这里的 checked 的状态只是演示 -->
  <input type="checkbox" name="lock" value="{{d.id}}" title="锁定" lay-filter="lockDemo" {{ d.id == 1 ? 'checked' : '' }}>
</script>

<script type="text/html" id="operateTpl">
    <a title="编辑" onclick="WeAdminEdit('编辑','./edit.html', 2, 600, 400)" href="javascript:;">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="查看" onclick="WeAdminShow('查看文章','./show.html',600,400)" href="javascript:;">
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
            elem: '#articleList',
            cellMinWidth: 80,
            toolbar: '#toolbar-top',
            cols: [
                [{
                    type: 'checkbox'
                }, {
                    field: 'id',title: 'ID',sort: true
                }, {
                    field: 'title',title: '标题',templet: '#usernameTpl'
                }, {
                    field: 'date',title: '发布时间',sort: true
                }, {
                    field: 'category',title: '分类',sort: true
                }, {
                    field: 'sort',title: '排序',sort: true
                }, {
                    field: 'recommend',title: '推荐',templet: '#recommendTpl',unresize: true
                }, {
                    field: 'top',title: '置顶',templet: '#topTpl',unresize: true
                }, {
                    field: 'review',title: '审核',templet: '#reviewTpl',unresize: true
                }, {
                    field: 'operate',title: '操作',toolbar: '#operateTpl',unresize: true
                }]
            ],
            data: [{
                "id": "1",
                "title": "WeAdmin的第一个版本在不断地抽空完善学习中",
                "date": "2018-02-03",
                "category": "官方动态",
                "sort": "1",
                "recommend": "checked",
                "top": "checked"
            }, {
                "id": "2",
                "title": "WeAdmin的测试数据一二三四五六七",
                "date": "2018-02-03",
                "category": "新闻资讯",
                "sort": "1",
                "recommend": "",
                "top": "checked"
            }],
            event: true,
            page: true
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
                    var checkStatus = table.checkStatus('articleList'),
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
                    var checkStatus = table.checkStatus('articleList'),
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
</body>
</html>