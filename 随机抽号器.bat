@echo off
title ��������
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
echo       ��ӭʹ������������
echo                        ver6.0
echo                        by dky
echo    1.���γ�ȡ
echo    2.ѭ����ȡ
echo    3.����ģʽ
echo ----------------------------------
echo    4.��������  Ĭ�Ϲر�
echo ----------------------------------
echo    5.��������ȡ
echo ----------------------------------
echo    Ĭ�Ͻ�ֹ��������ͬһ��
echo ----------------------------------

set /p choice=������ѡ�����Ų��س�:

if %choice% == 1 ( set c=0) 
if %choice% == 2 ( set c=1)
if %choice% == 3 ( set c=2)
if %choice% == 5 ( set c=5 & goto 8)
if %choice% == 4 ( goto 6)



:1
if %c% == 2 ( set /p a=����:) ELSE (set a=%random%)

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
echo ��ǰ����%a%�ţ���ϲ���Ϊ���δ������˹���,ѧϰ�������������
set same=%a%
set /a n=%n%+1
set /a times=%times%+1
if %l% == 1 ( goto 5)
if %c% == 5 ( goto 9) 
if %c% == 1 ( goto 1) 
set errorlevel =>nul

set /p input=����������س���������X���س��˻������棺
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
echo �ѿ�������!
goto 0

:7
set errorlevel =>nul

set /p input=����������س���������X���س��˻������棺
set input|findstr "\<x\>"
cls
if "%errorlevel%" == "0" ( goto 0 ) ELSE (goto 1)


:8
set /p time=������Ҫ��ȡ�Ĵ�����
goto 1

:9

if /i %times% lss %time% (goto 1) ELSE (
set times=0
echo ��ɳ�ţ�
 )
pause
goto 0