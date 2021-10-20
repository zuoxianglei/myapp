## renren-fast-vue
- renren-fast-vue基于vue、element-ui构建开发，实现[renren-fast](https://gitee.com/renrenio/renren-fast)后台管理前端功能，提供一套更优的前端解决方案
- 前后端分离，通过token进行数据交互，可独立部署
- 主题定制，通过scss变量统一一站式定制
- 动态菜单，通过菜单管理统一管理访问路由
- 数据切换，通过mock配置对接口数据／mock模拟数据进行切换
- 发布时，可动态配置CDN静态资源／切换新旧版本
- 演示地址：[http://demo.open.renren.io/renren-fast](http://demo.open.renren.io/renren-fast) (账号密码：admin/admin)


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

