/*
Name: Master Controller (Public Release v2.0.0)
Purpose (Short Version): Increase Efficiency Of Daily Workflow Via Automation, Promote Logical Laziness
Author: Frank Lubek, OpsTechIT Support
Associate II @ IGQ1, Amazon Fulfillment
Most Recent Update: 07/15/2023
*/




; // Declaration Of Global Options
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory. NOTE: This MUST be overridden when launching certain programs.
#SingleInstance Force  ; Do you really want 5 instances of the same script running and causing weird issues? Do you? Do you REALLY?







; /////////////////////////////// BEGIN INTERACTIVE CODE ///////////////////////////////


; // Initialize
   ; // Get User Profile Paths And Input
   EnvGet, hdrive, Homedrive                        
   EnvGet, hpath, Homepath
   EnvGet, LocalAppData, LocalAppData
   
   ; // Define Globals
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

   

;Gui, Prompt: New, +HwndMain +Resize, Prompt
;Gui, Prompt: Add, Text,, "Make sure disabled all unnecessary startup apps prior to running this script. If you don’t know how to do this click the button to button to see my YouTube video on how to do it."
;Gui, Prompt: Add, Button, gYoutube ,Watch YouTube Video
;Gui, Prompt: Add, Button, yp h20 w70 Default gNext, Next
;Gui, Prompt: Show, AutoSize, 


;Youtube:
;Run, %ff% https://youtu.be/UB_240QIV-k
  

;Next:
;Gui, Prompt:Destroy



   
Gui, SetupMenu:New
;Gui, Add, Text,, NOTE FROM DEVELOPER: BEFORE RUNNING DISABLE STARTUP APPS.
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



; //////////////////////////////// END INTERACTIVE CODE ////////////////////////////////


; ///////////////////////////// BEGIN SCRIPT CREATOR CODE /////////////////////////////


; // If file already exists and this script is ran again, it'll append and error on duplicates so delete and create new (overwrite/replace)
if(FileExist(%newScriptPath%)){
FileDelete(%newScriptPath%)
}


; // Create Empty Script
FileAppend, %A_ScriptDir%\MasterController.ahk


header = /*`nName: Master Controller (Public Release v2.0.0)`nPurpose (Short Version): Increase Efficiency Of Daily Workflow Via Automation, Promote Logical Laziness`nAuthor: Frank Lubek, OpsTechSolutions Support`nAssociate II @ IGQ1, Amazon Fulfillment`nMost Recent Update: 07/15/2023`n*/`n`n
FileAppend %header%, %newScriptPath%



; // Environment
toWrite = #NoEnv`n#Warn`nSendMode Input`nSetWorkingDir %A_ScriptDir%`n#SingleInstance Force`n`n
FileAppend %toWrite%, %newScriptPath%



; // Diagnostics
toWrite = `n^+d::`nSend, ^+{Esc}`n
FileAppend %toWrite%, %newScriptPath%
FileAppend Return, %newScriptPath%
FileAppend `n`n, %newScriptPath%



; // Enter Password
toWrite = `n^+u::`nSendRaw, %password%
FileAppend %toWrite%, %newScriptPath%
FileAppend `n, %newScriptPath%
FileAppend Return, %newScriptPath%
FileAppend `n`n, %newScriptPath%



; // Enter Admin or Secondary Password
toWrite = `n^+i::`nSendRaw, %adminPassword%
FileAppend %toWrite%, %newScriptPath%
FileAppend `n, %newScriptPath%
FileAppend Return, %newScriptPath%
FileAppend `n`n, %newScriptPath%



; // Open Social Media Links
toWrite = `n^+m::`n
FileAppend %toWrite%, %newScriptPath%
Loop, Parse, SocialMediaSites, |
   Switch A_Index
   {
   Case 1: FileAppend Run%comma% %browserPath% %fb%`n, %newScriptPath%
   Case 2: FileAppend Run%comma% %browserPath% %twitter%`n, %newScriptPath%
   Case 3: FileAppend Run%comma% %browserPath% %instagram%`n, %newScriptPath%
   Case 4: FileAppend Run%comma% %browserPath% %snapchat%`n, %newScriptPath%
   } 

FileAppend Return, %newScriptPath%
FileAppend `n`n, %newScriptPath%
   
   
   
; // Open Communication Links
toWrite = `n^+c::`n
FileAppend %toWrite%, %newScriptPath%
Loop, Parse, CommPlatforms, |
   Switch A_Index
   {
   Case 1: FileAppend Run%comma% %outlook%`n, %newScriptPath%
   Case 2: FileAppend Run%comma% %browserPath% %gmail%`n, %newScriptPath%
   Case 3: FileAppend Run%comma% %browserPath% %whatsapp%`n, %newScriptPath%
   Case 4: FileAppend Run%comma% %browserPath% %hangouts%`n, %newScriptPath%
   Case 5: FileAppend Run%comma% %browserPath% %messenger%`n, %newScriptPath%
   Case 6: FileAppend Run%comma% %discord%`n, %newScriptPath%
   } 

   FileAppend Return, %newScriptPath%
   FileAppend `n`n, %newScriptPath%
   
   
   
; // Open Custom URLs
toWrite = `n^+f::`n
FileAppend %toWrite%, %newScriptPath%
if (UserDefinedURLs1 >= 1 && UserDefinedURLs1 != "")
   FileAppend Run%comma% %browserPath% %UserDefinedURLs1%`n, %newScriptPath%
if (UserDefinedURLs2 >= 1 && UserDefinedURLs2 != "")
   FileAppend Run%comma% %browserPath% %UserDefinedURLs2%`n, %newScriptPath%
if (UserDefinedURLs3 >= 1 && UserDefinedURLs3 != "")
   FileAppend Run%comma% %browserPath% %UserDefinedURLs3%`n, %newScriptPath%
If (UserDefinedURLs4 >= 1 && UserDefinedURLs4 != "")
   FileAppend Run%comma% %browserPath% %UserDefinedURLs4%`n, %newScriptPath%
   
FileAppend Return, %newScriptPath%
FileAppend `n`n, %newScriptPath%


; // Set MasterController.ahk to run at startup
FileCreateShortcut, %newScriptPath%, C:\Users\lubef\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\MasterController.lnk



; ////////////////////////////// END SCRIPT CREATOR CODE //////////////////////////////

return









