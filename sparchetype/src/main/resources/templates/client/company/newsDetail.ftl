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
<!-- main部分 -->
<div class="main-newsdate">
    <div class="layui-container">
        <p class="news"><a href="news.html">实时新闻</a> > 新闻详情</p>
        <h1>这家引爆ins的奶茶店终于空降南昌，开放加盟啦！</h1>
        <p class="pushtime">发布时间：<span>2018-06-06</span></p>
        <p class="introTop">TA家的珍珠是用黑糖熬制的，要熬整整四个小时才行，每熬一锅黑糖只能做出40杯奶茶，好味，是值得等待的。</p>
        <div><img src="${request.contextPath}/image/company/news_big.jpg" alt="新闻详情图"></div>
        <p class="introBott">北极光的制作，需要300g葡萄来完成，要选用最新鲜的葡萄，才能做出最灿烂的北极光。满满一瓶葡萄，看着就让人倍感满足。喝之前，要先摇9下，才能喝出最好的果味。晨曦的寓意是，清晨的阳光。要用到一整颗百香果的晨曦，喝起来酸酸甜甜，果味浓郁。晨曦喝起来果味极浓，不仅仅有百香果，还有芒果、橙汁...的味道，十分清新，彷佛夏日的一抹凉风！</p>
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