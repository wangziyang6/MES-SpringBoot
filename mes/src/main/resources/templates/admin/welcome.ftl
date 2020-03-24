<!DOCTYPE html>
<html>
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
    <style type="text/css">
        html, body {
            height: 100%;
        }
    </style>
</head>
<style>
    .splayUi-container {
        background-size: 100% 100%;
        -moz-background-size: 100% 100%;
        background-image: url(/image/hk.png);
        height: 98%;
        width: 100%;
        position: relative;
        display: flex;
    }

    .flexBox {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    .wrap {
        flex-direction: column;
        display: flex;
    }
</style>
<body>
<div class="wrap" style="height: 100%">
    <div class="splayUi-container">
    </div>
    <div class="flexBox">

        <div id="div_timer" style="margin-left:auto">
        </div>
    </div>
</div>
<script type="text/javascript">
    //获取系统时间
    showTime();
    function showTime() {
        nowtime = new Date();
        year = nowtime.getFullYear();//年
        month = nowtime.getMonth() + 1;//月
        day = nowtime.getDate();//日
        hour = nowtime.getHours();//时
        minutes = nowtime.getMinutes();//分
        seconds = nowtime.getSeconds();//秒//文字增加空格
        document.getElementById("div_timer").innerText = '当前时间：' + year + "." + p(month) + "." + p(day) + " " + p(hour) + ":" + p(minutes) + ":" + p(seconds);
    }

    setInterval("showTime()", 1000);

    //月日时分秒小于10补0
    function p(s) {
        return s < 10 ? '0' + s : s;
    }
</script>
</body>
</html>