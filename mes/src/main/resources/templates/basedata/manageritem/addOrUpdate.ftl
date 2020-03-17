<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加字段</title>
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
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <div class="layui-input-inline layui-hide">
                        <input id="id" name="id" type="text" class="layui-input" >
                    </div>
                    <div id="js-rule-detail-tpl-view" style="">
                    </div>
                </div>
            </div>

            <div class="layui-form-item layui-hide">
                <div class="layui-input-block">
                    <button id="js-submit" class="layui-btn" lay-submit lay-filter="js-submit-filter">确定</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 字段模板 -->
<script id="js-rule-detail-tpl" type="text/html">
    {{#  layui.each(d, function(index, item){ }}
    {{# if(item.mustFill === 'Y'){ }}
    <div class="layui-form-item">
        <label class="layui-form-label sp-required">{{item.fieldDesc}}</label>
        <div class="layui-input-inline">
            <input id="{{item.field}}" name="{{item.field}}"  type="text" class="layui-input " lay-verify="required">
        </div>
    </div>
    {{# } else { }}
    <div class="layui-form-item">
        <label class="layui-form-label ">{{item.fieldDesc}}</label>
        <div class="layui-input-inline">
            <input id="{{item.field}}" name="{{item.field}}" type="text" class="layui-input" lay-verify="">
        </div>
    </div>
    {{# } }}
    {{#  }); }}
</script>
<script>
    layui.use(['form', 'util', 'laytpl'], function () {
        var form = layui.form,
            util = layui.util,
            laytpl = layui.laytpl,
            ruleItemIdArr = [];
        ruleDetailTplDataCopy = [];
        //渲染数据
        ruleDetailRow();

        function ruleDetailRow() {
            // layer.load() 在使用异步请求时起效，如：ajax异步请求、定时器，
            // 但是用ES6的promise不生效，所以此处采用定时器实现
            window.setTimeout(function () {
                var ruleDetailRows;
                spUtil.ajax({
                    url: '${request.contextPath}/basedata/manager/item/by/tableNameId',
                    async: false,
                    type: 'POST',
                    // 是否显示 loading
                    showLoading: true,
                    // 是否序列化参数
                    serializable: false,
                    // 参数
                    data: {
                        tableNameId: '${table.tableNameId}'
                    },
                    success: function (data) {
                        ruleDetailRows = data.data;
                    }
                });
                //打码规则项渲染赋值
                var getTpl = document.getElementById('js-rule-detail-tpl').innerHTML
                    , view = document.getElementById('js-rule-detail-tpl-view');
                laytpl(getTpl).render(ruleDetailRows, function (html) {
                    view.innerHTML = html;
                });
                //解析model面的MAP 赋值给编辑界面
                <#list result as map>
                <#list map?keys as itemKey> //关键点
                $('#' + '${itemKey}').val('${map[itemKey]}');
                </#list>
                </#list>
                form.render();
            }, 100);
        }

        //监听提交
        form.on('submit(js-submit-filter)', function (data) {
            data.field.jsTableName='${table.tableName}'
            data.field.jsTableNameId='${table.tableNameId}'
            spUtil.submitForm({
                url: "${request.contextPath}/basedata/common/add-or-update",
                data: data.field
            });
            return false;
        });

    });
</script>
</body>
</html>