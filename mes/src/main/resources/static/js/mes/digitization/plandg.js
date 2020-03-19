// 基于准备好的dom，初始化echarts实例
planColumnarChart = echarts.init(document.getElementById('planColumnar'));
planBinChart = echarts.init(document.getElementById('planBin'));
orderMeteChart = echarts.init(document.getElementById('orderMeter'));
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
        data: ['一车间', '二车间', '三车间', '四车间', '五车间'],
        textStyle : {
            color:"#fff"
        }
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
                {value: 335, name: '一车间'},
                {value: 310, name: '二车间'},
                {value: 234, name: '三车间'},
                {value: 135, name: '四车间'},
                {value: 1548, name: '五车间'}
            ]
        }
    ]
};

orderOption = {
    tooltip: {
        formatter: '{a} <br/>{b} : {c}%'
    },
    toolbox: {
        feature: {
            restore: {},
            saveAsImage: {}
        }
    },
    series: [
        {
            name: '业务指标',
            type: 'gauge',
            detail: {formatter: '{value}%'},
            data: [{value: 50, name: '工单达成率'}]
        }
    ]
};
setInterval(function () {
    orderOption.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
    orderMeteChart.setOption(orderOption,true);
},2000);
// 使用刚指定的配置项和数据显示图表。
planColumnarChart.setOption(planColumnarOption);
planBinChart.setOption(planBinoption);