@echo off
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
cd /d "%~dp0"
echo 当前运行路径是：%CD%
echo -
@echo - 你即将要下载的是：
@echo -“MAME懒人街机包0.256+0.245.12”
@echo - 整合包的更新补丁合集
@echo - 本程序将会自动下载并应用所有的升级补丁
@echo - 请确保当前运行的路径是整合的存放文件夹
@echo - 如果没有异议请按任意键继续
@echo -
@echo -
@echo -
@echo Adnini983
@pause
cls

aria2c.exe -c -s 24 -x 16 --checksum=md5=BAE681B6F8966934D57F9014D65C4D04 https://karmanetworks-my.sharepoint.com/personal/no5kn_karmanetworks_onmicrosoft_com/_layouts/52/download.aspx?share=EeaAL0BgeM1NjbjpGSfER7oBCQVzO_5QAk9vbLeh7c5Hnw
cls

0_UPDATE_Auto.exe
del 0_UPDATE_Auto.exe
rmdir Aria2Data
del aria2.conf
del aria2.session
del aria2c.exe
cls

echo 整合已更新完成
echo 此窗口即将关闭
choice /t 3 /d y /n >nul
del "Preload.bat"
del "StartUpdate.bat"