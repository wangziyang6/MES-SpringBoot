<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>工序与流程关系</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label for="js-name" class="layui-form-label sp-required">流程编码
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="js-flow" name="flow" lay-verify="required" autocomplete="off"
                               class="layui-input" value="${flow.flow}">
                    </div>
                </div>
                <div class="layui-inline">
                    <label for="js-code" class="layui-form-label sp-required">流程描述
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="js-flowDesc" name="flowDesc" lay-verify="required" autocomplete="off"
                               class="layui-input" value="${flow.flowDesc}">
                    </div>
                </div>

            </div>
            <div class="layui-form-item">
                <label for="js-descr" class="layui-form-label " >流程时序
                </label>
                <div class="layui-input-inline" style="width: 514px">
                    <input type="text" id="js-process"  readonly autocomplete="off"
                           class="layui-input" value="${flow.process}">
                </div>
            </div>

            <div class="layui-form-item">
                <fieldset class="layui-elem-field layui-field-title" >
                    <legend>流程与工序关系</legend>
                </fieldset>
                <div id="js-shuttle" class="demo-transfer"></div>
            </div>
            <div class="layui-form-item layui-hide">
                <div class="layui-input-block">
                    <input id="js-id" name="id" value="${flow.id}"/>
                    <button id="js-submit" class="layui-btn" lay-demotransferactive="getData" lay-submit
                            lay-filter="js-submit-filter">确定
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'util', 'transfer', 'util'], function () {
        var form = layui.form,
            util = layui.util,
            layer = layui.layer,
            transfer = layui.transfer;
        var requestParmaArr = [];
        //模拟数据
        allOpers = [];
        currentOpers = [];
        //初始化全部工序
        <#list allOper as oper >
        allOper = {};
        allOper.value = '${oper.value}';
        allOper.title = '${oper.title}';
        allOpers.push(allOper);
        </#list>
        //初始化当前流程下挂的工序
        if ('${flow.id}') {
            <#list currentOper as oper >
            currentOpers.push('${oper.value}');
            </#list>
        }

        //初始穿梭框数据
        transfer.render({
            elem: '#js-shuttle',
            title: ['全部工序', '当前Flow下工序']
            , data: allOpers
            , value: currentOpers
            , id: 'keyFlow' //定义唯一索引
        });

        //获取右侧数据
        util.event('lay-demoTransferActive', {
            getData: function (othis) {
                var getData = transfer.getData('keyFlow');
                requestParmaArr = getData;
            }
        });

        //监听提交
        form.on('submit(js-submit-filter)', function (data) {
            data.field.spOperVoList = requestParmaArr;
            spUtil.submitForm({
                contentType: 'application/json;charset=UTF-8',
                url: "${request.contextPath}/basedata/flow/process/add-or-update",
                data: JSON.stringify(data.field)
            });
            return false;
        });

    });

</script>
</body>
</html>