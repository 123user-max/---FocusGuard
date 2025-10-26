@echo off
echo Publishing FocusGuard with Tray Support...

REM 清理之前的发布
if exist "publish" rmdir /s /q "publish"

REM 发布应用程序
echo Publishing application...
"C:\Program Files\dotnet\dotnet.exe" publish FocusGuardWPF/FocusGuardWPF.csproj --configuration Release --runtime win-x64 --self-contained true --output "publish\FocusGuard"

echo.
echo Build completed!
echo Published files are in: publish\FocusGuard\
echo.
echo To run the application:
echo 1. Navigate to publish\FocusGuard\
echo 2. Run FocusGuardWPF.exe
echo.
echo Features:
echo - Runs in system tray
echo - Minimizes to tray instead of closing
echo - Right-click tray icon for menu
echo - Double-click tray icon to restore window
echo - Auto-startup on Windows boot (configurable)
echo - Starts minimized when auto-startup is enabled
echo.

pause