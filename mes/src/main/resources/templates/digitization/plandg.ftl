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
    <!-- 引入 ECharts 文件 -->
    <script src="${request.contextPath}/lib/echarts/echarts.min.js"></script>
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
        </div>

    </div>
</div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    planColumnarChart = echarts.init(document.getElementById('planColumnar'));
    planBinChart = echarts.init(document.getElementById('planBin'));
    // 指定图表的配置项和数据
    planColumnarOption = {
        title: {
            text: '计划产量',
            textStyle:{
                color:"#fff"
            }
        },
        tooltip: {},
        legend: {
            data: ['销量']
        },
        xAxis: {
            data: ["待生产订单总数", "已完成总数"]
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: [100, 200]
        }],
        textStyle : {
            color:"#fff"
        }
    };
    //饼图
    planBinoption = {
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b}: {c} ({d}%)'
        },
        legend: {
            orient: 'vertical',
            left: 10,
            data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
        },
        textStyle : {
            color:"#fff"
        },
        series: [
            {
                name: '访问来源',
                type: 'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: [
                    {value: 335, name: '直接访问'},
                    {value: 310, name: '邮件营销'},
                    {value: 234, name: '联盟广告'},
                    {value: 135, name: '视频广告'},
                    {value: 1548, name: '搜索引擎'}
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    planColumnarChart.setOption(planColumnarOption);
    planBinChart.setOption(planBinoption);

</script>
</body>
</html>