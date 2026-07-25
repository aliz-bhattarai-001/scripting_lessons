@echo off
:: Turns off all echos to the console besides the ones specified.

@REM This is a comment
:: This is also a comment.

set name="Lesson One"
:: Setting up variables in here.
:: DO NOT INCLUDE SPACES BEFORE OR AFTER THE "=" set is the actual definition  of 
:: "Sorry  bro I took you literally."
:: It considers  spaces after  and before "=" as actual characters meant to be there 
:: not just formatting. So do not include that there.
:: learnt this after running this with spaces and a bit of google after that on why>
:: Why is it printing : ECHO is off.


echo %name%
:: echoes the value stored within name.
:: set also seems  to condier "" as literal quotes to be printed. 
:: It's literally taking everything literally. (pun intended)


echo "Completed Printing name to The console."

echo Printing this without the quotes cause 
echo the quotes get printed "Literally"

set "print=Something Interesting happens when I set values like this"
:: woah what a way to declare variables.
:: Quotes do not get printed (still keep in mind the spacing before and after '=')

echo %print%
:: Hmm Works as expected.

:: Taking user Input
set /p "username=Enter your name: "
:: /p stands for prompt.

echo. 
:: prints a blank line

:: Everything works as expected so far.
echo Hello %username%

set /p "response= How is life? "

echo "%response%", really?

