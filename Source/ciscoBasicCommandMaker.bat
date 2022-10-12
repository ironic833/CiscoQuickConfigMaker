@echo off
title 4thYearCiscoConfigMaker

:: Sets up some global variables to be used throughout the program for values used across different commands
set hstnmg=blank
set intnm1g=blank
set intnm2g=blank
set intg0g=blank
set intg1g=blank

:: Small menu to allow you to select the device you want to make a set of commands for 
:mainMenu
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Select desired device:
echo.
echo 1. Router
echo.
set /p idnum=Enter device: 
echo.
if %idnum% == 1 goto :Router

:: Menu to allow user to select different sets of commands for the router device
:Router
cls
echo Select desired commands:
echo.
echo It's reccommended you do these in order and skip what you don't need
echo.
echo 1. Basic Commands (hostname, interface one, interface two)
echo 2. OSPF Commands (OSPF process number, two neighbors)
echo 3. OSPF Passive Interface (Passive interface name)
echo 4. Set enable password (Encryption algorithim, Password, minimum length)
echo 5. Line Console Commands (Console line number, Password, Timeout length)
echo 6. Add Logging Synchronous Command (Just adds the logging synchronous command)
echo 7. Aux line commands (Auxilary line number, Password, Timeout length)
echo 8. Line VTY (No. of connections, password, timeout, transport type)
echo 9. Exit to main menu
echo.
set /p cmds=Enter command set number: 
echo.
if %cmds% == 1 goto :routerBasic
if %cmds% == 2 goto :routerOSPF
if %cmds% == 3  goto :ospfPassiveInt
if %cmds% == 4 goto :setEnablePasswordEncryption
if %cmds% == 5 goto :setConsoleLineConfig
if %cmds% == 6 goto :addSyncLogging
if %cmds% == 7 goto :setAuxLineConfig
if %cmds% == 8 goto :routerLineVty
if %cmds% == 9 goto :mainMenu

:: Enters into the menu and loop for entry of basic command information
:routerBasic
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter hostname.....
echo.
set /p hstnm=Enter hostname:
:: these kinds of lines assign global variables 
set hstnmg=%hstnm%
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter first interface name....
echo.
set /p intnm1=Enter interface name (name e.g. g0/0):
set intnm1g=%intnm1%
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter second interface name....
echo.
set /p intnm2=Enter interface name (name e.g. g0/0):
set intnm2g=%intnm2%
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter interface g0/0 settings....
echo.
set /p intg0=Enter interface details (ip address, subnet):
set intg0g=%intg0%
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter interface g0/1 settings....
echo.
set /p intg1=Enter interface details (ip address, subnet):
set intg1g=%intg1%
:: spits out the commands to the given text file
echo enable> commands.txt
echo configure terminal>> commands.txt
echo hostname %hstnm%>> commands.txt
echo interface %intnm1%>> commands.txt
echo ip address %intg0%>> commands.txt
echo no shutdown>> commands.txt
echo exit>> commands.txt
echo interface %intnm2%>> commands.txt
echo ip address %intg1%>> commands.txt
echo no shutdown>> commands.txt
echo exit>> commands.txt
echo no ip domain-lookup>> commands.txt
goto :Router

:: Enters the window for ospf command creation. No global variables here really in case you want to use multiple ospf process ID's
:routerOSPF
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter OSPF proccess number....
echo.
set /p ospfprcnum=Enter proccess number:
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter first neighbor....
echo.
set /p neighone=Enter neighbor details (ip address, wildcard):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter second neighbor....
echo.
set /p neightwo=Enter neighbor details (ip address, wildcard):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter ospf neighbor area number (the same for both neighbors)....
echo.
set /p areanum=Enter area number (area number):
echo router ospf %ospfprcnum%>> commands.txt
echo network %neighone% area %areanum%>> commands.txt
echo network %neightwo% area %areanum%>> commands.txt
goto :Router

:: For setting vty lines. Currently no global variables here but that could change in the future
:routerLineVty
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter amount of connections....
echo.
set /p conecamnt=Enter amount of connections (4 or 15):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter vty password....
echo.
set /p vtypass=Enter vty password (vty password):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter vty timeout in minutes and seconds....
echo.
set /p exectimout=Enter timeout (minutes, seconds):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter the allowed connections on vty lines ....
echo.
echo Options:
echo
echo ssh: allows TCP/IP SSH protocol only
echo telnet: allows TCP/IP Telnet protocol only
echo all: allows all protocols
echo none: blocks all protocols
echo telnet ssh: allows both Telnet and SSH protocols
echo.
set /p transprtinpt=Enter allowed inputs on vty lines (input type):
echo line vty 0 %conecamnt%>> commands.txt
echo password %vtypass%>> commands.txt
echo exec-timeout %exectimout%>> commands.txt
echo transport input %transprtinpt%>> commands.txt
echo login>> commands.txt
goto :Router

:: Allows a user to set the passive interface commands
:ospfPassiveInt
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter OSPF proccess number....
echo.
set /p ospfprcnum=Enter proccess number:
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter passive interface port....
echo.
set /p passintport=Enter port (port):
cls
echo router ospf %ospfprcnum% >> commands.txt
echo passive-interface %passintport% >> commands.txt
goto :Router

:: Allows configuration of the enable password command
:setEnablePasswordEncryption
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter algorithim Type....
echo.
set /p algotype=Enter algorithim type (algorithim type):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter enable password....
echo.
set /p enablepass=Enter enable password (password):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter minimum password length....
echo.
set /p enablepass=Enter minimum length (length):
cls
echo enable algorithm-type %algotype% secret %enablepass% >> commands.txt
echo security passwords min-length %minpasslength% >> commands.txt
goto :Router

:: Allows configuration of the console settings command
:setConsoleLineConfig
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter console line number....
echo.
set /p conlinnum=Enter console line number (console line number):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter console password....
echo.
set /p conlinepass=Enter console password (password):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter timeout for console line in minutes and seconds....
echo.
set /p conexectimout=Enter timeout (minutes, seconds):
cls
echo line console %conlinnum% >> commands.txt
echo password %conlinepass% >> commands.txt
echo exec-timeout %conexectimout% >> commands.txt
echo login >> commands.txt
goto :Router

:: Adds the sync logging command
:addSyncLogging
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Synchronous logging added
echo.
echo logging synchronous >> commands.txt
pause
goto :Router

:: Allows configuration of the Auxilary settings command
:setAuxLineConfig
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter Aux line number....
echo.
set /p auxlinnum=Enter Aux line number (console line number):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter Aux password....
echo.
set /p auxlinepass=Enter Aux password (password):
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Enter timeout for Aux line in minutes and seconds....
echo.
set /p auxexectimout=Enter timeout (minutes, seconds):
cls
echo line Aux %auxlinnum% >> commands.txt
echo password %auxlinepass% >> commands.txt
echo exec-timeout %auxexectimout% >> commands.txt
echo login >> commands.txt
goto :Router

:: Added the router show commands to run and add all in one go
:addRouterShows
cls
echo.
echo 4th Year Cisco Config Maker v0.0.1
echo.
echo Added router shows
echo.
echo show ip ssh >> commands.txt
echo show users >> commands.txt
echo show ip ospf neighbor >> commands.txt
pause
goto :Router




