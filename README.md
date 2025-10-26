# 🎯 FocusGuard - 智能屏幕时间管理应用

一款功能完整的Windows桌面应用，用于自动追踪、分析和管理屏幕使用时间，帮助用户建立健康的数字生活习惯。

## ✨ 主要功能

### 📊 多页面导航界面
- **仪表盘** - 实时统计和数据概览
- **活动历史** - 详细记录查看和筛选
- **目标设置** - 时间目标和分类限制管理
- **统计报告** - 深度数据分析和排行
- **应用设置** - 全面的配置选项

### ⏱️ 自动时间追踪
- 后台静默运行，2秒间隔精确追踪
- 智能应用分类系统（生产力、开发工具、浏览器等）
- Windows API集成，准确获取窗口信息
- SQLite数据库持久化存储

### 🔔 系统托盘集成
- 最小化到系统托盘
- 右键菜单快速操作
- 状态通知和工具提示
- 双击恢复主窗口

### 🚀 开机自启功能
- Windows注册表集成
- 开机自启时最小化到托盘
- 启动时自动开始追踪
- 智能状态检测和同步

### ⚙️ 设置自动保存
- 设置更改时自动保存
- 500ms防抖机制优化性能
- JSON格式本地存储

## 🛠️ 技术栈

- **框架**: WPF + .NET 8.0
- **架构**: MVVM + 依赖注入
- **数据库**: SQLite
- **日志**: Serilog
- **托盘**: Hardcodet.NotifyIcon.Wpf

## 🚀 快速开始

### 环境要求
- Windows 10/11
- .NET 8.0 SDK

### 运行应用
```bash
# 开发模式运行
./run-focusguard.bat

# 或者直接运行
dotnet run --project FocusGuardWPF/FocusGuardWPF.csproj
```

### 发布应用
```bash
# 发布独立可执行文件
./publish-focusguard.bat

# 或者手动发布
dotnet publish FocusGuardWPF/FocusGuardWPF.csproj --configuration Release --runtime win-x64 --self-contained true --output "publish\FocusGuard"
```

## 📁 项目结构

```
FocusGuardWPF/
├── Models/              # 数据模型
├── Services/            # 业务服务层
├── ViewModels/          # MVVM视图模型
├── Views/Pages/         # 页面视图
├── Styles/              # UI样式资源
├── Converters/          # 数据转换器
└── Resources/           # 应用资源
```

## 📊 数据存储

```
%LOCALAPPDATA%\FocusGuard\
├── focusguard.db          # SQLite数据库
├── settings.json          # 用户设置
└── Logs\                  # 日志文件
```

## 🎯 核心特性

- ✅ 零操作体验（开机自启 + 自动追踪）
- ✅ 多页面现代化界面
- ✅ 完整的数据分析功能
- ✅ 隐私保护（本地存储）
- ✅ 低资源占用
- ✅ 自包含部署

## 📖 文档

- [使用指南](USAGE_GUIDE.md) - 详细的功能说明和使用方法
- [构建指南](BUILD_GUIDE.md) - 开发环境配置和构建说明
- [安装说明](INSTALLATION.md) - 安装和部署指南
- [功能总结](FINAL_SUMMARY.md) - 完整的功能列表和技术架构

## 🤝 贡献

欢迎提交Issue和Pull Request来帮助改进项目。

## 📄 许可证

本项目采用MIT许可证。

---

**让每一分钟都有意义，让专注成为习惯！** 🎯