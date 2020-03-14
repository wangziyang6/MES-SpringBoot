/**
 * 宋鹏：layui 自定义组件配置
 */
window.rootPath = (function (src) {
    src = document.scripts[document.scripts.length - 1].src;
    return src.substring(0, src.lastIndexOf("/") + 1);
})();

layui.config({
    base: rootPath,
    version: true
}).extend({
    // layui扩展
    spLayui: "sp/spLayui",
    // 自定义layer扩展组件
    spLayer: 'sp/spLayer',
    // 自定义table扩展组件
    spTable: 'sp/spTable',
    // 自定义table扩展组件
    spSearchPanel: 'sp/spSearchPanel',
    // 大气风格的网络公司企业模版
    spCompany: 'sp/spCompany',
    // 分步表单扩展
    step: 'step-lay/step',
    //table树形扩展
    treeTable: 'treeTable/treeTable',
    // table选择扩展
    tableSelect: 'tableSelect/tableSelect',
    // fa图标选择扩展
    iconPickerFa: 'iconPicker/iconPickerFa',
    // wangEditor富文本扩展
    wangEditor: 'wangEditor/wangEditor'
});