<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>维护BOM信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <#include "${request.contextPath}/common/common.ftl">
</head>
<body>
<div class="splayui-container">
    <div class="splayui-main">
        <div class="layui-carousel" id="stepForm" lay-filter="stepForm">
            <div carousel-item>
                <div>
                    <form class="layui-form" style="margin: 0 auto;max-width: 460px;padding-top: 40px;">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label for="js-bomCode" class="layui-form-label sp-required">BOM编码
                                </label>
                                <div class="layui-input-inline">
                                    <input type="text" id="js-bomCode" name="bomCode" lay-verify="required"
                                           autocomplete="off"
                                           class="layui-input" value="${result.bomCode}">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="js-materielCode" class="layui-form-label sp-required">物料编码
                            </label>
                            <div style="display: flex;   flex-direction: row;">
                                <button type="button" id="js-test-btn" class="layui-btn" style="height:37px "><i
                                            class="layui-icon layui-icon-search "></i>
                                </button>
                                <input id="js-test-input" name="materielCode" readonly="true" lay-verify="required"
                                       placeholder="搜索物料" autocomplete="off"
                                       value="${result.materielCode}"
                                       class="layui-input" style="width: 133PX">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label for="js-version-number" class="layui-form-label sp-required">版本号
                                </label>
                                <div style="display: flex;   flex-direction: row;">
                                    <input type="text" id="js-versionNumber" readonly="true" name="versionNumber"
                                           lay-verify="required"
                                           autocomplete="off"
                                           class="layui-input"
                                           {value="${result.versionNumber}" | value='1' style=" width: 163PX;" }>
                                    <div style="display: flex;   flex-direction: column;">
                                        <div style="display: flex">
                                            <button onclick="FN('plus')" type="button" style="height: 19PX"
                                                    class="layui-btn  layui-btn-xs"><i
                                                        class="layui-icon layui-icon-up"></i>
                                            </button>
                                        </div>
                                        <div style="display: flex">
                                            <button onclick="FN('minus')" type="button" style="height: 19PX"
                                                    class="layui-btn  layui-btn-xs"><i
                                                        class="layui-icon layui-icon-down"></i>
                                            </button>
                                        </div>
                                    </div>

                                </div>
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
                        <div class="layui-form-item">
                            <label class="layui-form-label">备注说明:</label>
                            <div class="layui-input-block">
                                <textarea placeholder="BOM备注" value="" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn" lay-submit lay-filter="formStep">
                                    &emsp;下一步&emsp;
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div>
                    <form class="layui-form">
                        <div class="layui-form-item">
                            <input id="js-id" name="id" class="layui-hide" value="${result.id}"/>
                            <button type="button" class="layui-btn layui-bg-green  pre" lay-submit
                                    lay-filter="formStep">
                                &emsp;上一步&emsp;
                            </button>
                            <button id="js-submit" class="layui-btn  pre" lay-demotransferactive="getData" lay-submit
                                    lay-filter="js-submit-filter">&emsp;保存&emsp;
                            </button>
                        </div>
                        <div class="layui-form-item">
                            <!--表格-->
                            <table class="layui-hide" id="layTableId" lay-filter="js-record-table-filter"></table>
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<!--表格头操作模板-->
<script type="text/html" id="js-record-table-toolbar-top">
    <div class="layui-btn-container">
        <@shiro.hasPermission name="user:add">
            <div>
                <button type="button" class="layui-btn layui-btn-sm" lay-event="add" title="添加一行">
                    <i class="layui-icon layui-icon-add-1"></i> 添加一行
                </button>
            </div>
        </@shiro.hasPermission>
    </div>
</script>
<!--行操作模板-->
<script type="text/html" id="js-record-table-toolbar-right">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete"><i class="layui-icon layui-icon-delete"></i>删除</a>
</script>

