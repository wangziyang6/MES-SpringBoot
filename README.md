# sp-archetype

#### 介绍

以此项目来进行骨架的生成

#### 软件架构

单体项目生成骨架，具备基本功能，如：后台管理界面，权限认证。

实现功能：

1. 用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2. 机构管理：配置系统组织机构（公司、部门、小组），树结构展现，可随意调整上下级。
3. 区域管理：系统城市区域模型，如：国家、省市、地市、区县的维护。
4. 菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5. 角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6. 字典管理：对系统中经常使用的一些较为固定的数据进行维护，如：是否、男女、类别、级别等。
7. 操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
8. 连接池监视：监视当期系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。
9. 工作流引擎：实现业务工单流转、在线流程设计器。
10. 代码生成工具：实体类、mapper、dao、service、controller
11. Jekins git 自动部署
12. redis
13. 表单重复提交，前后端解决方案
14. 攻击防护（防止伪造身份）
15. 前端工程化：代码打包、压缩、静态文件版本号等

#### 使用注意事项

* 前端
    * 日期工具库：static/lib/dayjs.min.js
    * Javascript 工具库：static/lib/lodash.min.js
    * Layui 树形表格插件
        * https://gitee.com/whvse/treetable-lay
    * 图标库使用
        * http://www.fontawesome.com.cn/faicons/
* 后端
    * Hutool 是一个小而全的Java工具类库，通过静态方法封装，降低相关API的学习成本，提高工作效率，使Java拥有函数式语言般的优雅，让Java语言也可以“甜甜的”。
    * 枚举
        * 公共枚举类：com.songpeng.sparchetype.common.enums.CommonEnum
        * 不同模块下的枚举：如 com.songpeng.sparchetype.system.enums
    * 请求参数
        * 每张表的分页查询参数，严格按照一张表对应一个请求参数对象进行开发，如系统用户分页查询参数：com.songpeng.sparchetype.system.request.SysUserPageReq
        *     
    
#### 安装教程

1. xxxx
2. xxxx
3. xxxx

#### 使用说明

1. xxxx
2. xxxx
3. xxxx

#### 参与贡献

1. Fork 本仓库
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request


#### 码云特技

1. 使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2. 码云官方博客 [blog.gitee.com](https://blog.gitee.com)
3. 你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解码云上的优秀开源项目
4. [GVP](https://gitee.com/gvp) 全称是码云最有价值开源项目，是码云综合评定出的优秀开源项目
5. 码云官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6. 码云封面人物是一档用来展示码云会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)