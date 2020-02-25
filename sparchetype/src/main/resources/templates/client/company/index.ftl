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
<div class="nav index">
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
<div>
    <div class="layui-carousel" id="banner">
        <div carousel-item>
            <div>
                <img src="${request.contextPath}/image/company/banner1.jpg">
                <div class="panel">
                    <p class="title">网络公司</p>
                    <p>完美前端体验</p>
                </div>
            </div>
            <div>
                <img src="${request.contextPath}/image/company/banner2.jpg">
                <div class="panel">
                    <p class="title">网络公司</p>
                    <p>完美前端体验</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- main部分 -->
<div class="main-product">
    <div class="layui-container">
        <p class="title">专为前端而研制的<span>核心产品</span></p>
        <div class="layui-row layui-col-space25">
            <div class="layui-col-sm6 layui-col-md3">
                <div class="content">
                    <div><img src="${request.contextPath}/image/company/Big_icon1.png"></div>
                    <div>
                        <p class="label">JS基础库</p>
                        <p>从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。</p>
                    </div>
                    <a href="javascript:;">查看产品 ></a>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md3 ">
                <div class="content">
                    <div><img src="${request.contextPath}/image/company/Big_icon2.png"></div>
                    <div>
                        <p class="label">CSS处理</p>
                        <p>从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。</p>
                    </div>
                    <a href="javascript:;">查看产品 ></a>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md3 ">
                <div class="content">
                    <div><img src="${request.contextPath}/image/company/Big_icon3.png"></div>
                    <div>
                        <p class="label">兼容性</p>
                        <p>从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。</p>
                    </div>
                    <a href="javascript:;">查看产品 ></a>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md3 ">
                <div class="content">
                    <div><img src="${request.contextPath}/image/company/Big_icon4.png"></div>
                    <div>
                        <p class="label">响应式</p>
                        <p>从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。</p>
                    </div>
                    <a href="javascript:;">查看产品 ></a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="main-service">
    <div class="layui-container">
        <p class="title">为客户打造完美的<span>专业服务</span></p>
        <div class="layui-row layui-col-space25 layui-col-space80">
            <div class="layui-col-sm6">
                <div class="content">
                    <div class="content-left"><img src="${request.contextPath}/image/company/home_img1.jpg"></div>
                    <div class="content-right">
                        <p class="label">1 对 1 前端指导</p>
                        <span></span>
                        <p>更有多个包含不同主题的Web组件，可快速构建界面出色、体验优秀的跨屏页面，大幅提升开发效率。</p>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6">
                <div class="content">
                    <div class="content-left"><img src="${request.contextPath}/image/company/home_img2.jpg"></div>
                    <div class="content-right">
                        <p class="label">1 对 1 前端指导</p>
                        <span></span>
                        <p>更有多个包含不同主题的Web组件，可快速构建界面出色、体验优秀的跨屏页面，大幅提升开发效率。</p>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6">
                <div class="content">
                    <div class="content-left"><img src="${request.contextPath}/image/company/home_img3.jpg"></div>
                    <div class="content-right">
                        <p class="label">1 对 1 前端指导</p>
                        <span></span>
                        <p>更有多个包含不同主题的Web组件，可快速构建界面出色、体验优秀的跨屏页面，大幅提升开发效率。</p>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6">
                <div class="content">
                    <div class="content-left"><img src="${request.contextPath}/image/company/home_img4.jpg"></div>
                    <div class="content-right">
                        <p class="label">1 对 1 前端指导</p>
                        <span></span>
                        <p>更有多个包含不同主题的Web组件，可快速构建界面出色、体验优秀的跨屏页面，大幅提升开发效率。</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="service-more"><a href="">查看更多</a></div>
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
                        <p class="contact-top"><i class="layui-icon layui-icon-cellphone"></i>&nbsp;400-8888888&nbsp;&nbsp;(9:00-18:00)</p>
                        <p class="contact-bottom"><i class="layui-icon layui-icon-home"></i>&nbsp;88888888@163.com</span></p>
                    </div>
                    <div class="layui-col-sm6 layui-col-md4 layui-col-lg3">
                        <p class="contact-top"><span class="right">该模板版权归 <a href="https://www.layui.com/" target="_blank">layui.com</a> 所有</span></p>
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