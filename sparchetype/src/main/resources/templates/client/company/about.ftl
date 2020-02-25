<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>网络公司-关于页</title>
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
<div class="banner about">
    <div class="title">
        <p>关于我们</p>
        <p class="en">About Us</p>
    </div>
</div>
<!-- main部分 -->
<div class="main-about">
    <div class="layui-container">
        <div class="layui-row">
            <ul class="aboutab">
                <li class="layui-this">公司简介</li>
                <li>招贤纳士</li>
                <li>发展历程</li>
            </ul>
            <div class="tabIntro">
                <div class="content">
                    <div class="layui-inline img"><img src="${request.contextPath}/image/company/us_img1.jpg"></div>
                    <div class="layui-inline panel">
                        <p>身处在前端社区的繁荣之下，我们都在有意或无意地追逐。而 layui 偏偏回望当初，奔赴在返璞归真的漫漫征途，自信并勇敢着，追寻于原生态的书写指令，试图以最简单的方式诠释高效。</p>
                    </div>
                </div>
                <div class="content">
                    <div class="layui-inline panel p_block">
                        <p>如果眼下还是一团零星之火，那运筹帷幄之后，迎面东风，就是一场烈焰燎原吧，那必定会是一番尽情的燃烧。待，秋风萧瑟时，散作满天星辰，你看那四季轮回，正是Layui不灭的执念。</p>
                    </div>
                    <div class="layui-inline img"><img src="${request.contextPath}/image/company/us_img2.jpg"></div>
                    <p class="p_hidden">如果眼下还是一团零星之火，那运筹帷幄之后，迎面东风，就是一场烈焰燎原吧，那必定会是一番尽情的燃烧。待，秋风萧瑟时，散作满天星辰，你看那四季轮回，正是Layui不灭的执念。</p>
                </div>
                <div class="content">
                    <div class="layui-inline img"><img src="${request.contextPath}/image/company/us_img3.jpg"></div>
                    <div class="layui-inline panel">
                        <p>拥有双面的不仅是人生，还有Layui。一面极简，一面丰盈。极简是视觉所见的外在，是开发所念的简易。丰盈是倾情雕琢的内在，是信手拈来的承诺。一切本应如此，简而全，双重体验。</p>
                    </div>
                </div>
            </div>
            <div class="tabJob">
                <div class="content">
                    <p class="title">前端开发工程师</p>
                    <p>> 职位描述</p>
                    <ol>
                        <li>前端开发及维护工作；</li>
                        <li>有良好的技术基础，熟悉 Web 标准，熟练掌握多种 Web 前端技术；</li>
                        <li>掌握行业内流行的类库，Vue.js， React 等主流框架；</li>
                        <li>参与公司前端工程的设计、研发；</li>
                        <li>了解不同浏览器之间的差异，移动设备之间的差异。</li>
                    </ol>
                </div>
                <div class="content">
                    <p class="title">IOS 开发工程师</p>
                    <p>> 职位描述</p>
                    <ol>
                        <li>前端开发及维护工作；</li>
                        <li>有良好的技术基础，熟悉 Web 标准，熟练掌握多种 Web 前端技术；</li>
                        <li>掌握行业内流行的类库，Vue.js， React 等主流框架；</li>
                        <li>参与公司前端工程的设计、研发；</li>
                        <li>了解不同浏览器之间的差异，移动设备之间的差异。</li>
                    </ol>
                </div>
                <div class="content">
                    <p class="title">JAVA 工程师</p>
                    <p>> 职位描述</p>
                    <ol>
                        <li>前端开发及维护工作；</li>
                        <li>有良好的技术基础，熟悉 Web 标准，熟练掌握多种 Web 前端技术；</li>
                        <li>掌握行业内流行的类库，Vue.js， React 等主流框架；</li>
                        <li>参与公司前端工程的设计、研发；</li>
                        <li>了解不同浏览器之间的差异，移动设备之间的差异。</li>
                    </ol>
                </div>
            </div>
            <div class="tabCour">
                <p class="title">我们的蜕变</p>
                <ul class="timeline">
                    <li class="odd">
                        <div class="cour-img"><img src="${request.contextPath}/image/company/us_img4.png"></div>
                        <div class="cour-panel layui-col-sm4 layui-col-lg5">
                            <p class="label">2017 年 6 月</p>
                            <p>我们成立了，来到了杭州西湖这个美丽的地方。</p>
                        </div>
                    </li>
                    <li>
                        <div class="cour-img"><img src="${request.contextPath}/image/company/us_img5.png"></div>
                        <div class="cour-panel layui-col-sm4 layui-col-sm-offset8 layui-col-lg5 layui-col-lg-offset7">
                            <p class="label">2017 年 6 月</p>
                            <p>我们成立了，来到了杭州西湖这个美丽的地方。</p>
                        </div>
                    </li>
                    <li class="odd">
                        <div class="cour-img"><img src="${request.contextPath}/image/company/us_img6.png"></div>
                        <div class="cour-panel layui-col-sm4 layui-col-lg5">
                            <p class="label">2017 年 6 月</p>
                            <p>我们成立了，来到了杭州西湖这个美丽的地方。</p>
                        </div>
                    </li>
                    <li>
                        <div class="cour-img"><img src="${request.contextPath}/image/company/us_img7.png"></div>
                        <div class="cour-panel layui-col-sm4 layui-col-sm-offset8 layui-col-lg5 layui-col-lg-offset7">
                            <p class="label">2017 年 6 月</p>
                            <p>我们成立了，来到了杭州西湖这个美丽的地方。</p>
                        </div>
                    </li>
                    <li class="odd">
                        <div class="cour-img"><img src="${request.contextPath}/image/company/us_img8.png"></div>
                    </li>
                </ul>
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