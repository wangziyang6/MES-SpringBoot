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
                <button type="button"  class="fa fa-github-alt " onclick="notice()"  data-method="setTop" >B站视频</button>
            </li>
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
        <div class="layui-side layui-bg-black" style="display: flex; flex-direction: column;">
            <div style="height: 94% ; display: flex;">
                <div class="layui-side-scroll layui-left-menu">
                </div>
            </div>

            <div layui-left-menu style="display: flex; height: 6% ;margin-right: 4px;">
                <i class="layui-icon layui-icon-search" style=" width: 30px;margin-top: 5px;font-size:24px ;"></i>
                <input name="search" type="text" placeholder="搜索..." class="layui-input layui-input-search"
                       autocomplete="off">
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
        /**
         * 搜索后重新绘制菜单
         */
        form.on('submit(js-search-filter)', function (data) {

            if (data.field.search) {
                var urlPath = '${request.contextPath}/admin/list/index/menu/search/tree/' + data.field.search;
                itemNav =true;
            } else {
                var urlPath = '${request.contextPath}/admin/list/index/menu/tree';
                itemNav =false;
            }
            spUtil.ajax({
                url: urlPath,
                async: false,
                type: 'GET',
                // 是否显示 loading
                // showLoading: true,
                // 是否序列化参数
                serializable: false,
                // 参数
                data: {},
                success: function (data) {
                    spLayui.initMenu(data.data.menuInfo,itemNav);
                }
            });
            return false;
        });
    });
    //视频弹框
    function  notice(){
        layer.open({
            type: 1
            ,title: false //不显示标题栏
            ,closeBtn: true
            ,area: ['40%', '45%']
            ,move: '.mine-move'
            ,shade: 0.8
            ,scrollbar: false
            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,btnAlign: 'c'
            ,moveType: 1 //拖拽模式，0或者1
            ,content: '<iframe style="height: 99%;width: 100%" src="//player.bilibili.com/player.html?bvid=BV1k7411U7KX&page=1"  border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>'
            ,success: function(layero){

            }
        });
    }
</script>
</body>
</html>