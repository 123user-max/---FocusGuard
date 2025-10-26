# FocusGuard 安装程序制作说明

## 概述
已为FocusGuard项目配置了完整的Inno Setup安装程序配置文件，可以生成专业的Windows安装包。

## 配置文件信息

### 应用程序信息
- **应用名称**: FocusGuard
- **版本**: 1.0.0
- **发布者**: FocusGuard Team
- **主执行文件**: FocusGuardWPF.exe
- **应用描述**: 智能屏幕时间管理应用

### 系统要求
- Windows 10 或更高版本
- 64位系统
- 约150MB磁盘空间

### 安装功能
- ✅ 自动安装所有依赖文件
- ✅ 创建开始菜单快捷方式
- ✅ 可选创建桌面快捷方式（默认选中）
- ✅ 可选开机自启动设置
- ✅ 完整的卸载支持
- ✅ 多语言支持（中文/英文）
- ✅ 智能版本检测和升级

## 使用步骤

### 1. 安装Inno Setup
1. 下载并安装 [Inno Setup 6](https://jrsoftware.org/isdl.php)
2. 确保安装到默认路径：`C:\Program Files (x86)\Inno Setup 6\`

### 2. 编译安装程序
方法一：使用批处理文件（推荐）
```bash
build-installer.bat
```

方法二：手动编译
1. 打开Inno Setup Compiler
2. 打开文件：`inno通用配置文件(制作安装程序).iss`
3. 点击"编译"按钮

### 3. 获取安装包
编译成功后，安装包将生成在：
```
Output/FocusGuard_1.0.0_Setup.exe
```

## 配置文件详解

### 主要配置项
```ini
[Setup]
AppName=FocusGuard
AppVersion=1.0.0
AppPublisher=FocusGuard Team
DefaultDirName={autopf}\FocusGuard
OutputBaseFilename=FocusGuard_1.0.0_Setup
```

### 文件包含
```ini
[Files]
Source: "publish\FocusGuard\FocusGuardWPF.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "publish\FocusGuard\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
```

### 用户选项
- 桌面快捷方式（默认选中）
- 开机自启动（可选）

### 智能功能
- 安装前检测已有版本
- 卸载时自动关闭运行中的程序
- 完整的注册表清理

## 自定义配置

如需修改配置，编辑 `inno通用配置文件(制作安装程序).iss` 文件中的以下部分：

### 修改版本号
```ini
#define MyAppVersion "1.0.0"
```

### 修改发布者信息
```ini
#define MyAppPublisher "FocusGuard Team"
#define MyAppURL "https://github.com/focusguard/focusguard"
```

### 添加图标
```ini
SetupIconFile=icon.ico
UninstallDisplayIcon={app}\{#MyAppExeName}
```

## 注意事项

1. **文件路径**: 确保 `publish\FocusGuard\` 目录存在且包含所有必要文件
2. **权限**: 编译时可能需要管理员权限
3. **杀毒软件**: 某些杀毒软件可能误报，需要添加白名单
4. **测试**: 建议在干净的系统上测试安装包

## 故障排除

### 编译失败
- 检查Inno Setup是否正确安装
- 确认源文件路径是否正确
- 检查文件权限

### 安装失败
- 确认目标系统满足最低要求
- 检查是否有足够的磁盘空间
- 确认没有其他程序占用相关文件

## 版本历史
- v1.0.0: 初始版本，包含完整的安装和卸载功能