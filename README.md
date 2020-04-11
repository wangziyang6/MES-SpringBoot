# 黑科MES 本人重起了一套springboot 开源框架 代码标准规范化。

## 界面展示
* 演示地址 
* http://wangziyangmes.pzzd.xyz  
用户名admin  密码123
![1](https://s1.ax1x.com/2020/03/18/8d4GQS.gif)

个人设计的MES系统功能架构图[还请各位大佬指点]，该项目的开发规划
![1.1](https://s1.ax1x.com/2020/03/26/GSfGS1.png)


<table style="text-align:center">
    <tr>
        <th bgcolor=#218868 ><font color=#0F0F0F >系统管理</font></th> 
        <th bgcolor=#218868 ><font color=#0F0F0F >工艺管理</font></th> 
        <th bgcolor=#218868 ><font color=#0F0F0F >计划管理</font></th> 
        <th bgcolor=#218868 ><font color=#0F0F0F >物料管理</font></th> 
   </tr>
    <tr >
        <td bgcolor=#C6E2FF ><font color=#EE0000 >*用户管理*</font></td>
        <td bgcolor=#C6E2FF><font color=#EE0000 >*工艺路线管理*</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >工单下达</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >物料出入库</font></td>
   </tr>
 <tr>
        <td bgcolor=#D1D1D1><font color=#EE0000 >*组织管理*</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >MOM管理</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >工序工单分解</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >智能货架</font></td>
   </tr>
   <tr>
        <td bgcolor=#C6E2FF><font color=#EE0000 >*菜单管理*</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >BOM管理</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >工单流程变更</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >物料标签管理</font></td>
       
   </tr>
    <tr>
        <td bgcolor=#D1D1D1><font color=#EE0000 >*基础数据维护*</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >SOP管理</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >工单锁定</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >AGV+WCS</font></td>
   </tr>
    <tr>
        <td bgcolor=#C6E2FF><font color=#EE0000 >*基础数据配置*</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >其他工艺文件</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >工单特殊设置</font></td>
        <td bgcolor=#C6E2FF><font color=#EE0000 >*物料基础数据*</font></td>
       
   </tr>
    
  
</table>


--------------------------


<table style="text-align:center">
    <tr>
        <th bgcolor=#218868 ><font color=#0F0F0F >设备管理</font></th> 
        <th bgcolor=#218868 ><font color=#0F0F0F >SN码管理</font></th> 
        <th bgcolor=#218868 ><font color=#0F0F0F >在制品管理</font></th> 
        <th bgcolor=#218868 ><font color=#0F0F0F >质量管理</font></th> 
   </tr>
    <tr>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >设备档案</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >SN码规则管理</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >工序过站</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >IOC</font></td>
       
   </tr>
 <tr>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >设备维修保养</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >分配SN管理</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >在线维修管理</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >OQC</font></td>
   </tr>
    <tr>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >设备出入库</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >SN标签+打印</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >自动化对接</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >FQC</font></td>
       
   </tr>
 <tr>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >设备稼动率</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F ></font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >SN返工管理</font></td>
        <td bgcolor=#D1D1D1><font color=#0F0F0F >质检项维护</font></td>
   </tr>
    <tr>
        <td bgcolor=#C6E2FF style="text-align:left"><font color=#0F0F0F >说明：</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F ></font></td>
        <td bgcolor=#C6E2FF><font color=#EE0000 >*完成</font></td>
        <td bgcolor=#C6E2FF><font color=#0F0F0F >未开发</font></td>
       
   </tr>
</table>

 ## MOM平台规划
![1.](https://s1.ax1x.com/2020/04/11/GHGLcV.jpg)

## ISA-95 层级
![1.0](https://s1.ax1x.com/2020/04/03/GN9vid.png)

 四大类: 资源、能力、产品定义和生产计划
 
 九大模型
 * 人力资源模型
 * 设备资源模型
 * 材料资源模型
 * 过程段模型(过程端模型，过程能力模型)
 * 生产能力模型
 * 产品定义模型
 * 生产计划模型
 * 生产性能模型
 
![1.0](https://s1.ax1x.com/2020/04/03/GN9aVg.png)

登录界面[MES]
![1.1](https://s2.ax1x.com/2020/03/06/3bQLqI.png)


数字化平台 echarts
![1.1.2](https://s1.ax1x.com/2020/03/23/8o7wbq.png)
### 功能界面
* 主数据展示
![1.1.3](https://s2.ax1x.com/2020/03/11/8AMcA1.png)
* 工艺路线界面
![1.1.4](https://s1.ax1x.com/2020/03/16/8GOl28.png)

* 物料维护界面
![1.1.5](https://s1.ax1x.com/2020/03/23/8HrLin.png)

* BOM维护界面
![1.1.6](https://s1.ax1x.com/2020/04/09/G4yQMt.png)

### swaggerAPI管理界面
![2](https://s2.ax1x.com/2020/03/06/3qC4Yt.png)
## 技术架构

### springBoot+mybatis-plus+redis+shiro+hutool+layui+swagger+freemarker+mysql8+echarts
### jenkins+docker+nginx

## MES个人笔记

[MES笔记有道云](http://note.youdao.com/noteshare?id=3d843775354cc7a503ad247a29997848)

## 部署云平台 使用阿里云 （https://www.aliyun.com）
实现功能：
1. 用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2. 主数据管理：动态配置表以及所需要显示的字段，只需要简单维护既可以完成增删改成操作。
3. 赋码管理：动态配置码规则项。例如6位年月日 3位，流水号，随机号。根据用户配置自动创建SN。
4. 菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5. 角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6. 字典管理：对系统中经常使用的一些较为固定的数据进行维护，如：是否、男女、类别、级别等。
7. 物料进出管理：包含物料叫料，配料，发料，确认收料，上料
8. 工单管理：工单下达，工单分解，工单状态调整，工单特殊设置
9. 在制品管理：过站工序记录，数据绑定成箱成剁
10. 质量管理： 质检项维护，根据物料或者型号管理质检项目。检验页面，抽检确认
11. 工艺文件管理 ：工艺参数，BOM文件，导入导出
12. 报表：图形化展示
13. 设备管理： 设备信息录入，使用记录，设备台账，设备维保
14. 操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
15. 连接池监视：监视当期系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。
16. 工作流引擎：实现业务工单流转、在线流程设计器。
17. 数字化平台：支撑数据展示，定时动态刷新数据。热部署（SQL视图）

#### 使用注意事项
* 前端
    * 日期工具库：static/lib/dayjs.min.js
    * Javascript 工具库：static/lib/lodash.min.js
    * Layui 树形表格插件
        * https://gitee.com/whvse/treetable-lay
    * 图标库使用
        * http://www.fontawesome.com.cn/faicons
    * echart
        * https://www.echartsjs.com/zh/api.html#echarts    
    * 发送 Ajax 示例：[详情](./docs/ajax.md)
    * FreeMarker 文档：[详情](./docs/FreeMarker.md)
    * Layui 自定义组件 spLayer：[详情](./docs/spLayer.md)
    * Layui 自定义组件 spTable：[详情](./docs/spTable.md)
    * 下拉框 初始化数据： [详情](./docs/layuiSelect.md)
* 后端 
    * Hutool 是一个小而全的Java工具类库，通过静态方法封装，降低相关API的学习成本，提高工作效率，使Java拥有函数式语言般的优雅，让Java语言也可以“甜甜的”。
    * 枚举
        * 公共枚举类：CommonEnum
        * 不同模块下的枚举：如 com.songpeng.sparchetype.system.enums
    * 请求参数
        * 每张表的分页查询参数，严格按照一张表对应一个请求参数对象进行开发，如系统用户分页查询参数：SysUserPageReq
# 总结
欢迎想一起开发的小伙伴。。此项目也支持大学生毕业设计。
# MES国际
[![MES](https://s1.ax1x.com/2020/04/10/GIRPEt.png "MESA认证")](http://www.mesa.org/)
[![synfactory](https://s1.ax1x.com/2020/04/11/GHrk01.png "synf官服资料")](https://www.syntropicfactory.com/)

## QQ Group87652870
[![QQ](https://img.shields.io/badge/QQ-87652870-green.svg?logo=tencent%20qq&logoColor=red)](https://jq.qq.com/?_wv=1027&k=55NGCxl)

## 特别鸣谢
<a href="https://gitee.com/iamsongpeng" target="_blank">**宋鹏同学**</a> 感谢提供前端技术支持！

[![MES-智能制造/MES-Springboot](https://gitee.com/wangziyangyang/MES-Springboot/widgets/widget_card.svg?colors=393222,ebdfc1,fffae5,d8ca9f,393222,a28b40)](https://gitee.com/wangziyangyang/MES-Springboot)