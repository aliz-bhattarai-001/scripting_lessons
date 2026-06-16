@REM Messing with numbers and maths

@echo off

echo -- This batch file is to check how numbers and arithmetic are handled here --

set "num1=10"
set "num2=10"

echo Total : %num1% + %num2%
:: Literal string 10 + 10 gets printed upon doing this.

:: How Maths Is performed here:

set /a "result=%num1% + %num2%"
:: /a = arithmetic switch.

echo The result is: %result%
:: Succssfully prints result to be 20.

:: Input Section
set /p "number0= Enter 1 Number: "
set /p "number1= Enter another Number: "

::  A string as input here just seems to be taken as 0 value.
:: "Alfred" + 10 = 10 : sort of output was resulted.

echo The second result is: %result2%

:: Let's check out other arithmetic operators : - / * % (modulo)

set /a "sum_res= %number0% + %number1%"
set /a "multiply_res= %number0% * %number1%"
set /a "diff_res=%number0% - %number1%"
set /a "divide_res= %number0% / %number1%"
set /a "modulo_res=%number0% %% %number1%"

:: --- Checking various cases ---

:: b > a :                21, -1, 110, 0, 10        Input: (10, 11)
:: Negative number input : 9, -11, -10, 0, -1       Input: (-1, 10)
:: On both numbers negative : -3, 1, 2, 0, -1       Input: (-1, -2) 
:: On one input being string : 10, -10, 0 , 0 , 0   Input: (one, 10)
:: On both being strings : 0, 0, 0, *blank*,*blank* Input: (one, two)
:: On float value (one) Input :     1,1,1,1,1       Input: (1.5, 2) 
:: *Missing operator error for all on float input*
:: On both float values : same result as above      Input: (1.5, 2.5)
:: Div by zero :10, 10, 0 , *blank*, *blank*        Input: (10, 0)
:: Divide by zero error for / and %% (modulo)

:: --- Verified all edge cases above (for now) ---

:: Title Block
echo.
echo ===========================
echo         Results
echo ===========================
echo.

:: Output area
echo Sum = %sum_res%
echo Difference = %diff_res%
echo Multiply = %multiply_res% 
echo Divide = %divide_res%
echo Modulo = %modulo_res%

:: Ending / Terminating area.
echo.
echo -- End of Script --
echo.
:: Works like in any programming language 
:: Let's try it with floating / decimal values.
