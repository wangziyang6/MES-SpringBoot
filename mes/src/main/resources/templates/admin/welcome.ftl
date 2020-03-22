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
        html,body{
            height:100%;
        }
    </style>
</head>
<style>
    .splayUi-container {
        background-size: 100% 100%;
        -moz-background-size:100% 100%;
        background-image: url(/image/hk.png) ;
        height: 98.5%;
        width: 100%;
        position: relative;
    }

    .box {
        display: inline-flex;
        justify-content: space-between;
    }
    .wrap {
        flex-wrap: wrap;
        display: flex;
        align-items:stretch;

    }
</style>
<body >
<div class="wrap" style="height: 100%">
    <div class="splayUi-container">
    </div>
    <div class=" box">
        <b>开发者：王子杨</b>
        <div class="box" id="div_timer">
        </div>
    </div>
</div>
<script type="text/javascript">
    //获取系统时间
    function showTime() {
        nowtime = new Date();
        year = nowtime.getFullYear();//年
        month = nowtime.getMonth() + 1;//月
        day = nowtime.getDate();//日
        hour = nowtime.getHours();//时
        minutes = nowtime.getMinutes();//分
        seconds = nowtime.getSeconds();//秒//文字增加空格
        document.getElementById("div_timer").style = "white-space:pre;";//显示时间
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