Rem removing the verbose nature of windows scripts
@echo off

Rem This line is to let the users know what is happening
@echo Removing mounted network drives

Rem This will remove the connection if it exists already
if exist T:\ (
    net use T: /delete
)