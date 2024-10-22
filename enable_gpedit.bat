@echo off

setlocal enabledelayedexpansion
set "count=0"

for /f %%i in ('dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum') do (
set list[!count!]=%%i
set /a "count+=1"
)

for /f %%i in ('dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum') do (
set list[!count!]=%%i
set /a "count+=1"
)

set count=0
:SymLoop

if defined list[%count%] ( 
   call dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%list[%count%]%%"
   set /a "count+=1"
   GOTO :SymLoop 
)

pause
