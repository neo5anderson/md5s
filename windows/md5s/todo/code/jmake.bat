@echo off
REM 针对本程序斑驳不担保任何责任，欲知详细请查看 GPL.txt
REM 这是一个自由的程序，欢迎您在特定条件下再次发布本程序。
REM
REM 再次感谢您使用本脚本
REM 斑驳敬上
REM

if exist %tmp%\j.list del /f /q %tmp%\j.list 2> nul
setlocal enabledelayedexpansion
for /f "tokens=*" %%i in ('dir /s /b *.java 2^> nul') do (
	set javafile=%%i
	set javafile=!javafile:\=\\!
	echo "!javafile!">> %tmp%\j.list
)
endlocal

if not exist %tmp%\j.list (
	echo no java file found!
)

if exist ..\bin\nul (
	rd /s /q ..\bin 2> nul
)

md ..\bin
set /p=Compiling . < nul
javac -encoding gb2312 -cp . -d ..\bin @%tmp%\j.list
if %errorlevel% EQU 0 (
	echo . .
	java -cp ..\bin %*
)

del /f /q %tmp%\j.list
