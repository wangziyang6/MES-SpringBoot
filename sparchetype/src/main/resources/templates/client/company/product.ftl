<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>网络公司-首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <#include "${request.contextPath}/common/common.ftl">
    <link rel="stylesheet" href="${request.contextPath}/css/company.css" media="all">
</head>
<body>
<!-- nav部分 -->
<div class="nav">
    <div class="layui-container">
        <!-- 公司logo -->
        <div class="nav-logo">
            <a href="index.html">
                <img src="${request.contextPath}/image/company/logo.png" alt="网络公司">
            </a>
        </div>
        <div class="nav-list">
            <button>
                <span></span><span></span><span></span>
            </button>
            <ul class="layui-nav" lay-filter="">
                <li class="layui-nav-item"><a href="${request.contextPath}/client/company/product-ui">产品</a></li>
                <li class="layui-nav-item"><a href="${request.contextPath}/client/company/news-ui">动态</a></li>
                <li class="layui-nav-item"><a href="${request.contextPath}/client/company/case-ui">案例</a></li>
                <li class="layui-nav-item"><a href="${request.contextPath}/client/company/about-ui">关于</a></li>
                <li class="layui-nav-item"><a href="https://fly.layui.com/store/" target="_blank">模板</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- banner部分 -->
<div class="banner product">
    <div class="title">
        <p>产品展示</p>
        <p class="en">Product Display</p>
    </div>
</div>
<!-- main部分 -->
<div class="main product">
    <div class="layui-container">
        <div class="content layui-row">
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md7 layui-col-lg6 content-img"><img src="${request.contextPath}/image/company/Product_img1.jpg"></div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md5 layui-col-lg6 right">
                <p class="label">JS基础库</p>
                <p class="detail">从小屏逐步扩展到大屏，最终实现所有屏幕适配，最终实现所有屏幕适配，适应移动互联潮流。最终实现所有屏幕适配，适应移动互联潮流。最终实现所有屏幕适配，适应移动互联潮流。</p>
                <div><a href="javascript:;">查看产品 ></a></div>
            </div>
        </div>
        <div class="content layui-row">
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md7 layui-col-lg6 content-img"><img src="${request.contextPath}/image/company/Product_img2.jpg"></div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md5 layui-col-lg6 right">
                <p class="label">CSS处理</p>
                <p class="detail">从小屏逐步扩展到大屏，最终实现所有屏幕适配，最终实现所有屏幕适配，适应移动互联潮流。最终实现所有屏幕适配，适应移动互联潮流。最终实现所有屏幕适配，适应移动互联潮流。</p>
                <div><a href="javascript:;">查看产品 ></a></div>
            </div>
        </div>
        <div class="content layui-row">
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md7 layui-col-lg6 content-img"><img src="${request.contextPath}/image/company/Product_img3.jpg"></div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md5 layui-col-lg6 right">
                <p class="label">兼容性</p>
                <p class="detail">从小屏逐步扩展到大屏，最终实现所有屏幕适配，最终实现所有屏幕适配，适应移动互联潮流。最终实现所有屏幕适配，适应移动互联潮流。最终实现所有屏幕适配，适应移动互联潮流。</p>
                <div><a href="javascript:;">查看产品 ></a></div>
            </div>
        </div>
        <div class="content layui-row">
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md7 layui-col-lg6 content-img"><img src="${request.contextPath}/image/company/Product_img4.jpg"></div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md5 layui-col-lg6 right">
                <p class="label">响应式</p>
                <p class="detail">从小屏逐步扩展到大屏，最终实现所有屏幕适配，最终实现所有屏幕适配，适应移动互联潮流。最终实现所有屏幕适配，适应移动互联潮流。最终实现所有屏幕适配，适应移动互联潮流。</p>
                <div><a href="javascript:;">查看产品 ></a></div>
            </div>
        </div>
    </div>
</div>
<!-- footer部分 -->
<div class="footer">
    <div class="layui-container">
        <p class="footer-web">
            <a href="javascript:;">合作伙伴</a>
            <a href="javascript:;">企业画报</a>
            <a href="javascript:;">JS网</a>
            <a href="javascript:;">千图网</a>
            <a href="javascript:;">昵图网</a>
            <a href="javascript:;">素材网</a>
            <a href="javascript:;">花瓣网</a>
        </p>
        <div class="layui-row footer-contact">
            <div class="layui-col-sm2 layui-col-lg1"><img src="${request.contextPath}/image/company/erweima.jpg"></div>
            <div class="layui-col-sm10 layui-col-lg11">
                <div class="layui-row">
                    <div class="layui-col-sm6 layui-col-md8 layui-col-lg9">
                        <p class="contact-top"><i class="layui-icon layui-icon-cellphone"></i>&nbsp;400-8888888&nbsp;&nbsp;&nbsp;(9:00-18:00)</p>
                        <p class="contact-bottom"><i class="layui-icon layui-icon-home"></i>&nbsp;88888888@163.com</span></p>
                    </div>
                    <div class="layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p class="contact-top"><span class="right">该模板由 <a href="https://www.layui.com/" target="_blank">layui.com</a> 官方出品</span></p>
                        <p class="contact-bottom"><span class="right">Copyright&nbsp;©&nbsp;2016-2018&nbsp;&nbsp;ICP&nbsp;备888888号</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['company'], function () {
        var company = layui.company;
    });
</script>
</body>
</html>