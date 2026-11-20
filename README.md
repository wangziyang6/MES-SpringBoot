# MES-SpringBoot

> 基于 ISA-95 标准的 MES/MOM 制造执行系统，面向数字化工厂与智能制造场景。
>
> 采用 Spring Boot + MyBatis-Plus + Shiro + Redis 技术栈，前端基于 Layui + ECharts，开箱即用。

---

## 快速开始

### 环境要求

| 组件 | 版本要求 |
|------|---------|
| JDK | 1.8+ |
| Maven | 3.5+ |
| MySQL | 8.0+ |
| Redis | 5.0+ |

### 三步启动

**1. 初始化数据库**

```bash
# 创建数据库
mysql -u root -p -e "CREATE DATABASE sparchetype DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"

# 导入初始化脚本（按日期顺序执行）
mysql -u root -p sparchetype < scripts/sql/MySQL-sparchetype_20200326.sql
mysql -u root -p sparchetype < scripts/sql/MySQL-sparchetype_20200330.sql
```

**2. 修改配置**

编辑 `mes/src/main/resources/application-dev.yml`，将数据库和 Redis 连接信息改为你的本地环境：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/sparchetype?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Hongkong
    username: your_username
    password: your_password
  redis:
    host: localhost
    port: 6379
```

**3. 编译运行**

```bash
cd mes
./mvnw clean package -DskipTests
java -jar target/mes-1.0.0.jar
```

浏览器访问 **http://localhost:9090**，使用默认账号登录：

| 字段 | 值 |
|------|----|
| 用户名 | `admin` |
| 密码 | `123` |

---

## 在线演示

- **演示地址**：http://wangziyangmes.pzzd.xyz
- **账号**：`admin` / **密码**：`123`

> ⚠️ 演示地址由社区维护，可能存在间歇性不可用的情况。

---

## 功能架构

系统功能覆盖 ISA-95 标准的核心域，分为四大模块：

| 系统管理 | 工艺管理 | 计划管理 | 物料管理 |
|---------|---------|---------|---------|
| ✅ 用户管理 | ✅ 工艺路线管理 | 工单下达 | 物料出入库 |
| ✅ 组织管理 | MOM 管理 | 工序工单分解 | 智能货架 |
| ✅ 菜单管理 | BOM 管理 | 工单流程变更 | 物料标签管理 |
| ✅ 基础数据维护 | SOP 管理 | 工单锁定 | AGV + WCS |
| ✅ 基础数据配置 | 其他工艺文件 | 工单特殊设置 | ✅ 物料基础数据 |

| 设备管理 | SN 码管理 | 在制品管理 | 质量管理 |
|---------|----------|-----------|---------|
| 设备档案 | SN 码规则管理 | 工序过站 | IOC |
| 设备维修保养 | 分配 SN 管理 | 在线维修管理 | OQC |
| 设备出入库 | SN 标签 + 打印 | 自动化对接 | FQC |
| 设备稼动率 | | SN 返工管理 | 质检项维护 |

> **图例**：✅ 已完成 · 未标注为开发中 / 待规划

### MOM 平台规划

![MOM 平台规划](https://s1.ax1x.com/2020/04/11/GHGLcV.jpg)

### ISA-95 层级与模型

系统参照 ISA-95 国际标准设计，涵盖四大类（资源、能力、产品定义、生产计划）与九大模型：

- 人力资源模型
- 设备资源模型
- 材料资源模型
- 过程段模型（过程端模型、过程能力模型）
- 生产能力模型
- 产品定义模型
- 生产计划模型
- 生产性能模型

---

## 功能截图

### 登录界面

![登录界面](https://s2.ax1x.com/2020/03/06/3bQLqI.png)

### 数字化平台（ECharts 可视化）

> 数字化平台界面截图待补充。


### 主数据展示

![主数据展示](https://s2.ax1x.com/2020/03/11/8AMcA1.png)

### Swagger API 管理

![Swagger API 管理](https://s2.ax1x.com/2020/03/06/3qC4Yt.png)

---

## 功能清单

| # | 模块 | 说明 |
|---|------|------|
| 1 | 用户管理 | 系统操作者配置与权限分配 |
| 2 | 主数据管理 | 动态配置表及显示字段，低代码完成增删改查 |
| 3 | 赋码管理 | 动态配置 SN 码规则（年月日、流水号、随机号），自动创建 SN |
| 4 | 菜单管理 | 配置系统菜单、操作权限、按钮权限标识 |
| 5 | 角色管理 | 角色菜单权限分配，按机构进行数据范围权限划分 |
| 6 | 字典管理 | 维护固定数据（是否、男女、类别、级别等） |
| 7 | 物料进出管理 | 物料叫料、配料、发料、确认收料、上料全流程 |
| 8 | 工单管理 | 工单下达、分解、状态调整、特殊设置 |
| 9 | 在制品管理 | 过站工序记录，数据绑定成箱成垛 |
| 10 | 质量管理 | 质检项维护、按物料/型号管理质检项目、抽检确认 |
| 11 | 工艺文件管理 | 工艺参数、BOM 文件导入导出 |
| 12 | 报表 | ECharts 图形化展示 |
| 13 | 设备管理 | 设备信息录入、使用记录、设备台账、维保管理 |
| 14 | 操作日志 | 系统正常操作日志与异常信息日志的记录和查询 |
| 15 | 连接池监控 | 监控数据库连接池状态，分析 SQL 性能瓶颈 |
| 16 | 工作流引擎 | 业务工单流转、在线流程设计器 |
| 17 | 数字化平台 | 数据展示与定时刷新，支持热部署（SQL 视图） |

---

## 技术架构

### 后端

| 技术 | 说明 |
|------|------|
| Spring Boot 2.1.7 | 应用框架 |
| MyBatis-Plus 3.1.2 | ORM 框架 |
| Druid | 数据库连接池 |
| Redis | 缓存与会话管理 |
| Apache Shiro | 权限安全框架 |
| Hutool | Java 工具类库 |
| Swagger | API 文档管理 |
| FreeMarker | 模板引擎 |
| MySQL 8.0 | 关系型数据库 |
| Ehcache | 本地缓存 |

### 前端

| 技术 | 说明 |
|------|------|
| Layui | UI 框架 |
| ECharts | 数据可视化 |
| Lodash | JavaScript 工具库 |
| Day.js | 日期处理库 |
| Font Awesome 4.7 | 图标库 |

### DevOps

| 技术 | 说明 |
|------|------|
| Jenkins | CI/CD |
| Docker | 容器化部署 |
| Nginx | 反向代理 |

---

## 项目结构

```
mes/
├── src/main/java/com/wangziyang/mes/
│   ├── system/          # 系统管理（用户、角色、菜单、权限、Shiro 安全、Swagger）
│   ├── basedata/        # 主数据管理（物料、动态表管理）
│   ├── technology/      # 工艺管理（BOM、工艺路线）
│   ├── digitization/    # 数字化平台（数据可视化）
│   └── common/          # 公共模块（枚举、工具类、全局配置）
├── src/main/resources/
│   ├── application.yml          # 主配置
│   ├── application-dev.yml      # 开发环境
│   ├── application-pro.yml      # 生产环境
│   ├── mapper/                  # MyBatis XML 映射
│   ├── templates/               # FreeMarker 模板
│   └── static/                  # 静态资源（Layui、ECharts 等）
├── src/main/docker/Dockerfile   # Docker 构建文件
└── pom.xml
scripts/
└── sql/                 # 数据库初始化脚本
docs/                    # 开发文档（Ajax、FreeMarker、Layui 组件等）
```

---

## 开发指南

### 前端

- **日期工具库**：`static/lib/dayjs.min.js`
- **JavaScript 工具库**：`static/lib/lodash.min.js`
- **Layui 树形表格插件**：[treetable-lay](https://gitee.com/whvse/treetable-lay)
- **图标库**：[Font Awesome](http://www.fontawesome.com.cn/faicons)
- **ECharts 文档**：[echartsjs.com](https://www.echartsjs.com/zh/api.html#echarts)

更多前端开发文档：

- [Ajax 请求示例](./docs/ajax.md)
- [FreeMarker 文档](./docs/FreeMarker.md)
- [Layui 自定义组件 spLayer](./docs/spLayer.md)
- [Layui 自定义组件 spTable](./docs/spTable.md)
- [下拉框初始化数据](./docs/layuiSelect.md)

### 后端

- **工具库**：[Hutool](https://hutool.cn) — 通过静态方法封装，降低 API 学习成本
- **枚举规范**：
  - 公共枚举类：`CommonEnum`
  - 模块枚举：如 `com.songpeng.sparchetype.system.enums`
- **请求参数规范**：每张表的分页查询参数严格对应一个请求参数对象，如 `SysUserPageReq`

---

## 部署

### Docker 部署

```bash
cd mes
./mvnw clean package -DskipTests
docker build -f src/main/docker/Dockerfile -t mes-springboot:1.0.0 .
docker run -d -p 80:80 mes-springboot:1.0.0
```

### 相关文档

- [Java 安装指南](./docs/java安装.md)
- [Maven 安装指南](./docs/maven.md)
- [Jenkins CI 配置](./docs/jenkins.md)
- [安全配置](./docs/security.md)

---

## 参考资源

- **MES 笔记**：[有道云笔记](http://note.youdao.com/noteshare?id=3d843775354cc7a503ad247a29997848)
- **MESA 国际认证**：

[![MESA 认证](https://s1.ax1x.com/2020/04/10/GIRPEt.png "MESA")](http://www.mesa.org/)

- **Synfactory 官方资料**：

[![Synfactory](https://s1.ax1x.com/2020/04/11/GHrk01.png "synf")](https://www.syntropicfactory.com/)

---

## 社区与交流

- **QQ 群**：87652870

[![QQ 群](https://img.shields.io/badge/QQ-87652870-green.svg?logo=tencent%20qq&logoColor=red)](https://jq.qq.com/?_wv=1027&k=55NGCxl)

- **Gitee 镜像**：

[![MES-智能制造/MES-Springboot](https://gitee.com/wangziyangyang/MES-Springboot/widgets/widget_card.svg?colors=393222,ebdfc1,fffae5,d8ca9f,393222,a28b40)](https://gitee.com/wangziyangyang/MES-Springboot)

---

## 致谢

- **[宋鹏](https://gitee.com/iamsongpeng)** — 感谢提供前端技术支持

---

## License

本项目基于 [LICENSE](./LICENSE) 开源协议发布。

欢迎志同道合的开发者参与共建，项目也支持大学生毕业设计使用。
