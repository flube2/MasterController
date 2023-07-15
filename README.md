# MasterController
# Windows OS Only

/*
Name: Master Controller (Public Release v2.0.0)
Purpose (Short Version): Increase Efficiency Of Daily Workflow Via Automation, Promote Logical Laziness
Author: Frank Lubek, OpsTechIT Support
Associate II @ IGQ1, Amazon Fulfillment
Most Recent Update: 07/15/2023
*/


***Automates PC processes such as launching apps, entering redundant info, diagnostics, etc.***


**Prerequisites** 
Install AutoHotKey (https://www.autohotkey.com/)
Download Script (https://github.com/flube2/MasterController/releases/)
Recommended to disable startup apps as well (https://youtu.be/UB_240QIV-k)



**Install**
- Run the Install.ahk file with AutoHotKey installed
- Enter information into the menu (select web browser, popular links, enter custom website URLs, etc)
- The script will create another script called MasterController.ahk that when launched contains all of user-defined functionality
- The script adds MasterController.ahk to startup apps



**Problem**
- There are many startup processes that most have no knowledge of that tend to unnecessarily consume resources which can significantly delay boot time and cause seemingly random issues post-boot such as excessive CPU/RAM consumption, crashes, etc. 

**Desired Solution**
- Faster boot into OS and reduction of unnecessary post-boot issues. Increased ease of PC use via automation.



**Shortcuts**
Ctrl+Shift+u = Enter Primary Password
Ctrl+Shift+i = Enter Admin/Secondary Password
Ctrl+Shift+d = Diagnostics
Ctrl+Shift+m = Launch Social Media Links
Ctrl+Shift+c = Launch Communication Platforms
Ctrl+Shift+f = Launch Custom User Defined URLs



**Background**
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
 


**User Stories**

- User runs "Script A":
   - User enters/selects commonly used apps, passwords, etc.
   - Script A uses these inputs and hard coded strings and writes the result into "Script B"
   - Ideally script A disables most startup apps and allows script B to launch immediately post-boot

- User runs "Script B":
   - Thereafter user at most double clicks an .AHK file immediately post-boot which activates functionality
   - User uses predefined (eventually custom) hotkey combos that launch macros to achieve a certain goal
   - User inputs a certain keyboard key combo which launch their commonly used webpages in their previously defined choice of web browser
   
   
   
   
 