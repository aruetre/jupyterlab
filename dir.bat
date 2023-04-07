SET mypath=%~dp0
SET search=%mypath:\=/%
echo %search%
echo %mypath:~0,-1%
pause