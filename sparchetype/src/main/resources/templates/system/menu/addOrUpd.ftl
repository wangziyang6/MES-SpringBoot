<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加菜单</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
		<!--[if lt IE 9]>
	      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    <#include "${request.contextPath}/common/common.ftl">
	</head>

	<body>
		<div class="weadmin-body">
			<form class="layui-form">
				<div class="layui-form-item">
					<label for="js-name" class="layui-form-label">
		                <span class="we-red">*</span>菜单名称
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-name" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="${result.name}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-url" class="layui-form-label">
		                <span class="we-red">*</span>菜单URL
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-url" name="url" lay-verify="required" autocomplete="off" class="layui-input" value="${result.url}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-parent-id" class="layui-form-label">
		                父菜单ID
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-parent-id" name="parentId" lay-verify="" autocomplete="off" class="layui-input" value="${result.parentId}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-grade" class="layui-form-label">
		                层级
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-grade" name="grade" lay-verify="" autocomplete="off" class="layui-input" value="${result.grade}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-sort-num" class="layui-form-label">
		                排序
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-sort-num" name="sortNum" lay-verify="" autocomplete="off" class="layui-input" value="${result.sortNum}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-type" class="layui-form-label">
		                类型
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-type" name="type" lay-verify="" autocomplete="off" class="layui-input" value="${result.type}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-permission" class="layui-form-label">
		                授权
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-permission" name="permission" lay-verify="" autocomplete="off" class="layui-input" value="${result.permission}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-icon" class="layui-form-label">
		                菜单图标
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-icon" name="icon" lay-verify="" autocomplete="off" class="layui-input" value="${result.icon}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-descr" class="layui-form-label">
		                描述
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-descr" name="descr" lay-verify="" autocomplete="off" class="layui-input" value="${result.descr}">
					</div>
				</div>

				<div class="layui-form-item">
				    <input type="hidden" name="id" id="js-id" value="" />
					<label for="js-add-btn" class="layui-form-label"></label>
					<button id="js-add-btn" class="layui-btn" lay-filter="add" lay-submit="">确定</button>
				</div>
			</form>
		</div>
	</body>
    <script>
        layui.extend({
            admin: '${request.contextPath}/js/admin'
        });
        layui.use(['form', 'jquery', 'util', 'admin', 'layer'], function() {
            var form = layui.form,
                $ = layui.jquery,
                util = layui.util,
                admin = layui.admin,
                layer = layui.layer;

            //监听提交
            form.on('submit(add)', function(data) {
                $.ajax({
                    type: "POST",
                    //请求的媒体类型
                    //contentType: "application/json;charset=UTF-8",
                    url: "${request.contextPath}/admin/sys/menu/add-or-upd",
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