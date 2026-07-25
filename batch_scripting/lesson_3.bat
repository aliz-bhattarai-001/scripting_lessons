@REM This lesson covers Comparison operators and keywords

@echo off

::Starting 
echo -- Successfully Started --
echo.

:: Input section
set /p "num_1=Enter a number: "
set /p "num_2=Enter another number: "


echo.

::Comparison Section

:: NOT ALLOWED > set /a "equ_res=%num_1% EQU %num_2%"
:: /a only for arithmetic operations. EQU DIDN'T work here.


set "is_equal=0"

if %num_1% EQU %num_2% (
    set "is_equal=1"
)

if %is_equal% EQU 1 (
    echo The numbers are equal.
) else if %num_1% GTR %num_2% ( 
    echo %num_1% ^> %num_2%
) else (
    echo %num_2% ^> %num_1%
)

:: EQU -> equals to
:: NEQ -> Not equals to
:: GTR -> Greater than
:: LSS -> Less than
:: LEQ -> Less than or equals to
:: GEQ -> Greater than or equals to

:: ^ sign necessary with > sign to specify that I am using that symbol literally 
:: and not trying to store num_1 within a file having value of num_2


:: What do == >= <= and > and < do then?

:: > is used to insert within file. so using that individually has its quirk
:: Also comparison between strings even if as variables must be done within ""
:: eg: "%Character%" LSS "C" compares the value within character var within "C"


:: Checking if a file exists or not (uppercase or lowecase commands are equivalent it seems)

:: case - 01 (Also didn't work)
@REM if exist "something.txt" echo Yes file found!
@REM else if not exist echo Nope file not found


:: Case - 2 (The syntax of the command is incorrect.)
@REM if exist "something.txt" (
@REM     echo Yes file found!
@REM ) else if not exist (
@REM     echo Nope file not found
@REM )

:: finally worked

if exist "something.txt" (
    echo Yes file found!
) else (
    echo Nope file not found
)
