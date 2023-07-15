


; // Declaration Of Global Options
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory. NOTE: This MUST be overridden when launching certain programs such as Firefox.
#SingleInstance Force  ; Do you really want 5 instances of the same script running and causing weird issues? Do you? Do you REALLY?







; /////////////////////////////// BEGIN INTERACTIVE CODE ///////////////////////////////


; // Initialize
   ; // Get User Profile Paths And Input
   EnvGet, hdrive, Homedrive                         ;; necessary??
   EnvGet, hpath, Homepath
   EnvGet, LocalAppData, LocalAppData
   
   ; // Define Globals
   vPassword = defaultPassword                      ;;;;;;
   vAdminpassword =  administrator                  ;;;;;;
   ff = %A_ProgramFIles%\Mozilla Firefox\firefox.exe
   chr = chrome.exe
   edge = microsoft-edge:
   fb = facebook.com
   instagram = instagram.com
   twitter = twitter.com
   snapchat = snapchat.com
   gmail = gmail.com
   outlook = %A_ProgramFiles%\Microsoft Office\root\Office16\OUTLOOK.EXE
   discord = %LocalAppData%\Discord\Update.exe --processStart Discord.exe
   whatsapp = whatsapp.com
   hangouts = https://mail.google.com/chat
   messenger = http://m.me/
   newScriptPath = %A_ScriptDir%\MasterController.ahk
   comma = ,

   
   
   
Gui, SetupMenu:New
Gui, Add, Text,, NOTE FROM DEVELOPER: BEFORE RUNNING DISABLE STARTUP APPS.
Gui, Add, Text,, Enter your most commonly used password.`n`nHolding "Control" and "Shift" while tapping the "U" key will enter this password.
Gui, Add, Edit, Password* r1 w250 vPassword, password
Gui, Add, Text,, `n`nEnter Admin or secondary password.`n`nHolding "Control" and "Shift" while tapping the "I" key will enter this password.
Gui, Add, Edit, Password* r1 w250 vAdminpassword, adminpassword
Gui, Add, Text,, `n`nSelect your preferred web browser.
Gui, Add, Radio, vbrowser Checked, Firefox
Gui, Add, Radio, , Chrome
Gui, Add, Radio, , Edge
Gui, Add, Text,, `n`nSelect social media sites you use.
Gui, Add, ListBox, r4 multi w250 vSocialMediaSites, Facebook|Twitter|Instagram|Snapchat
Gui, Add, Text,, `n`nSelect communications platforms that you use.
Gui, Add, ListBox, r6 multi w250 vCommPlatforms, Outlook|Gmail|WhatsApp|Hangouts|Messenger|Discord
Gui, Add, Text,, `n`nEnter any other URLs you may want. `n`nHolding "Control" and "Shift" while tapping the "F" key will open the links.
Gui, Add, Edit, r1 w250 vUserDefinedURLs1
Gui, Add, Edit, r1 w250 vUserDefinedURLs2
Gui, Add, Edit, r1 w250 vUserDefinedURLs3
Gui, Add, Edit, r1 w250 vUserDefinedURLs4
Gui, Add, Text,, `n`n
Gui, Add, Button, yp h20 w70 Default gproceed, Proceed
Gui, Show,,  Setup Menu
return

proceed:
Gui, Submit, Hide


if browser = 1
browserPath = %ff%

if browser = 2
browserPath = %chr%

if browser = 3 
browserPath = %edge% 

;Loop, Parse, SocialMediaSites, |
;   MsgBox, Item number %A_Index% is %A_LoopField%.

;MsgBox %password% %adminPassword% %browserPath%


; //////////////////////////////// END INTERACTIVE CODE ////////////////////////////////


; ///////////////////////////// BEGIN SCRIPT CREATOR CODE /////////////////////////////

; // Create Empty Script
FileAppend, %A_ScriptDir%\MasterController.ahk