<script>
    layui.use(['form', 'util', 'layer', 'step', 'spLayer', 'spTable', 'table'], function () {
        var form = layui.form,
            spLayer = layui.spLayer,
            layer = layui.layer,
            spTable = layui.spTable,
            table = layui.table,
            step = layui.step;
        //分步表单绘制
        step.render({
            elem: '#stepForm',
            filter: 'stepForm',
            width: '100%', //设置容器宽度
            stepWidth: '700px',
            height: '500px',
            scrollbar:true,
            stepItems: [{
                title: 'BOM主信息'
            }, {
                title: 'BOM子项信息'
            }]
        });

        form.on('submit(formStep)', function (data) {
            step.next('#stepForm');
            return false;
        });

        form.on('submit(formStep2)', function (data) {
            step.next('#stepForm');
            return false;
        });

        $('.pre').click(function () {
            step.pre('#stepForm');
        });

        $('.next').click(function () {
            step.next('#stepForm');
        });
        //监听提交
        form.on('submit(js-submit-filter)', function (data) {
            layer.alert("嘿嘿！！暂时无法保存，开发loading....");
            <#--spUtil.submitForm({-->
            <#--    contentType: 'application/json;charset=UTF-8',-->
            <#--    url: "${request.contextPath}/basedata/flow/process/add-or-update",-->
            <#--    data: data.field-->
            <#--});-->
            return false;
        });
        var layTableId = "layTableId";
        /**
         * 表格绘制
         */
        var tableIns = spTable.render({
            page: true,
            even: false, //不开启隔行背景
            height: 'full-200',
            elem: "#layTableId",
            page: false,
            cols: [[ //标题栏
                {title: '序号', type: 'numbers'}
                , {field: 'LocationID', title: '仓位编码', width: 158, edit: 'text', align: "center"}
                , {field: 'InventoryQuantity', title: '拆分数量', edit: 'text', width: 158, align: "center"}
                ,{field: 'site', title: '位置', edit: 'text', width: 158, align: "center"}
                , {
                    field: 'operate',
                    title: '操作',
                    toolbar: '#js-record-table-toolbar-right',
                    unresize: true,
                    width: 150
                }
            ]],
            data: [{"LocationID": "123", "InventoryQuantity": "0",site:"001"}]
        });
        /**
         * 头工具栏事件
         */
        table.on('toolbar(js-record-table-filter)', function (obj) {
            // 添加一行可编辑数据
            if (obj.event === 'add') {
                var Data = table.cache[layTableId];
                var datas = {}
                Data.push(datas);
                tableIns.reload({
                    data: Data
                });
            }
        });

        /**
         * 监听行工具事件
         */
        table.on('tool(js-record-table-filter)', function (obj) {
            // 编辑
            if (obj.event === 'delete') {
                layer.confirm('确认要删除吗？', function (index) {
                    obj.del();
                    layer.close(index);
                })
            }
        })

        // 物料主数据搜索弹框
        $('#js-test-btn').click(function () {
            searchMaterile();
        });
        /**
         * 物料搜索功能
         * @param obj
         */
        window.searchMaterile = function (obj) {
            spLayer.open({
                type: 2,
                area: ['680px', '500px'],
                reload: false,
                content: '${request.contextPath}/admin/common/ui/searchPanelMaterile',
                // 如果是搜索弹窗，需要添加回调函数来获取选中数据
                spCallback: function (result) {
                    if (result.code === 0 && result.data.length > 0) {
                        $('#js-test-input').val(result.data[0].materiel);
                    }
                }
            });
        }


    });


    //版本号
    function FN(btnType) {
        var versionNumber = $('#js-versionNumber')
        if (btnType == 'plus') {
            versionNumber.val(parseInt(versionNumber.val()) + 1);
        } else if (btnType == 'minus') {

            versionNumber.val(parseInt(versionNumber.val()) - 1);
            if (parseInt(versionNumber.val()) <= 0) {
                versionNumber.val('1')
                layer.alert('版本号最小为1', {
                    icon: 2
                });
            }
        }
    }

</script>
</body>
</html>