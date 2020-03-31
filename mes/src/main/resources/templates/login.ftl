<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>黑科-MES系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon"/>
    <#include "${request.contextPath}/common/common.ftl">
    <script src="${request.contextPath}/lib/jq-module/jquery.particleground.min.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${request.contextPath}/css/start.css" media="all">
    <style>
        html, body {
            width: 100%;
            height: 100%;
            overflow: hidden
        }
        body:after {
            content: '';
            background-repeat: no-repeat;
            background-size: cover;
            -webkit-filter: blur(3px);
            -moz-filter: blur(3px);
            -o-filter: blur(3px);
            -ms-filter: blur(3px);
            filter: blur(3px);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: -1;
        }

        .layui-container {
            width: 100%;
            height: 100%;
            overflow: hidden
        }

        .admin-login-background {
            width: 360px;
            height: 300px;
            position: absolute;
            left: 50%;
            top: 40%;
            margin-left: -180px;
            margin-top: -100px;
        }

        .logo-title {
            text-align: center;
            letter-spacing: 2px;
            padding: 14px 0;
        }

        .logo-title h1 {
            color: #fff;
            font-size: 25px;
            font-weight: bold;
        }

        .login-form {
            background-color: transparent;
           border: 1px solid #fff;
            border-radius: 3px;
            padding: 14px 20px;
           // box-shadow: 0 0 8px #eeeeee;
        }

        .login-form .layui-form-item {
            position: relative;
        }

        .login-form .layui-form-item label {
            position: absolute;
            left: 1px;
            top: 1px;
            width: 38px;
            line-height: 36px;
            text-align: center;
            color: #d2d2d2;
        }

        .login-form .layui-form-item input {
            padding-left: 36px;
        }

        .captcha {
            width: 60%;
            display: inline-block;
        }

        .captcha-img {
            display: inline-block;
            width: 34%;
            float: right;
        }

        .captcha-img img {
            height: 34px;
            border: 1px solid #e6e6e6;
            height: 36px;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="stars"></div>
<div class="layui-container">
    <div class="admin-login-background">
        <div class="layui-form login-form">
            <form class="layui-form" action="">
                <div class="layui-form-item logo-title">
                    <h1>黑科开源免费-MES系统</h1>
                    <div class="layui-anim layui-anim-rotate">
                        <a href='https://gitee.com/wangziyangyang/MES-Springboot'><img src='https://gitee.com/wangziyangyang/MES-Springboot/widgets/widget_3.svg?color=170317' alt='Fork me on Gitee'></img></a>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-username" for="username"></label>
                    <input type="text" name="username" lay-verify="required|account" placeholder="用户名或者邮箱" autocomplete="off" class="layui-input" value="admin" >
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-password" for="password"></label>
                    <input type="password" name="password" lay-verify="required|password" placeholder="密码" autocomplete="off" class="layui-input" value="123" >
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-vercode" for="captcha"></label>
                    <input type="text" name="captcha" lay-verify="required|captcha" placeholder="图形验证码" autocomplete="off" class="layui-input verification captcha" >
                    <div class="captcha-img">
                        <img id="captchaPic" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <input type="checkbox" name="rememberMe" value="true" lay-skin="primary" title="记住密码">
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="login">登 入</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = layui.layer;

        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;
        // 进行登录操作
        form.on('submit(login)', function (data) {
            $.ajax({
                type: "POST",
                //请求的媒体类型
                url: "${request.contextPath}/login",
                data: data.field,
                success: function (result) {
                    if (result.code === 0) {
                        location.href = '${request.contextPath}/admin'
                    } else {
                        layer.alert(result.msg, {
                            icon: 2
                        })
                    }
                },
                error: function (e) {
                    layer.alert(e, {
                        icon: 2
                    })
                }
            });
            return false;
        });
        /**
         * 获取图形验证码
         */
        $('#captchaPic').click(function () {
            this.src = "${request.contextPath}/verification/code?" + Math.random();
        });
        $("#captchaPic").click();
    });
</script>

<script>
    $(document).ready(function(){
        var stars=800;  /*星星的密集程度，数字越大越多*/
        var $stars=$(".stars");
        var r=800;   /*星星的看起来的距离,值越大越远,可自行调制到自己满意的样子*/
        for(var i=0;i<stars;i++){
            var $star=$("<div/>").addClass("star");
            $stars.append($star);
        }
        $(".star").each(function(){
            var cur=$(this);
            var s=0.2+(Math.random()*1);
            var curR=r+(Math.random()*300);
            cur.css({
                transformOrigin:"0 0 "+curR+"px",
                transform:" translate3d(0,0,-"+curR+"px) rotateY("+(Math.random()*360)+"deg) rotateX("+(Math.random()*-50)+"deg) scale("+s+","+s+")"

            })
        })
    })
</script>
</body>
</html>