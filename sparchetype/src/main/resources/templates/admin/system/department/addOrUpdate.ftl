<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加部门</title>
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
                        <label for="js-name" class="layui-form-label sp-required">姓名
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-name" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="${result.name}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-descr" class="layui-form-label sp-required">描述</label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-descr" name="descr" lay-verify="" autocomplete="off" class="layui-input" value="${result.descr}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-is-deleted" class="layui-form-label sp-required">状态</label>
                        <div class="layui-input-block" id="js-is-deleted">
                            <input type="radio" name="deleted" value="0" title="正常" <#if result.deleted == "0" || !(result??)>checked</#if>>
                            <input type="radio" name="deleted" value="1" title="已删除" <#if result.deleted == "1">checked</#if>>
                            <input type="radio" name="deleted" value="2" title="已禁用" <#if result.deleted == "2">checked</#if>>
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
    layui.use(['form', 'util'], function () {
        var form = layui.form,
            util = layui.util;

        //失去焦点时判断值为空不验证，一旦填写必须验证
        $('input[name="email"]').blur(function () {
            //这里是失去焦点时的事件
            if ($('input[name="email"]').val()) {
                $('input[name="email"]').attr('lay-verify', 'email');
            } else {
                $('input[name="email"]').removeAttr('lay-verify');
            }
        });

        //监听提交
        form.on('submit(js-submit-filter)', function (data) {
            spUtil.submitForm({
                url: "${request.contextPath}/admin/sys/department/add-or-update",
                data: data.field
            });

            return false;
        });
    });
</script>
</body>
</html>