<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>搜索面板</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>

<body>
<div class="splayui-container">
    <div class="splayui-main">
        <!--查询参数-->
        <form id="js-search-form" class="layui-form" lay-filter="js-q-form-filter">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">物料编号</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <input type="text" name="materielLike" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">物料描述</label>
                    <div class="layui-input-inline" style="width: 120px;">
                        <input type="text" name="materielDescLike" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn" lay-submit lay-filter="js-search-filter"><i
                                class="layui-icon layui-icon-search"></i></a>
                </div>
            </div>
        </form>
        <!--表格-->
        <table class="layui-hide" id="js-record-table" lay-filter="js-record-table-filter"></table>

        <form class="layui-form splayui-form">
            <div class="layui-row">
                <div class="layui-form-item layui-hide">
                    <div class="layui-input-block">
                        <input id="js-id" name="id" value=""/>
                        <button id="js-submit" type="button" class="layui-btn" lay-submit lay-filter="js-submit-filter">
                            确定
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'util', 'table', 'spTable'], function () {
        var form = layui.form,
            util = layui.util,
            table = layui.table,
            spTable = layui.spTable;

        // 表格及数据初始化
        var tableIns = spTable.render({
            toolbar: '',
            url: '${request.contextPath}/basedata/materile/page',
            cols: [
                [{
                    type: 'radio'
                }, {
                    field: 'materiel', title: '物料编码'
                }, {
                    field: 'materielDesc', title: '物料描述'
                }]
            ],
            done: function (res, curr, count) {
            }
        });

        /**
         * 搜索按钮事件
         */
        form.on('submit(js-search-filter)', function (data) {
            tableIns.reload({
                where: data.field,
                page: {
                    // 重新从第 1 页开始
                    curr: 1
                }
            });

            // 阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });

        // 监听提交
        form.on('submit(js-submit-filter)', function (data) {
            window.spChildFrameResult = {
                msg: '操作成功',
                code: 0,
                data: table.checkStatus('js-record-table').data,
                isAll: table.checkStatus('js-record-table').isAll
            };
            return false;
        });

        //监听行双击事件
        table.on('rowDouble(js-record-table-filter)', function (obj) {
            //选中radio样式
            obj.tr.find('i[class="layui-anim layui-icon"]').trigger("click");
            parent.layui.$('.layui-layer-btn0').click();
        });
    });

</script>
</body>
</html>