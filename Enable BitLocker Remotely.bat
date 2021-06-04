rem Enable BitLocker Remotely By Jack Hubbleday
rem Created: 12-10-2020
rem Last Edited: 12-10-2020
@echo off
rem Turns off command listing in prompt window.
:loop
rem Defines a loop
set /p nameIP=Enter Name/IP Of Device: 
rem Sets the variable "nameIP" to be equal to the input from the user, which is also entered here.
manage-bde -cn %nameIP% -on C: -RecoveryPassword -s
rem "manage-bde" is a built in command in windows to manage BitLocker settings.
rem This command is passed with the "-on" argument which enables BitLocker on the specified drive on the remote device, which is specified next to the "-cn" argument which is fed the "nameIP" variable.
rem The "-RecoveryPassword" argument will make the command prompt ask you for the password to be used to unlock the machine at the BitLocker screen upon logon.
goto loop
rem Makes the program loop back round by returning to where we defined the loop in the first instance.