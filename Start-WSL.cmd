@echo off
REM Start WSL and open a PuTTY ssh session
REM Pass in the distro version to connect to, for example Ubuntu-18.04

SET VERSION=%1
FOR /F %%F IN ('wsl -d %VERSION% ./run-ssh.sh') DO (
  SET IP=%%F
)

start /B "" "C:\Program Files\PuTTY\putty.exe" "-load" "Win10 Ubuntu" %IP%

exit
