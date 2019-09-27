@echo off
title 随机抽号器
set nub=47
set n=0
set same=0
set c=0
set l=0
set input=0
set times=0
start %windir%\system32\osk.exe
mode con: cols=70 lines=15

:0
echo ----------------------------------
echo       欢迎使用随机抽号器！
echo                        ver6.0
echo                        by dky
echo    1.单次抽取
echo    2.循环抽取
echo    3.测试模式
echo ----------------------------------
echo    4.开启清屏  默认关闭
echo ----------------------------------
echo    5.按次数抽取
echo ----------------------------------
echo    默认禁止连续抽中同一人
echo ----------------------------------

set /p choice=请输入选择的序号并回车:

if %choice% == 1 ( set c=0) 
if %choice% == 2 ( set c=1)
if %choice% == 3 ( set c=2)
if %choice% == 5 ( set c=5 & goto 8)
if %choice% == 4 ( goto 6)



:1
if %c% == 2 ( set /p a=输入:) ELSE (set a=%random%)

if /i %a% leq 47 ( goto 2) ELSE goto 1
goto 1

:2
if %a% == %nub% ( goto 1)
if %a% == 23 ( goto 1) 
if %a% == 31 ( goto 1) 
if %a% == 25 ( goto 1) 
if %a% == 28 ( goto 1) 
if %a% == 43 ( goto 1) 
if %a%==%same% (goto 1)
if /i %n% lss 15 (goto 3) ELSE (
set n=0
set nub=%a%
 )

goto 4

:3
if %a% == %nub% ( goto 1) 
if %a%==%same% (goto 1)

:4
echo 当前抽中%a%号，恭喜你成为本次答题幸运观众,学习能力大幅提升！
set same=%a%
set /a n=%n%+1
set /a times=%times%+1
if %l% == 1 ( goto 5)
if %c% == 5 ( goto 9) 
if %c% == 1 ( goto 1) 
set errorlevel =>nul

set /p input=按任意键并回车继续，按X并回车退回主界面：
set input|findstr "\<x\>"
if "%errorlevel%" == "0" ( goto 0 ) ELSE (goto 1)
goto 1

:5

if %c% == 1 ( goto 1) ELSE ( goto 7)
cls
goto 1

:6
set l=1
cls
echo 已开启清屏!
goto 0

:7
set errorlevel =>nul

set /p input=按任意键并回车继续，按X并回车退回主界面：
set input|findstr "\<x\>"
cls
if "%errorlevel%" == "0" ( goto 0 ) ELSE (goto 1)


:8
set /p time=请输入要抽取的次数：
goto 1

:9

if /i %times% lss %time% (goto 1) ELSE (
set times=0
echo 完成抽号！
 )
pause
goto 0