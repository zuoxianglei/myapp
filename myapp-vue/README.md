## renren-fast-vue
- renren-fast-vue基于vue、element-ui构建开发，实现后台管理前端功能，提供一套更优的前端解决方案
- 前后端分离，通过token进行数据交互，可独立部署
- 主题定制，通过scss变量统一一站式定制
- 动态菜单，通过菜单管理统一管理访问路由
- 数据切换，通过mock配置对接口数据／mock模拟数据进行切换
- 发布时，可动态配置CDN静态资源／切换新旧版本
- 演示地址：账号密码：admin/admin

## 功能
- 登录/退出 (接口数据交互)
- 管理员列表 (接口数据交互)
- 角色管理 (接口数据交互)
- 菜单管理 (接口数据交互)
- SQL监控 (接口数据交互)
- 定时任务 (接口数据交互)
- 参数管理 (接口数据交互)
- 文件上传 (接口数据交互)
- 系统日志 (接口数据交互)
- 前后端分离，通过token进行数据交互，可独立部署
- 主题定制，通过scss变量统一一站式定制
- 动态菜单，通过菜单管理统一管理访问路由
- 数据切换，通过mock配置对接口数据／mock模拟数据进行切换
- 发布时，可动态配置CDN静态资源／切换新旧版本

## 目录结构

├── dist                       // 构建打包生成部署文件
│   ├── 1805021549             // 静态资源（18年05月03日15时49分）
│   ├── config                 // 配置
│   ├── index.html             // index.html入口
├── build                      // 构建相关
├── config                     // 构建配置相关
├── src                        // 源代码
│   ├── assets                 // 静态资源
│   ├── components             // 全局公用组件
│   ├── element-ui             // element-ui组件配置
│   ├── element-ui-theme       // element-ui组件主题配置
│   ├── icons                  // 所有 svg icons
│   ├── mock                   // mock 模拟数据
│   ├── router                 // 路由
│   ├── store                  // 全局 store管理
│   ├── utils                  // 全局公用方法
│   ├── views                  // view
│   ├── App.vue                // 入口组件
│   ├── main.js                // 入口
├── static                     // 第三方不打包资源
│   ├── config                 // 全局变量配置
│   ├── plugins                // 插件
├── .babelrc                   // babel-loader 配置
├── eslintrc.js                // eslint 配置项
├── .gitignore                 // git 忽略项
├── favicon.ico                // favicon图标
├── index.html                 // html模板
└── package.json               // package.json

## 打包 & 发布
构建生成的资源文件保存在/dist目录下，可通过config/index.js目录文件修改相关配置信息

### 构建生产环境(默认)
npm run build

### 构建测试环境
npm run build --qa

### 构建验收环境
npm run build --uat

### 构建生产环境
npm run build --prod


## 说明文档
```
# 安装依赖
# 使用淘宝镜像源进行依赖安装，解决国内下载缓慢的问题(出现警告可以忽略)
npm install --registry=https://registry.npm.taobao.org

# 指定node-sass的国内镜像源
npm i node-sass --sass_binary_site=https://npm.taobao.org/mirrors/node-sass

# 启动服务
npm run dev
```

