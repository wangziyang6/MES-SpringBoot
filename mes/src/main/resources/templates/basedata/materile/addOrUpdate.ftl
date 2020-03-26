<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
    <link href="${request.contextPath}/css/effect.css" rel="stylesheet" type="text/css"/>
    <style>
        .flowProcss {
            font-size: 25px;
            margin-left: 310PX;
            display: flex;
            justify-content: flex-start;
            flex-direction: row;
        }

    </style>

</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form" lay-filter="formTest">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md10">
                    <div class="layui-form-item">
                        <label for="js-materiel" class="layui-form-label sp-required">物料编号
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-materiel" name="materiel" lay-verify="required" autocomplete="off"
                                   class="layui-input" value="${result.materiel}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-materielDesc" class="layui-form-label sp-required">物料描述
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-materielDesc" name="materielDesc" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="${result.materielDesc}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-unit" class="layui-form-label sp-required">单位
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-unit" name="unit" lay-verify="required" autocomplete="off"
                                   class="layui-input" value="${result.unit}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-productGroup" class="layui-form-label sp-required">产品组
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-productGroup" name="productGroup" lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input" value="${result.productGroup}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-model" class="layui-form-label sp-required">规格型号
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-model" name="model" lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input" value="${result.model}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-matType" class="layui-form-label sp-required">物料类型
                        </label>
                        <div class="layui-input-inline">
                            <select id="js-matType" name="matType" lay-filter="matType-filter" lay-verify="required">
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-size" class="layui-form-label ">尺寸
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-size" name="size" autocomplete="off"
                                   class="layui-input" value="${result.size}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-flowId" class="layui-form-label ">工艺流程
                        </label>
                        <div class="layui-input-inline">
                            <select id="js-flowId" name="flowId" lay-filter="flow-filter">
                            </select>
                        </div>
                        <div class=" text-effect flowProcss  " id="js-flowProcess" name="flowProcss">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-is-deleted" class="layui-form-label sp-required">状态
                        </label>
                        <div class="layui-input-block" id="js-is-deleted" style="width: 310px;">
                            <input type="radio" name="deleted" value="0" title="正常"
                                   <#if result.deleted == "0" || !(result??)>checked</#if>>
                            <input type="radio" name="deleted" value="1" title="已删除"
                                   <#if result.deleted == "1">checked</#if>>
                            <input type="radio" name="deleted" value="2" title="已禁用"
                                   <#if result.deleted == "2">checked</#if>>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-hide">
                    <div class="layui-input-block">
                        <input id="js-id" name="id" value="${result.id}"/>
                        <button id="js-submit" class="layui-btn" lay-submit lay-filter="js-submit-filter">确定
                        </button>
                    </div>
                </div>
            </div>

        </form>
    </div>
</div>
<script>
    layui.use(['form', 'util'], function () {
        var form = layui.form,
            util = layui.util;
        var flowRows = [];
        //流程添加下拉框
        getFlowData();
        //物料类型
        getMatTypeData();

        /**
         * 初始化物料类型数据
         */
        function getMatTypeData() {
            spUtil.ajax({
                url: '${request.contextPath}/basedata/dict/list/material_type',
                async: false,
                type: 'GET',
                // 是否显示 loading
                // showLoading: true,
                // 是否序列化参数
                serializable: false,
                // 参数
                data: {},
                success: function (data) {
                    $.each(data.data, function (index, item) {
                        $('#js-matType').append(new Option(item.name, item.value));
                    });
                }
            });

        }


        /**
         * 初始化流程数据
         */
        function getFlowData() {
            spUtil.ajax({
                url: '${request.contextPath}/basedata/flow/list',
                async: false,
                type: 'GET',
                // 是否显示 loading
                showLoading: true,
                // 是否序列化参数
                serializable: false,
                // 参数
                data: {},
                success: function (data) {
                    flowRows = data.data;
                }
            });

            $.each(flowRows, function (index, item) {
                $('#js-flowId').append(new Option(item.flowDesc, item.id));
            });
            //编辑时候根据回显的ID 绘制流程
            flowProssbyId("${result.flowId}")
        }

        //下拉框选择 绘制流程时序图
        form.on('select(flow-filter)', function (data) {
            flowProssbyId(data.value)
        });

        //通过ID 获取流程时序 绘制
        function flowProssbyId(flowId) {
            var newArr = flowRows.filter(function (obj) {
                return obj.id == flowId;
            });
            if (newArr.length > 0) {
                procssArr = newArr[0].process.split("->")
                $("#js-flowProcess").empty();
                $.each(procssArr, function (i, val) {

                    if (i == procssArr.length - 1) {
                        $("#js-flowProcess").append("<span style='display: inline-flex;' >" + val + "</span>");
                    } else {
                        $("#js-flowProcess").append("<span style='display: inline-flex;' >" + val + '->' + "</span>");
                    }
                });
            }
        }

        //给表单赋值
        form.val("formTest", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
            "flowId": "${result.flowId}",
            "matType": "${result.matType}"
        });

        //监听提交
        form.on('submit(js-submit-filter)', function (data) {
            spUtil.submitForm({
                url: "${request.contextPath}/basedata/materile/add-or-update",
                data: data.field
            });
            return false;
        });

    });
</script>
</body>
</html>