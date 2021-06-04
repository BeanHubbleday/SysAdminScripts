rem Check BitLocker Status Remotely By Jack Hubbleday
rem Created: 12-10-2020
rem Last Edited: 12-10-2020
@echo off
rem Turns off command listing in prompt window.
:loop
rem Defines a loop
set /p nameIP=Enter Name/IP Of Device: 
rem Sets the variable "nameIP" to be equal to the input from the user, which is also entered here.
manage-bde -cn %nameIP% -status
rem "manage-bde" is a built in command in windows to manage BitLocker settings.
rem This command is passed with the "-status" argument which simply checks the status of BitLocker on the remote device, which is specified next to the "-cn" argument which is fed the "nameIP" variable.
goto loop
rem Makes the program loop back round by returning to where we defined the loop in the first instance.