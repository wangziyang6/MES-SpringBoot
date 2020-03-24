<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>黑科开源-MES系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <#include "${request.contextPath}/common/common.ftl">
    <link rel="stylesheet" href="${request.contextPath}/css/splayui.css" media="all">
    <style id="splayui-bg-color">
    </style>
</head>
<body class="layui-layout-body splayui-all">
<div class="layui-layout layui-layout-admin">

    <div class="layui-header header">
        <div class="layui-logo">
        </div>
        <a>
            <div class="splayui-tool"><i title="展开" class="fa fa-outdent" data-side-fold="1"></i></div>
        </a>

        <ul class="layui-nav layui-layout-left layui-header-menu layui-header-pc-menu mobile layui-hide-xs">
        </ul>
        <ul class="layui-nav layui-layout-left layui-header-menu mobile layui-hide-sm">
            <li class="layui-nav-item">
                <a href="javascript:;"><i class="fa fa-list-ul"></i> 选择模块</a>
                <dl class="layui-nav-child layui-header-menu">
                </dl>
            </li>
        </ul>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" data-refresh="刷新"><i class="fa fa-refresh"></i></a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;" data-clear="清理" class="splayui-clear"><i class="fa fa-trash-o"></i></a>
            </li>
            <li class="layui-nav-item splayui-setting">
                <a href="javascript:;">admin</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-iframe-tab="page/user-setting.html" data-title="基本资料"
                           data-icon="fa fa-gears">基本资料</a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-iframe-tab="page/user-password.html" data-title="修改密码"
                           data-icon="fa fa-gears">修改密码</a>
                    </dd>
                    <dd>
                        <a class="login-out" href="${request.contextPath}/login-ui">退出登录</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item splayui-select-bgcolor mobile layui-hide-xs">
                <a href="javascript:;" data-bgcolor="配色方案"><i class="fa fa-ellipsis-v"></i></a>
            </li>
        </ul>
    </div>
    <form class="layui-form" style=" display: flex; flex-direction: column;">
        <div class="layui-side layui-bg-black">
            <div layui-left-menu style="height: 33px;">
                <input name="search" type="text" placeholder="搜索..." class="layui-input layui-input-search"
                       autocomplete="off">
            </div>
            <div class="layui-side-scroll layui-left-menu">
            </div>
            <button class="layui-btn layui-hide" lay-submit lay-filter="js-search-filter">搜索</button>
        </div>
    </form>

    <div class="layui-body">
        <div class="layui-tab" lay-filter="splayuiTab" id="top_tabs_box">
            <ul class="layui-tab-title" id="top_tabs">
                <li class="layui-this" id="splayuiHomeTabId" lay-id=""></li>
            </ul>
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:;"> <i class="fa fa-dot-circle-o"></i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-page-close="other"><i class="fa fa-window-close"></i> 关闭其他</a>
                        </dd>
                        <dd><a href="javascript:;" data-page-close="all"><i class="fa fa-window-close-o"></i> 关闭全部</a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div id="splayuiHomeTabIframe" class="layui-tab-item layui-show">
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['element', 'layer', 'spLayui', 'form'], function () {
        var element = layui.element,
            layer = layui.layer,
            spLayui = layui.spLayui,
            form = layui.form;

        spLayui.init('${request.contextPath}/admin/list/index/menu/tree');

        form.on('submit(js-search-filter)', function (data) {
            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            // 阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });
    });
</script>
</body>
</html>