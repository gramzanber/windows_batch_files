Rem This script will download the packages that will enable Hyper-V
Rem This script also works with Windows 11 Home
Rem You will need to run this script with elevated permissions
Rem Designed by Nathanial Tachibana

pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hv.txt
for /f %%i in ('findstr /i . hv.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hv.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V -All /LimitAccess /ALL
pause
