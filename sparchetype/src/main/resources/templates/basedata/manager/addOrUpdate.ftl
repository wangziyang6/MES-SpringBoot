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
                    <div class="layui-form-item">
                        <label for="js-name" class="layui-form-label sp-required">表名称
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-name" name="tableName" lay-verify="required" autocomplete="off"
                                   class="layui-input" value="${result.tableName}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-descr" class="layui-form-label sp-required">业务描述</label>
                        <div class="layui-input-inline">
                            <input type="text" id="js-descr" name="tableDesc" lay-verify="" autocomplete="off"
                                   class="layui-input" value="${result.tableDesc}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="js-is-deleted" class="layui-form-label sp-required">状态</label>
                        <div class="layui-input-block" id="js-is-deleted">
                            <input type="radio" name="isDeleted" value="0" title="正常"
                                   <#if result.isDeleted == "0" || !(result??)>checked</#if>>
                            <input type="radio" name="isDeleted" value="1" title="删除"
                                   <#if result.isDeleted == "1">checked</#if>>
                            <input type="radio" name="isDeleted" value="2" title="禁用"
                                   <#if result.isDeleted == "2">checked</#if>>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                    <div class="box-between">
                        <div class="box-between-item">
                            <label class="layui-form-label" style="width: 120px;">
                                表字段(共 <span id="js-item-count">0</span> 项)
                            </label>
                            <div class="layui-input-inline" style="width: 100px;">
                                <p id="js-process-package-name" style="line-height: 40px;"></p>
                            </div>
                        </div>
                        <div class="box-between-item">
                            <div style="margin: 4px 20px 0px 0px;">
                                <button id="js-rule-item-add" type="button"
                                        class="layui-btn layui-btn-normal layui-btn-xs" style="color: #fff">
                                    <i class="layui-icon layui-icon-add-circle" style="margin-right: 0px;"></i>
                                </button>
                                <button id="js-rule-item-del" type="button"
                                        class="layui-btn layui-btn-normal layui-btn-xs" style="color: #fff">
                                    <i class="layui-icon layui-icon-delete" style="margin-right: 0px;"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div id="js-rule-detail-tpl-view" style="margin: 15px 0px 30px 0px;">
                    </div>
                </div>
                <div class="layui-form-item layui-hide">
                    <div class="layui-input-block">
                        <input id="js-id" name="id" value="${result.id}"/>
                        <button id="js-submit" class="layui-btn" lay-submit lay-filter="js-submit-filter">确定</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!--每次模板生成代码的临时存放容器，生成后添加到id=js-rule-detail-tpl-view的容器后面-->
<div class="layui-hide">
    <div id="js-rule-detail-tpl-view-temp"></div>
</div>

