<!DOCTYPE html>
<html style="background-color: #04080b;">
<head>
    <meta charset="UTF-8">
    <title>404</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<style>
    .splayUi-container {
        background-image: url(/image/plan.jpg);
        background-size: cover;
        height: 694px;
    }

</style>
<body>
<div style="width:100%;">

    <div class="splayUi-container">
        <div class="layui-row">
            <div class="layui-col-xs6">
                <div id="planColumnar" style="width: 600px;height:400px;"></div>
            </div>
            <div class="layui-col-xs6">
                <div id="planBin" style="width: 600px;height:400px;"></div>
            </div>
            <div class="layui-col-xs5">
                <div id="orderMeter" style="width: 600px;height:400px;"></div>
            </div>
            <div class="layui-col-xs7">
                <div id="threeMete" style="width: 592px;height:520px;"></div>
            </div>
        </div>

    </div>
</div>
<!-- 引入 ECharts 文件 -->
<script src="${request.contextPath}/lib/echarts/echarts.min.js"></script>
<script src="${request.contextPath}/js/mes/digitization/plandg.js"></script>
<script src="${request.contextPath}/js/mes/digitization/orderMete.js"></script>
<script type="text/javascript">
</script>
</body>
</html>