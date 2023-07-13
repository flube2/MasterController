


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


Gui, Add, ListBox, w250 r3 vWebBrowserSelect, Firefox|Chrome|Edge
Gui,Show,w300,Select Web Browser










