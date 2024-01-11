@echo off
SET pathWin=%~dp0
for /f "delims=" %%G in ('powershell.exe -ExecutionPolicy Bypass -File "%pathWin%\CreateProject.ps1"') do set "OUT=%%G"
SET pathLinux=%OUT:\=/%
SET "winroot=%OUT%"
SET "project=%pathLinux%/"
SET "windir=%winroot%"
echo "Ruta para JupyterLab: " %project%
echo "Directorio de trabajo: " %windir%
IF NOT EXIST %windir% mkdir %windir%
timeout /t 3 /nobreak
SET msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Proyecto: %OUT%', 'Proyecto Jupyter Lab');}"
powershell -Command %msgBoxArgs%
py -m jupyterlab  --notebook-dir=%project% --preferred-dir=%project%