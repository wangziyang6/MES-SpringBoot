<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加字典</title>
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
		                <span class="we-red">*</span>标签名
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-name" name="name" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-value" class="layui-form-label">
		                <span class="we-red">*</span>标签值
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-value" name="value" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-type" class="layui-form-label">
		                <span class="we-red">*</span>类别
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-type" name="type" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-descr" class="layui-form-label">
		                <span class="we-red">*</span>描述
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-descr" name="descr" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-sort-num" class="layui-form-label">
		                <span class="we-red">*</span>排序
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-sort-num" name="sortNum" lay-verify="required|number" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
				    <label for="js-status" class="layui-form-label">状态</label>
				    <div class="layui-input-block" id="js-status">
				      <input type="radio" name="status" value="0" title="正常" checked>
				      <input type="radio" name="status" value="1" title="已删除">
				    </div>
				</div>

				<div class="layui-form-item">
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

            //失去焦点时判断值为空不验证，一旦填写必须验证
            $('input[name="email"]').blur(function(){
                //这里是失去焦点时的事件
                if($('input[name="email"]').val()){
                    $('input[name="email"]').attr('lay-verify','email');
                }else{
                    $('input[name="email"]').removeAttr('lay-verify');
                }
            });

            //监听提交
            form.on('submit(add)', function(data) {
                console.log(data.field);
                $.ajax({
                    type: "POST",
                    //请求的媒体类型
                    //contentType: "application/json;charset=UTF-8",
                    url: "${request.contextPath}/admin/sys/dict/add",
                    //data: JSON.stringify(data),
                    data: data.field,
                    success: function(result) {
                        console.log(result);
                        if (result.code === 0) {
                            //获取提交成功的时间
                            var time = new Date();
                            var timeNow = util.toDateString(time);
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
                        console.log(e);
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