<!-- 字段模板 -->
<script id="js-rule-detail-tpl" type="text/html">
    <div id="js-rule-item-{{d.inputId}}" class="layui-form-item">
        <div class="layui-input-inline" style="width: 20px; margin-right: 15px; margin-left: 75px;">
            <input type="checkbox" name="delFlag" value="{{d.inputId}}" lay-skin="primary" title=""
                   style="margin-top: 0px;">
        </div>
        <label class="layui-form-label layui-form-label-per" style="width: 58px !important;">字段名称</label>
        <div class="layui-input-inline" style="width: 150px;">
            <select id="js-rule-item-type-{{d.inputId}}" data-input-id="{{d.inputId}}" lay-verify="required">
                <option value="">请选择</option>
                {{# layui.each(d.ruleItems, function(index, item){ }}
                <option value="{{item.field}}">{{item.field}}</option>
                {{# }); }}
            </select>
        </div>
        <label class="layui-form-label layui-form-label-per" style="width: 58px !important">显示名称</label>
        <div class="layui-input-inline" style="width: 100px;margin-right: 2px;">
            <input id="js-field-desc-{{d.id}}" name="field-desc-{{d.id}}" type="text" class="layui-input" lay-verify="required">
        </div>
        <div id="js-rule-detail-item-tpl-view-{{d.inputId}}">
        </div>
    </div>
</script>

<!-- 打码规则项input模板 -->
<script id="js-rule-detail-item-tpl" type="text/html">
    <label class="layui-form-label layui-form-label-per" style="width: 60px;">是否必填</label>
    <div class="layui-input-inline" style="width: 80px;margin-right: 2px;">
        <select id="js-name-{{d.id}}" name="name-{{d.id}}" lay-verify="required">
            <option value="">请选择</option>
            <option value="Y">是</option>
            <option value="N">否</option>
        </select>
    </div>
</script>
<script>
    layui.use(['form', 'util', 'laytpl'], function () {
        var form = layui.form,
            util = layui.util,
            laytpl = layui.laytpl,
            ruleDetailTplData = {},
            ruleItemIdArr = [];

        //失去焦点时判断值为空不验证，一旦填写必须验证
        $('input[name="email"]').blur(function () {
            //这里是失去焦点时的事件
            if ($('input[name="email"]').val()) {
                $('input[name="email"]').attr('lay-verify', 'email');
            } else {
                $('input[name="email"]').removeAttr('lay-verify');
            }
        });

        //监听提交
        form.on('submit(js-submit-filter)', function (data) {
            var requestParmaArr = [];
            $.each(ruleItemIdArr, function (index, item) {
                requestParmaArr.push({
                    field: $('#js-name-' + item).val(),
                    isdd: $('#js-rule-item-type-' + item).val(),
                    fieldDesc: $('#js-field-desc-' + item).val()
                });
            });
            data.field.spTableManagerItems = requestParmaArr;
            return false;
            spUtil.submitForm({
                url: "${request.contextPath}/basedata/manager/add-or-update",
                data: data.field
            });

            return false;
        });

        /**
         * 添加规则项事件
         */
        $('#js-rule-item-add').click(function () {
            if (!$('#js-name').val()) {
                layer.alert('表名称不能为空', {
                    icon: 2
                })
                return;
            }
            ruleDetailTplData.ruleItems = ruleDetailTplData.ruleItems ? ruleDetailTplData.ruleItems : addBindData();
            if (!ruleDetailTplData.ruleItems) {
                return;
            }
            addRuleDetail();
            updItemCount();
        });

        function addBindData() {
            var ajaxResult;
            spUtil.ajax({
                url: '${request.contextPath}/basedata/manager/by/tableName',
                async: false,
                type: 'POST',
                // 是否显示 loading
                showLoading: true,
                // 是否序列化参数
                serializable: false,
                // 参数
                data: {
                    tableName: $('#js-name').val()
                },
                success: function (data) {
                    ajaxResult = data.data;
                }
            });
            return ajaxResult;
        }

        /**
         * 删除规则项事件
         */
        $('#js-rule-item-del').click(function () {
            //获取表单区域所有值
            $("input:checkbox[name='delFlag']:checked").each(function (i) {
                var ruleItemIdArrIndex = ruleItemIdArr.indexOf($(this).val());
                if (ruleItemIdArrIndex > -1) {
                    ruleItemIdArr.splice(ruleItemIdArrIndex, 1);
                }
                $('#js-rule-item-' + $(this).val()).remove();
            });
            updItemCount();
        });

        /**
         * 添加规则详情
         */
        function addRuleDetail() {
            //获取表单区域所有值，若有选中，则向最后一个选择项后面添加
            var selInputId = '';
            $("input:checkbox[name='delFlag']:checked").each(function (i) {
                selInputId = $(this).val();
            });

            var inputId = spUtil.genNonDuplicateID();
            ruleDetailTplData.inputId = inputId;
            ruleItemIdArr.push(inputId);
            var getTpl = document.getElementById('js-rule-detail-tpl').innerHTML,
                tplView = document.getElementById('js-rule-detail-tpl-view-temp');
            laytpl(getTpl).render(ruleDetailTplData, function (html) {
                tplView.innerHTML = html;
            });
            if (selInputId) {
                $('#js-rule-item-' + selInputId).after(tplView.innerHTML);
            } else {
                $('#js-rule-detail-tpl-view').append(tplView.innerHTML);
            }
            tplView.innerHTML = '';

            createItemDetail(inputId);

            //重新渲染 固定写法
            form.render();
            return inputId;
        }

        function createItemDetail(inputId) {
            // 动态创建打码规则项input
            var getTpl = document.getElementById('js-rule-detail-item-tpl').innerHTML,
                tplView = document.getElementById('js-rule-detail-item-tpl-view-' + inputId);
            laytpl(getTpl).render({id: inputId}, function (html) {
                tplView.innerHTML = html;
            });
        }

        /**
         * 计算规则项数量
         */
        function updItemCount() {
            $('#js-item-count').html(ruleItemIdArr.length);
        }
    });
</script>
</body>
</html>