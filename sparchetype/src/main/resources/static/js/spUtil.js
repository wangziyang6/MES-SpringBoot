// 工具类
var spUtil = {};

spUtil.submitForm = function(param) {
    // 默认配置
    var defaultConfig = {
        type: "POST",
        async: true,
        success: function (result) {
            if (result.code === 0) {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //刷新父页面，注意一定要在关闭当前iframe层之前执行刷新
                parent.location.reload();
                //关闭当前frame
                parent.layer.close(index);
            } else {
                layer.alert(result.msg, {
                    icon: 2
                })
            }
        },
        error: function (e) {
            layer.alert(e, {
                icon: 2
            });
        }
    };

    var config = $.extend({}, defaultConfig, param, {
        // 此处写覆盖默认和传参配置
    });

    $.ajax(config);
};

/**
 * 将对象转为url路径字符串参数（编码之后的字符串）
 * @param param
 * @param key
 * @returns {string}
 */
spUtil.parseParam = function (a) {
    var s = [],
        rbracket = /\[\]$/,
        isArray = function (obj) {
            return Object.prototype.toString.call(obj) === '[object Array]';
        },
        add = function (k, v) {
            v = typeof v === 'function' ? v() : v === null ? '' : v === undefined ? '' : v;
            s[s.length] = encodeURIComponent(k) + '=' + encodeURIComponent(v);
        },
        buildParams = function (prefix, obj) {
            var i, len, key;

            if (prefix) {
                if (isArray(obj)) {
                    for (i = 0, len = obj.length; i < len; i++) {
                        if (rbracket.test(prefix)) {
                            add(prefix, obj[i]);
                        } else {
                            buildParams(prefix + '[' + (typeof obj[i] === 'object' ? i : '') + ']', obj[i]);
                        }
                    }
                } else if (obj && String(obj) === '[object Object]') {
                    for (key in obj) {
                        buildParams(prefix + '[' + key + ']', obj[key]);
                    }
                } else {
                    add(prefix, obj);
                }
            } else if (isArray(obj)) {
                for (i = 0, len = obj.length; i < len; i++) {
                    add(obj[i].name, obj[i].value);
                }
            } else {
                for (key in obj) {
                    buildParams(key, obj[key]);
                }
            }
            return s;
        };

    return buildParams('', a).join('&').replace(/%20/g, '+');
};

/**
 * 解析url路径参数为对象
 * @param url
 */
spUtil.parseQueryString = function (url) {
    var obj = {};
    var keyvalue = [];
    var key = "",
        value = "";
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    for (var i in paraString) {
        keyvalue = paraString[i].split("=");
        key = keyvalue[0];
        value = decodeURIComponent(keyvalue[1]);
        obj[key] = value;
    }
    return obj;
};

/**
 * 去除字符串内所有的空格
 * @param str
 */
spUtil.trimAll = function (str) {
    return str ? str.replace(/\s*/g, "") : str;
};

/**
 * 去除字符串内两头的空格
 * @param str
 */
spUtil.trimBothEnds = function (str) {
    return str ? str.replace(/^\s*|\s*$/g, "") : str;
};

/**
 * 去除字符串内左侧的空格
 * @param str
 */
spUtil.trimLeft = function (str) {
    return str ? str.replace(/^\s*/, "") : str;
};

/**
 * 去除字符串内右侧的空格
 * @param str
 */
spUtil.trimRight = function (str) {
    return str ? str.replace(/(\s*$)/g, "") : str;
};