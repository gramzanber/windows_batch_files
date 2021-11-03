Rem This line is to let the users know what is happening
@echo Auto mounting network drives

Rem This Line will remove the mounted drive so the mount does not error out
net use T: /delete
Rem This line mounts the drive, if the path contains spaces encapsulate with ""
net use T: \\<<address>>\<<path>> /persistent:yes /u:<<username>> <<password>>
