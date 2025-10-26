# FocusGuard 构建指南

## 前置要求

### 必需软件
1. **Visual Studio 2022** (推荐) 或 **Visual Studio Code**
2. **.NET 8.0 SDK** - [下载地址](https://dotnet.microsoft.com/download/dotnet/8.0)
3. **Windows App SDK 1.4** - 通过Visual Studio Installer安装
4. **Windows 10 SDK** (版本 10.0.19041.0 或更高)

### Visual Studio 工作负载
确保安装以下工作负载：
- .NET 桌面开发
- 通用Windows平台开发
- Windows应用SDK C#项目模板

## 构建步骤

### 方法一：使用 Visual Studio（推荐）

1. **打开项目**
   ```
   双击 FocusGuard.sln 文件
   ```

2. **还原NuGet包**
   - 右键点击解决方案 → "还原NuGet包"
   - 或者在包管理器控制台运行：`dotnet restore`

3. **设置启动项目**
   - 右键点击 FocusGuard 项目 → "设为启动项目"

4. **选择目标平台**
   - 在工具栏选择 "x64" 平台
   - 选择 "Release" 配置

5. **构建项目**
   - 菜单：生成 → 生成解决方案
   - 或按 Ctrl+Shift+B

6. **运行项目**
   - 按 F5 运行调试版本
   - 或按 Ctrl+F5 运行发布版本

### 方法二：使用命令行

1. **打开命令提示符或PowerShell**
   ```cmd
   cd /d "项目路径"
   ```

2. **还原依赖**
   ```cmd
   dotnet restore FocusGuard.sln
   ```

3. **构建项目**
   ```cmd
   dotnet build FocusGuard.sln --configuration Release
   ```

4. **运行项目**
   ```cmd
   dotnet run --project FocusGuard --configuration Release
   ```

### 方法三：发布独立应用

1. **发布自包含版本**
   ```cmd
   dotnet publish FocusGuard\FocusGuard.csproj ^
     --configuration Release ^
     --runtime win10-x64 ^
     --self-contained true ^
     --output "publish\win10-x64"
   ```

2. **发布框架依赖版本**
   ```cmd
   dotnet publish FocusGuard\FocusGuard.csproj ^
     --configuration Release ^
     --runtime win10-x64 ^
     --self-contained false ^
     --output "publish\portable"
   ```

## 自动化构建脚本

### 使用提供的批处理脚本

1. **简单构建**
   ```cmd
   build.bat
   ```

2. **完整打包**
   ```cmd
   package.bat
   ```

### 脚本功能说明

- `build.bat`: 基本的构建和编译
- `package.bat`: 完整的打包，包括自包含和便携版本

## 故障排除

### 常见问题

1. **NuGet包还原失败**
   ```cmd
   # 清理NuGet缓存
   dotnet nuget locals all --clear
   
   # 重新还原
   dotnet restore --force
   ```

2. **Windows App SDK 相关错误**
   - 确保安装了最新版本的 Windows App SDK
   - 在 Visual Studio Installer 中更新工作负载

3. **编译错误**
   ```cmd
   # 清理构建输出
   dotnet clean
   
   # 重新构建
   dotnet build --no-incremental
   ```

4. **运行时错误**
   - 检查是否以管理员权限运行（某些功能需要）
   - 确保Windows版本兼容（Windows 10 1809+）

### 依赖项问题

如果遇到依赖项问题，请检查：

1. **LiveCharts2**
   ```cmd
   dotnet add package LiveChartsCore.SkiaSharpView.WinUI --version 2.0.0-rc2
   ```

2. **Microsoft.Data.Sqlite**
   ```cmd
   dotnet add package Microsoft.Data.Sqlite --version 8.0.0
   ```

3. **CommunityToolkit.Mvvm**
   ```cmd
   dotnet add package CommunityToolkit.Mvvm --version 8.2.2
   ```

## 部署

### 创建安装包

1. **使用 Windows Application Packaging Project**
   - 在解决方案中添加 Windows Application Packaging Project
   - 设置应用清单和证书
   - 构建 MSIX 包

2. **使用第三方工具**
   - Inno Setup
   - WiX Toolset
   - Advanced Installer

### 分发选项

1. **自包含可执行文件**
   - 优点：无需安装.NET运行时
   - 缺点：文件大小较大（~100MB）

2. **框架依赖版本**
   - 优点：文件大小小（~20MB）
   - 缺点：需要用户安装.NET 8.0运行时

3. **MSIX包**
   - 优点：现代化安装体验，自动更新
   - 缺点：需要代码签名证书

## 性能优化

### 发布优化选项

```xml
<PropertyGroup Condition="'$(Configuration)'=='Release'">
  <PublishTrimmed>true</PublishTrimmed>
  <PublishSingleFile>true</PublishSingleFile>
  <PublishReadyToRun>true</PublishReadyToRun>
  <IncludeNativeLibrariesForSelfExtract>true</IncludeNativeLibrariesForSelfExtract>
</PropertyGroup>
```

### 构建配置

- 使用 Release 配置进行最终构建
- 启用代码优化
- 移除调试符号

## 版本管理

### 更新版本号

在 `FocusGuard.csproj` 中更新：

```xml
<PropertyGroup>
  <AssemblyVersion>1.0.0.0</AssemblyVersion>
  <FileVersion>1.0.0.0</FileVersion>
  <Version>1.0.0</Version>
</PropertyGroup>
```

### 发布检查清单

- [ ] 更新版本号
- [ ] 测试所有核心功能
- [ ] 检查内存泄漏
- [ ] 验证不同Windows版本兼容性
- [ ] 测试管理员权限功能
- [ ] 创建发布说明
- [ ] 准备用户文档

## 技术支持

如果在构建过程中遇到问题：

1. 检查 Visual Studio 输出窗口的详细错误信息
2. 查看 `bin` 和 `obj` 文件夹中的构建日志
3. 确保所有依赖项都已正确安装
4. 参考 Microsoft 官方文档

---

**注意**: 首次构建可能需要较长时间来下载和安装依赖项。建议使用稳定的网络连接。