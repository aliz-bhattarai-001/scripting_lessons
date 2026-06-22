:: This is for checking the properties of  FOR loop and stuff.
:: FOR seems pretty powerful and versatile in batch scripting.
:: So let's get to it now.

@echo off

:: Basic iteration through list

:: do or DO
:: for or FOR
:: in or IN

:: However %% is required (i.e dual % req) and the Variable (%%V) is case sensitive unlike others
:: %%V != %%v
FOR %%V IN (apple banana  mango) DO echo %%V


:: Looping through a range of numbers

:: /L to speciffy that the in represents a range of numbers to loop through
:: syntax : FOR /L %%variable IN (start, step, end) DO command
:: step -ve means to count backwards.

:: Counting : ascending order
FOR /L %%i IN (1, 2, 10) DO (
    echo Count is %%i
)

:: Counting : descending order.
FOR /L %%i IN (10, -2, 1) DO (
    echo %%i is the count.
)


:: Echoes all .bat files within the current directory
FOR %%A IN (*.bat) DO (
    echo %%A
)

:: Echoes all cpp files in one directory above from this working directory (if any)
:: does not look for .cpp files within the directories. 
:: only lookup in the same level as specified.
FOR %%A IN (../*.cpp) DO (
    echo %%A
)
echo.

:: for multiple type files 
echo -- From dual loop --
:: works even better than expected.
FOR %%A IN (*.bat ../*.cpp) DO (
    echo %%A
)
echo.

:: FOR recursive search : syntax = FOR /R [path] %%A IN (pattern) DO command

:: works but I don't want a lag while experimenting.

@REM echo -- From recursive part --
@REM FOR /R D:\personal_files %%A IN (*.bat) DO (
@REM     echo %%A
@REM )
:: TOOK some seconds but worked just fine.

:: to recurse only through the current directory:
:: for /R %%A in (*.ext) do echo %%A 
:: i.e remove the [path] portion as a whole.



:: Normal for only sees files
:: /D flag used for directories action
echo -- Folders --
FOR /D %%A IN (../*) DO (
    echo %%A
)
echo.

:: Recursive folder traversal
:: also works but I just don't want to clutter the terminal with the output.

@REM echo -- Recursive Traversal --
@REM for /R %%A in (../) do echo %%~dpA

:: %%~dA : shows the drive name only for my case -> D:
:: %%~pA : shows only the path of the folder excluding the drive name
:: %%~dpA: shows both the drive name and the path alongside.


:: What each addition does to a file echo
:: p -> path
:: n -> name
:: x -> file extension
:: d -> drive name
:: a -> attributes
:: z -> File size
:: t -> last modified time
:: nx -> name + extension
:: dp -> drive + path
:: f -> full path

:: for folders /directories x and z become basically useless 
:: s -> gives short path of that dir
:: fs -> full short path of that dir

:: ~ -> itself removes the quotes around the variable value before performing any modifications
:: via modifiers