


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
   vPassword = defaultPassword
   vAdminpassword =  administrator
   
   
   
   
   
   
   
;   InputBox, password, Enter Password,Enter your most commonly used password.`n   (Your input will be hidden)`n`nHolding "Control" and "Shift" while tapping the "U" key will enter this;; password., hide
 ;  if (password = "")
 ;  {
  ; vPassword = defaultPassword
   ;}
   
Gui, SetupMenu:New
Gui, Add, Text,, Enter your most commonly used password.`n`nHolding "Control" and "Shift" while tapping the "U" key will enter this password.
Gui, Add, Edit, Password* r1 w250 vPassword
Gui, Add, Text,, `n`nEnter Admin or secondary password.`n`nHolding "Control" and "Shift" while tapping the "I" key will enter this password.
Gui, Add, Edit, Password* r1 w250 vAdminpassword
Gui, Add, Text,, `n`nSelect your preferred web browser.
;Gui, Add, ListBox, w250 r3 vWebBrowserSelect, Firefox|Chrome|Edge
;Gui, Add, Text,, `n`n
Gui, Add, Radio, vbrowser, Firefox
Gui, Add, Radio, , Chrome
Gui, Add, Radio, , Edge
Gui, Add, Text,, `n`nSelect social media sites you use.
Gui, Add, ListBox, r4 multi w250 vSocialMediaSites, Facebook|Twitter|Instagram|Snapchat
Gui, Add, Text,, `n`n
Gui, Add, Button, yp h20 w70 Default gproceed, Proceed
Gui, Show,,  Setup Menu
return

proceed:
Gui, Submit, NoHide


if browser = 1
MsgBox Firefox

if browser = 2
MsgBox Chrome

if browser = 3 
MsgBox Shitty Edge 

MsgBox hi

return









