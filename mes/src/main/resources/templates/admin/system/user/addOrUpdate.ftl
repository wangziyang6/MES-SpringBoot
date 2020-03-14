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
                        <label for="js-username" class="layui-form-label sp-required">用户名
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-username" name="username" lay-verify="required" autocomplete="off" class="layui-input" value="${result.username}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-password" class="layui-form-label sp-required">密码
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" id="js-password" name="password" lay-verify="required" autocomplete="off" class="layui-input" value="${result.password}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-repassword" class="layui-form-label sp-required">确认密码
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" id="js-repassword" name="repassword" lay-verify="required" autocomplete="off" class="layui-input" value="${result.password}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-dept-id" class="layui-form-label sp-required">
                            部门id
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-dept-id" name="deptId" lay-verify="" autocomplete="off" class="layui-input" value="${result.deptId}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-email" class="layui-form-label sp-required">
                            邮箱
                        </label>
                        <!--校验规则动态添加，根据鼠标焦点进行-->
                        <div class="layui-input-inline">
                            <input type="text" id="js-email" name="email" lay-verify="" autocomplete="off" class="layui-input" value="${result.email}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-mobile" class="layui-form-label sp-required">手机号
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-mobile" name="mobile" lay-verify="required|number" autocomplete="off" class="layui-input" value="${result.mobile}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-tel" class="layui-form-label sp-required">
                            固定电话
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-tel" name="tel" lay-verify="" autocomplete="off" class="layui-input" value="${result.tel}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-sex" class="layui-form-label sp-required">性别</label>
                        <div class="layui-input-block" id="js-sex">
                            <input type="radio" name="sex" value="0" title="女" <#if result.sex == "0" || !(result??)>checked</#if>>
                            <input type="radio" name="sex" value="1" title="男" <#if result.sex == "1">checked</#if>>
                            <input type="radio" name="sex" value="2" title="其他" <#if result.sex == "2">checked</#if>>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-birthday" class="layui-form-label sp-required">
                            出生年月日
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-birthday" name="birthday" lay-verify="" autocomplete="off" class="layui-input" value="${result.birthday}">
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <div class="layui-form-item">
                        <label for="js-pic-id" class="layui-form-label sp-required">
                            图片id
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-pic-id" name="picId" lay-verify="" autocomplete="off" class="layui-input" value="${result.picId}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-id-card" class="layui-form-label sp-required">
                            身份证
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-id-card" name="idCard" lay-verify="" autocomplete="off" class="layui-input" value="${result.idCard}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-hobby" class="layui-form-label sp-required">
                            爱好
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-hobby" name="hobby" lay-verify="" autocomplete="off" class="layui-input" value="${result.hobby}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-province" class="layui-form-label sp-required">
                            省份
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-province" name="province" lay-verify="" autocomplete="off" class="layui-input" value="${result.province}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-city" class="layui-form-label sp-required">城市</label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-city" name="city" lay-verify="" autocomplete="off" class="layui-input" value="${result.city}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-district" class="layui-form-label sp-required">区县</label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-district" name="district" lay-verify="" autocomplete="off" class="layui-input" value="${result.district}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-street" class="layui-form-label sp-required">街道</label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-street" name="street" lay-verify="" autocomplete="off" class="layui-input" value="${result.street}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-street-number" class="layui-form-label sp-required">门牌号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-street-number" name="streetNumber" lay-verify="" autocomplete="off" class="layui-input" value="${result.streetNumber}">
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

                <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                    <div class="layui-form-item" pane="">
                        <label class="layui-form-label">分配权限</label>
                        <div class="layui-input-block">
                            <#list sysRoles as sysRole>
                                <input type="checkbox" name="sysRoleIds[]" title="${sysRole.name}" value="${sysRole.id}" <#if sysRole.checked >checked</#if>>
                            </#list>
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
            //return false;

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