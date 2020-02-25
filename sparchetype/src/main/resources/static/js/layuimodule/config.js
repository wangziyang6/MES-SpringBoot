/**
 * date:2019/08/16
 * author:Mr.Chung
 * description:此处放layui自定义扩展
 */
window.rootPath = (function (src) {
    src = document.scripts[document.scripts.length - 1].src;
    return src.substring(0, src.lastIndexOf("/") + 1);
})();

layui.config({
    base: rootPath,
    version: true
}).extend({
    // layuimini扩展
    layuimini: "layuimini/layuimini",
    // 分步表单扩展
    step: 'step-lay/step',
    //table树形扩展
    treetable: 'treetable-lay/treetable',
    // table选择扩展
    tableSelect: 'tableSelect/tableSelect',
    // fa图标选择扩展
    iconPickerFa: 'iconPicker/iconPickerFa',
    // echarts图表扩展
    echarts: 'echarts/echarts',
    // echarts图表主题扩展
    echartsTheme: 'echarts/echartsTheme',
    // wangEditor富文本扩展
    wangEditor: 'wangEditor/wangEditor',
    // 自定义layer扩展组件
    splayer: 'splayer/splayer',
    // 自定义table扩展组件
    sptable: 'sptable/sptable',
    // 大气风格的网络公司企业模版
    company: 'company/company'
});