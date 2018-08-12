@echo off
setlocal 
set dirpath=C:\wheel\
set filename=%1
set execname=%2
set extension=%filename:~-4%

if "%extension%"==".bat" (
	set filepath=%dirpath%\%filename%
) else (
	set filepath=%dirpath%\%filename%.bat
)

if "%execname%"=="" (
    set execname=%filename%.exe
)

if "%filename%"=="" (
	echo Usage: what start_name [executable_file_name]
) else if exist %CD%\%execname% (
	echo @echo off > %filepath%
	echo start "" "%CD%\%execname%" %%* >> %filepath%
	echo @echo on >> %filepath%
) else (
	echo File "%CD%\%execname%" not exists!
)

endlocal
@echo on
