<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>

<body>
    <div class="">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="js-name" class="layui-form-label sp-required">角色名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="js-name" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="${result.name}">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="js-code" class="layui-form-label sp-required">角色编码
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="js-code" name="code" lay-verify="required" autocomplete="off" class="layui-input" value="${result.code}">
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

            <div class="layui-form-item">
                <label for="js-status" class="layui-form-label sp-required">状态</label>
                <div class="layui-input-block" id="js-status">
                  <input type="radio" name="status" value="0" title="正常" <#if result.status == "0" || !(result??)>checked</#if>>
                  <input type="radio" name="status" value="1" title="已删除" <#if result.status == "1">checked</#if>>
                </div>
            </div>

            <div class="layui-form-item">
                <input type="hidden" name="id" id="js-id" value="" />
                <label for="js-add-btn" class="layui-form-label sp-required"></label>
                <button id="js-add-btn" class="layui-btn" lay-filter="add" lay-submit="">确定</button>
            </div>
        </form>
    </div>
</body>
<script>
    layui.extend({
        admin: '${request.contextPath}/js/admin'
    });
    layui.use(['form', 'util', 'layer'], function() {
        var form = layui.form,
            util = layui.util,
            layer = layui.layer;

        //监听提交
        form.on('submit(add)', function(data) {
            $.ajax({
                type: "POST",
                //请求的媒体类型
                //contentType: "application/json;charset=UTF-8",
                url: "${request.contextPath}/admin/sys/role/add-or-upd",
                //data: JSON.stringify(data),
                data: data.field,
                success: function(result) {
                    if (result.code === 0) {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //刷新父页面，注意一定要在关闭当前iframe层之前执行刷新
                        parent.location.reload();
                        //关闭当前frame
                        parent.layer.close(index);
                    } else {
                        layer.alert(result.msg, {
                          icon: 2
                        })
                    }
                },
                error: function(e){
                    layer.alert(e, {
                      icon: 2
                    })
                }
            });

            return false;
        });
    });
</script>
</html>