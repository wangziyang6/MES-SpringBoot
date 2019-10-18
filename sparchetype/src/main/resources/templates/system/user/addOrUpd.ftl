<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加用户</title>
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
		                <span class="we-red">*</span>姓名
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-name" name="name" lay-verify="required" autocomplete="off" class="layui-input" value="${result.name}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-username" class="layui-form-label">
		                <span class="we-red">*</span>用户名
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-username" name="username" lay-verify="required" autocomplete="off" class="layui-input" value="${result.username}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-password" class="layui-form-label">
		                <span class="we-red">*</span>密码
		            </label>
					<div class="layui-input-inline">
						<input type="password" id="js-password" name="password" lay-verify="required" autocomplete="off" class="layui-input" value="${result.password}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-repassword" class="layui-form-label">
		                <span class="we-red">*</span>确认密码
		            </label>
					<div class="layui-input-inline">
						<input type="password" id="js-repassword" name="repassword" lay-verify="required" autocomplete="off" class="layui-input" value="${result.password}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-dept-id" class="layui-form-label">
		                部门id
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-dept-id" name="deptId" lay-verify="" autocomplete="off" class="layui-input" value="${result.deptId}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-email" class="layui-form-label">
		                邮箱
		            </label>
		            <!--校验规则动态添加，根据鼠标焦点进行-->
					<div class="layui-input-inline">
						<input type="text" id="js-email" name="email" lay-verify="" autocomplete="off" class="layui-input" value="${result.email}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-mobile" class="layui-form-label">
		                <span class="we-red">*</span>手机号
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-mobile" name="mobile" lay-verify="required|number" autocomplete="off" class="layui-input" value="${result.mobile}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-tel" class="layui-form-label">
		                固定电话
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-tel" name="tel" lay-verify="" autocomplete="off" class="layui-input" value="${result.tel}">
					</div>
				</div>

				<div class="layui-form-item">
				    <label for="js-sex" class="layui-form-label"><span class="we-red">*</span>性别</label>
				    <div class="layui-input-block" id="js-sex">
				      <input type="radio" name="sex" value="0" title="女" <#if result.sex == "0" || !(result??)>checked</#if>>
				      <input type="radio" name="sex" value="1" title="男" <#if result.sex == "1">checked</#if>>
				      <input type="radio" name="sex" value="2" title="其他" <#if result.sex == "2">checked</#if>>
				    </div>
				</div>

				<div class="layui-form-item">
					<label for="js-birthday" class="layui-form-label">
		                出生年月日
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-birthday" name="birthday" lay-verify="" autocomplete="off" class="layui-input" value="${result.birthday}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-pic-id" class="layui-form-label">
		                图片id
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-pic-id" name="picId" lay-verify="" autocomplete="off" class="layui-input" value="${result.picId}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-id-card" class="layui-form-label">
		                身份证
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-id-card" name="idCard" lay-verify="" autocomplete="off" class="layui-input" value="${result.idCard}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-hobby" class="layui-form-label">
		                爱好
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-hobby" name="hobby" lay-verify="" autocomplete="off" class="layui-input" value="${result.hobby}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-province" class="layui-form-label">
		                省份
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-province" name="province" lay-verify="" autocomplete="off" class="layui-input" value="${result.province}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-city" class="layui-form-label">
		                城市
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-city" name="city" lay-verify="" autocomplete="off" class="layui-input" value="${result.city}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-district" class="layui-form-label">
		                区县
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-district" name="district" lay-verify="" autocomplete="off" class="layui-input" value="${result.district}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-street" class="layui-form-label">
		                街道
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-street" name="street" lay-verify="" autocomplete="off" class="layui-input" value="${result.street}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="js-street-number" class="layui-form-label">
		                门牌号
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="js-street-number" name="streetNumber" lay-verify="" autocomplete="off" class="layui-input" value="${result.streetNumber}">
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
				    <label for="js-status" class="layui-form-label"><span class="we-red">*</span>状态</label>
				    <div class="layui-input-block" id="js-status">
				      <input type="radio" name="status" value="0" title="正常" <#if result.status == "0" || !(result??)>checked</#if>>
				      <input type="radio" name="status" value="1" title="已删除" <#if result.status == "1">checked</#if>>
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
                $.ajax({
                    type: "POST",
                    //请求的媒体类型
                    //contentType: "application/json;charset=UTF-8",
                    url: "${request.contextPath}/admin/sys/user/add-or-upd",
                    //data: JSON.stringify(data),
                    data: data.field,
                    success: function(result) {
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