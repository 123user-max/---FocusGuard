@echo off
echo 正在编译FocusGuard安装程序...
echo.

REM 检查Inno Setup是否已安装
if not exist "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" (
    echo 错误：未找到Inno Setup 6
    echo 请先安装Inno Setup 6: https://jrsoftware.org/isdl.php
    pause
    exit /b 1
)

REM 编译安装程序
"C:\Program Files (x86)\Inno Setup 6\ISCC.exe" "inno通用配置文件(制作安装程序).iss"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo 安装程序编译成功！
    echo 输出文件：Output\FocusGuard_1.0.0_Setup.exe
) else (
    echo.
    echo 编译失败，请检查配置文件
)

pause