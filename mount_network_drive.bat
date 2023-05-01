Rem removing the verbose nature of windows scripts
@echo off

Rem Script variables please change to match the payload data
set "server=<<address>>"

Rem Checking if the connection is valid, throws viewable error if not
@echo Checking server status
Rem the >nul makes the output go nowhere so the user does not see the result of the ping
ping -4 -n 1 %server% | find "TTL=" >nul
IF %errorlevel% == 0 (
	@echo Auto mounting network drives

	Rem This will mount the connection if it does not exist already
	if not exist T:\ (
		net use T: \\%server%\<<path>> /persistent:yes /u:<<username>> <<password>>
	)
) ELSE (
	@echo Server unreachable.
)