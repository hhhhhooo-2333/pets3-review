@echo off
chcp 65001 >nul
title PETS3 手机访问服务
set "APP_DIR=%~dp0"
set "PYTHON_EXE=C:\Users\Skipper\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
for /f "usebackq delims=" %%I in (`powershell -NoProfile -Command "(Get-NetIPAddress -AddressFamily IPv4 ^| Where-Object {$_.IPAddress -notlike '127.*' -and $_.PrefixOrigin -ne 'WellKnown'} ^| Select-Object -First 1 -ExpandProperty IPAddress)"`) do set "LAN_IP=%%I"
echo.
echo PETS3 复习舱已启动
echo.
echo 手机和电脑连接同一 Wi-Fi 后，请在手机浏览器输入：
echo http://%LAN_IP%:8765
echo.
echo 如果 Windows 弹出防火墙提示，请允许“专用网络”访问。
echo 保持此窗口开启；关闭窗口后手机将无法访问。
echo.
"%PYTHON_EXE%" -m http.server 8765 --bind 0.0.0.0 --directory "%APP_DIR%"
