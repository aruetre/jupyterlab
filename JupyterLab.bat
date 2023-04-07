@echo off
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Introduzca nombre del proyecto:', 'Crear o abrir proyecto JupyterLab.')}" > %TEMP%\out.tmp
SET /p OUT=<%TEMP%\out.tmp
SET pathWin=%~dp0
SET pathLinux=%pathWin:\=/%
SET "root=%pathLinux%"
SET "winroot=%pathWin%"
SET "folder=%OUT%"
SET "project=%root%%folder%/"
SET "windir=%winroot%%folder%"
REM echo "Ruta para JupyterLab: " %project%
REM echo "Directorio de trabajo: " %windir%
IF NOT EXIST %windir% mkdir %windir%
timeout /t 3 /nobreak
SET msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Proyecto: %OUT%', 'Proyecto Jupyter Lab');}"
powershell -Command %msgBoxArgs%
py -m jupyterlab  --notebook-dir=%project% --preferred-dir=%project%

