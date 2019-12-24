/**
 * date:2019/12/24
 * author:SongPeng
 * description:扩展layui弹出框 框架扩展
 */
layui.define(['layer'], function (exports) {
    var $ = layui.jquery;
    var layer = layui.layer;

    var spLayer = {
        // 渲染弹出框
        open: function (param) {
            console.log(param);
            var config = {};
            $.extend(config, param, {
                // 这里写默认配置，会覆盖自定义配置 param
            });
            layer.open(config);
        }
    };

    exports('spLayer', spLayer);
});
