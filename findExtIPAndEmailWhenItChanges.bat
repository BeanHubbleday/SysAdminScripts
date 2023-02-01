@echo off
rem Find External IP Of Network And Email It Out If It's Different
rem Written By Jack Hubbleday On 31/01/2023
rem Edited By Jack Hubbleday On 01/02/2023

cd C:\Maintenance\IP
FOR /F %%g IN ('curl http://ifconfig.me/ip') do set currentIP=%%g
curl http://ifconfig.me/ip > currentIP.txt
FOR /F %%h IN ('type C:\Maintenance\IP\lastIP.txt') do set lastIP=%%h
if %currentIP% == %lastIP% (goto Exit) else (goto Email)

:Email
del lastIP.txt
ren currentIP.txt lastIP.txt
curl http://ifconfig.me/ip > currentIP.txt
Powershell.exe -executionpolicy remotesigned -File  C:\Maintenance\IP\emailSend.PS1
pause

:Exit
exit