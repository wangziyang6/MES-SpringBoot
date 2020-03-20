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
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <form class="layui-form splayui-form" lay-filter="formTest">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
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
                                   class="layui-input" value="${result.unit}">
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
                            <input type="text" id="js-matType" name="matType" lay-verify="required" autocomplete="off"
                                   class="layui-input" value="${result.matType}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="js-size" class="layui-form-label sp-required">尺寸
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-size" name="size" lay-verify="required" autocomplete="off"
                                   class="layui-input" value="${result.size}">
                        </div>
                    </div>
                    <div class="layui-form-item"style="width: 1000px;" >
                        <label for="js-flowId" class="layui-form-label sp-required">工艺流程
                        </label>
                        <div class="layui-input-inline">
                            <select id="js-flowId" name="flowId" lay-filter="flow-filter" lay-verify="required"
                                    value="${result.flowDesc}">
                            </select>
                        </div>
                        <p id="js-flowProcess" style="font-size:23px">测试->dd->dd</p>
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
    </div>
    </form>
</div>
</div>
<script>
    layui.use(['form', 'util'], function () {
        var form = layui.form,
            util = layui.util;
        var flowRows = [];
        getFlowData();
        $.each(flowRows, function (index, item) {
            $('#js-flowId').append(new Option(item.flowDesc, item.id));
        });
        //给表单赋值
        form.val("formTest", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
            "size": "100*100*100",// "name": "value"
            "flowId": 3
        });
//获取表单区域所有值
        var data1 = form.val("formTest");

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
        }

        //下拉框选择 绘制流程时序图
        form.on('select(flow-filter)', function (data) {
            var newArr = flowRows.filter(function (obj) {
                return obj.id == data.value;
            });
            var lb_p = document.getElementById("js-flowProcess");
            lb_p.innerHTML = newArr[0].process;
        });
        //监听提交
        form.on('submit(js-submit-filter)', function (data) {
            spUtil.submitForm({
                url: "${request.contextPath}/admin/sys/role/add-or-update",
                data: data.field
            });

            return false;
        });
    });
</script>
</body>
</html>