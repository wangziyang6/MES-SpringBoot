<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加菜单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <div class="layui-form-item">
                        <label for="js-name" class="layui-form-label sp-required">菜单名称
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-name" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="${result.name}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-url" class="layui-form-label sp-required">菜单URL
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-url" name="url" lay-verify="required" autocomplete="off" class="layui-input" value="${result.url}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-parent-id" class="layui-form-label sp-required">
                            父菜单ID
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-parent-id" name="parentId" lay-verify="" autocomplete="off" class="layui-input" value="${result.parentId}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-grade" class="layui-form-label sp-required">
                            层级
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-grade" name="grade" lay-verify="" autocomplete="off" class="layui-input" value="${result.grade}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-sort-num" class="layui-form-label sp-required">
                            排序
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-sort-num" name="sortNum" lay-verify="" autocomplete="off" class="layui-input" value="${result.sortNum}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-type" class="layui-form-label sp-required">
                            类型
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-type" name="type" lay-verify="" autocomplete="off" class="layui-input" value="${result.type}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-permission" class="layui-form-label sp-required">
                            授权
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-permission" name="permission" lay-verify="" autocomplete="off" class="layui-input" value="${result.permission}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-icon" class="layui-form-label sp-required">
                            菜单图标
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-icon" name="icon" lay-verify="" autocomplete="off" class="layui-input" value="${result.icon}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-descr" class="layui-form-label sp-required">
                            描述
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-descr" name="descr" lay-verify="" autocomplete="off" class="layui-input" value="${result.descr}">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-hide">
                    <div class="layui-input-block">
                        <input id="js-id" name="id" value="${result.id}"/>
                        <button id="js-submit" class="layui-btn" lay-submit lay-filter="js-submit-filter">确定</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'util', 'layer'], function () {
        var form = layui.form,
            util = layui.util,
            layer = layui.layer;

        //监听提交
        form.on('submit(js-submit-filter)', function (data) {
            spUtil.submitForm({
                url: "${request.contextPath}/admin/sys/user/add-or-update",
                data: data.field
            });

            return false;
        });
    });
</script>
</body>
</html>