@REM A script "Menu-based" for taking user input to create a user profile sort of thing.

:: Turning unspecified echo to false.
@echo off

:: Statup Title
echo =============================
echo       Wecome Adventurer
echo =============================
echo.

:: Input Section
set /p "username_temp=Enter your name: "
:: username by default seems to be set to whatever user name you have on windows.
:: Hence, setting it to username_temp 
:: (I don't want unexpected conflicts somewhere else : little knowledge is dangerous)
set /p "age=Your age: "
set /p "preferences=Adventure Preferences: "
set /p "hobby=Hobby(ies): " 

:: Secondary Title 
echo.
echo =============================
echo    Sucessfully Registered
echo =============================

:: Displaying User Details
echo.
echo Username : %username_temp%
echo Age : %age%
echo Adventure Pref: %preferences%
echo Hobby: %hobby%

:: Ending script with a note
echo.
echo --- End of script ---

