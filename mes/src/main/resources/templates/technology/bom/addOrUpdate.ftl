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
                            <label for="js-bomCode" class="layui-form-label sp-required">物料编码
                            </label>
                            <div  style="display: flex;   flex-direction: row;">
                            <button type="button" id="js-test-btn" class="layui-btn" style="height:37px "><i class="layui-icon layui-icon-search "></i>
                            </button>
                                <input id="js-test-input" placeholder="搜索物料" autocomplete="off" value=""
                                       class="layui-input" style="width: 133PX">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label for="js-bomCode" class="layui-form-label sp-required">版本号
                                </label>
                                <div class="layui-input-inline">
                                    <input type="text" id="js-bomCode" name="bomCode" lay-verify="required"
                                           autocomplete="off"
                                           class="layui-input" value="${result.bomCode}">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">备注说明:</label>
                            <div class="layui-input-block">
                                <textarea placeholder="入款备注" value="" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formStep">
                                    &emsp;下一步&emsp;
                                </button>
                            </div>
                        </div>
                    </form>

                </div>
                <div>
                    <form class="layui-form" style="margin: 0 auto;max-width: 460px;padding-top: 40px;">
                        <div class="layui-form-item">
                            <label class="layui-form-label">游戏ID:</label>
                            <div class="layui-input-block">
                                <div class="layui-form-mid layui-word-aux">639537</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">账户余额:</label>
                            <div class="layui-input-block">
                                <div class="layui-form-mid layui-word-aux">3000 元（保险箱：1000，现金：2000）</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">入款金额:</label>
                            <div class="layui-input-block">
                                <div class="layui-form-mid layui-word-aux">
                                    <span style="font-size: 18px;color: #333;">1800 元</span>
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">入款类型:</label>
                            <div class="layui-input-block">
                                <div class="layui-form-mid layui-word-aux">保险箱</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">入款方式:</label>
                            <div class="layui-input-block">
                                <div class="layui-form-mid layui-word-aux">人工入款</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">备注说明:</label>
                            <div class="layui-input-block">
                                <div class="layui-form-mid layui-word-aux">备注说明</div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn layui-bg-green layui-btn-primary pre" lay-submit
                                        lay-filter="formStep">
                                    &emsp;上一步&emsp;
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'util', 'layer','step', 'spLayer'], function () {
        var form = layui.form,
            spLayer = layui.spLayer,
            layer = layui.layer,
            step = layui.step;

        step.render({
            elem: '#stepForm',
            filter: 'stepForm',
            width: '100%', //设置容器宽度
            stepWidth: '700px',
            height: '500px',
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
            data.field.spOperVoList = requestParmaArr;
            spUtil.submitForm({
                contentType: 'application/json;charset=UTF-8',
                url: "${request.contextPath}/basedata/flow/process/add-or-update",
                data: JSON.stringify(data.field)
            });
            return false;
        });


        // 测试搜索弹框
        $('#js-test-btn').click(function () {
            var index = spLayer.open({
                type: 2,
                area: ['680px', '500px'],
                reload: false,
                content: '${request.contextPath}/admin/common/ui/spSearchPanel4SysUser',
                // 如果是搜索弹窗，需要添加回调函数来获取选中数据
                spCallback: function (result) {
                    console.log(result)
                    if (result.code === 0 && result.data.length > 0) {
                        $('#js-test-input').val(result.data[0].name);
                    }
                }
            });
        });

    });

</script>
</body>
</html>