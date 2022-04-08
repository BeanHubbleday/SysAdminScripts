rem Make User Local Admin Remotely By Jack Hubbleday
rem Created: 12-10-2020
rem Last Edited: 12-10-2020
@echo off
rem Turns off command listing in prompt window.
:loop
rem Defines a loop
set /p nameIP=Enter Name/IP Of Device: 
rem Sets the variable "nameIP" to be equal to the input from the user, which is also entered here.
set /p username=Enter Username:
rem Sets the variable "username" to be equal to the input from the user, which is also entered here.
set /p domain=Enter Domain Name, If Local User Enter IP/Name of Device:
rem Sets the variable "domain" to be equal to the input from the user, which is also entered here.
psexec \\%nameIP% net localgroup "Administrators" %domain%\%username% /add
rem Uses the "psexec" tool to run the "net" command on the remote device specified by the users input that was stored in a variable.
rem The command is passed the arguments to add the specified user into the local Adminstrators group.
goto loop
rem Makes the program loop back round by returning to where we defined the loop in the first instance.