header = /*`nName: Master Controller`nPurpose (Short Version): Increase Efficiency Of Daily Workflow Via Automation, Promote Logical Laziness`nAuthor: Frank Lubek, OpsTechIT Support`nAssociate II @ IGQ1, Amazon Fulfillment`nMost Recent Update: 07/15/2023`n*/`n`n
FileAppend %header%, %newScriptPath%



; // Environment
toWrite = #NoEnv`n#Warn`nSendMode Input`nSetWorkingDir %A_ScriptDir%`n#SingleInstance Force`n`n
FileAppend %toWrite%, %newScriptPath%



; // Diagnostics
toWrite = ^+d::`nSend, ^+{Esc}`n
FileAppend %toWrite%, %newScriptPath%
FileAppend Return`n, %newScriptPath%



; // Enter Password
toWrite = ^+u::`nSendRaw, %password%`n`n
FileAppend %toWrite%, %newScriptPath%
FileAppend Return`n, %newScriptPath%



; // Enter Admin or Secondary Password
toWrite = ^+i::`nSendRaw, %adminPassword%`n`n
FileAppend %toWrite%, %newScriptPath%
FileAppend Return`n, %newScriptPath%



; // Open Social Media Links
toWrite = ^+m::`n
FileAppend %toWrite%, %newScriptPath%
Loop, Parse, SocialMediaSites, |
   Switch A_Index
   {
   Case 1: FileAppend Run%comma% %browserPath% %fb%`n, %newScriptPath%
   Case 2: FileAppend Run%comma% %browserPath% %twitter%`n, %newScriptPath%
   Case 3: FileAppend Run%comma% %browserPath% %instagram%`n, %newScriptPath%
   Case 4: FileAppend Run%comma% %browserPath% %snapchat%`n, %newScriptPath%
   } 
   
FileAppend Return`n, %newScriptPath%
   
   
   
; // Open Communication Links
toWrite = ^+c::`n
FileAppend %toWrite%, %newScriptPath%
Loop, Parse, CommPlatforms, |
   Switch A_Index
   {
   Case 1: FileAppend Run%comma% %browserPath% %outlook%`n, %newScriptPath%
   Case 2: FileAppend Run%comma% %browserPath% %gmail%`n, %newScriptPath%
   Case 3: FileAppend Run%comma% %browserPath% %whatsapp%`n, %newScriptPath%
   Case 4: FileAppend Run%comma% %browserPath% %hangouts%`n, %newScriptPath%
   Case 5: FileAppend Run%comma% %browserPath% %messenger%`n, %newScriptPath%
   Case 6: FileAppend Run%comma% %browserPath% %discord%`n, %newScriptPath%
   } 
   FileAppend Return`n, %newScriptPath%
   FileAppend `n, %newScriptPath%
   
   
   
; // Open Custom URLs
toWrite = ^+f::`n
FileAppend %toWrite%, %newScriptPath%
if (UserDefinedURLs1 >= 1 && UserDefinedURLs1 != "")
   FileAppend Run%comma% %browserPath% %UserDefinedURLs1%`n, %newScriptPath%
if (UserDefinedURLs2 >= 1 && UserDefinedURLs2 != "")
   FileAppend Run%comma% %browserPath% %UserDefinedURLs2%`n, %newScriptPath%
if (UserDefinedURLs3 >= 1 && UserDefinedURLs3 != "")
   FileAppend Run%comma% %browserPath% %UserDefinedURLs3%`n, %newScriptPath%
If (UserDefinedURLs4 >= 1 && UserDefinedURLs4 != "")
   FileAppend Run%comma% %browserPath% %UserDefinedURLs4%`n, %newScriptPath%
FileAppend Return`n, %newScriptPath%


; // Set MasterController.ahk to run at startup
FileCreateShortcut, %newScriptPath%, C:\Users\lubef\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\MasterController.lnk



; ///////////////////////////// BEGIN SCRIPT CREATOR CODE /////////////////////////////

return









