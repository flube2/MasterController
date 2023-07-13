/*
Name: Master Controller
Purpose (Short Version): Increase Efficiency Of Daily Workflow Via Automation, Promote Logical Laziness
Author: Frank Lubek, OpsTechIT Support Associate II @ IGQ1, Amazon Fulfillment
Most Recent Update: 06/27/2023
*/



/*
MOTIVATION FOR CREATION: 
I've upgraded my work PC over time and it's pretty much maxed out (but if you're my manager, it was like this when I got it lol). 
However, when booted to Desktop I would still have to wait a long time before I could do anything as it had to launch a zillion startup processes (like 30 seconds, but when patience is the one virtue you don't have, it's an eternity). 
After disabling them it booted faster, but I had to launch each process individually and would often forget a few.
My solution was to build off the script I had previously wrote which entered my overly complicated, and randomly-gen'd, passwords via a 3-key shortcut. 
Now I only run a few keyboard shortcuts to automate my workflow, which saves me tons of time throughout my day and allows me to exert more control over my PC.

WHAT THIS SCRIPT REQUIRES TO RUN:
AutoHotKey. That's it. Comment out below commands for programs you don't have/use, or add new ones if you so desire.
AutoHotKey can be downloaded via Software Center.
NOTE FOR OpsTechIT USERS: FOR PASSWORDS TO WORK IN SCENARIOS REQUIRING ADMIN, SET AUTOHOTKEY TO RUN AS ADMINISTRATOR BEFORE LAUNCHING SCRIPT

WHAT THIS SCRIPT DOES AND DOES NOT DO:
If you disable startup apps, you're PC will boot a bit faster and not run an ungodly number of programs on startup.
Also you can run certain processes only when they're needed. It increases the overall efficiency of PC usage, and is a lot less typing.
Unfortunately running this script will NOT help you win the lottery, make you cheeseburgers, OR get that promo you're going for....
That's all covered in the next script I write.
*/ 



; // Declaration Of Global Options
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases. 
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory. NOTE: This MUST be overridden when launching certain programs such as Firefox.
#SingleInstance Force  ; Do you really want 5 instances of the same script running and causing weird issues? Do you? Do you REALLY?








; // BEGIN CODE


; // Initialize
   ; // Get User Profile Paths And Input
   EnvGet, hdrive, Homedrive
   EnvGet, hpath, Homepath
   EnvGet, LocalAppData, LocalAppData
   ;password = defaultPassword
   InputBox, password, Enter Password,Enter your most commonly used password.`n   (Your input will be hidden)`n`nHolding "Control" and "Shift" while tapping the "U" key will enter this password., hide
   if (password = "")
   {
   password = defaultPassword
   }





; /////////////////////////////////////////
; // Display Startup Selection Menu [WIP]
;Menu, StartupMenu, ADD, comms
;Menu, StartupMenu, Show
;Menu, StartupMenu, 
;return
; /////////////////////////////////////////



; // Run All Startup Apps (Comms And Functional)
^+a:: ; (Ctrl+Shift+'A')
Send, ^+c
Send, ^+f
return


; // Launches commonly used non-communication apps/links
^+f:: ; (Ctrl+Shift+'F')
run, %A_ProgramFiles%\Mozilla Firefox\firefox.exe https://sn.opstechit.amazon.dev/now/sow/list/params/list-id/3dbe93373ceb651056c38a99402245e4/tiny-id/06be53373ceb651056c38a994022450d, %A_ProgramFiles%\Mozilla Firefox
run, %A_ProgramFiles%\Mozilla Firefox\firefox.exe mcm.amazon.com, %A_ProgramFiles%\Mozilla Firefox
run, %A_ProgramFiles%\Microsoft Office\root\Office16\OUTLOOK.EXE, %A_ProgramFiles%\Microsoft Office\root\Office16
return



; // Launch Comms: Slack, Chime, Discord (AMZL)
^+c:: ; (Ctrl+Shift+'C')
run, %LocalAppData%\slack\slack.exe, %LocalAppData%\slack\
run, %LocalAppData%\AmazonChime\Chime.exe, %LocalAppData%\AmazonChime
run, %LocalAppData%\Discord\Update.exe --processStart Discord.exe, %LocalAppData%\Discord ; // Update and launch
return



; // Diagnostics
^+d:: ; (Ctrl+Shift+'D')
Send, ^+{Esc}
return

; // Enter Password
^+u:: ; (Ctrl+Shift+'U')
Send, %password%
return

; // Enter Admin or Secondary Password
^+I:: ; (Ctrl+Shift+'I')
SendRaw, ADMINPASSWORD/PASSWORD2
return


; // END CODE
