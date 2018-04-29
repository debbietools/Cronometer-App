﻿#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
Process, Priority, %PID%, AboveNormal
CoordMode, Mouse, Screen


  IniRead, CronometerHotkey1, settings.ini, settings, CronometerHotkey1, ""
  IniRead, CronometerHotkey2, settings.ini, settings, CronometerHotkey2, ""
  IniRead, CronometerHotkey3, settings.ini, settings, CronometerHotkey3, ""
  IniRead, CronometerHotkey4, settings.ini, settings, CronometerHotkey4, ""
  IniRead, CronometerHotkey5, settings.ini, settings, CronometerHotkey5, ""
  IniRead, CronometerHotkey6, settings.ini, settings, CronometerHotkey6, ""
  IniRead, CronometerSeconds, settings.ini, settings, CronometerSeconds, 2
  

    Menu, Tray, Icon, %A_ScriptDir%\Files\Compass.ico

    Gui, Add, Text, x10 y+10, Seconds to count:
    Gui, Add, Edit, x100 yp-3 vCronometerSeconds w25, %CronometerSeconds%
    Gui, Add, Text, x10 y+5, Hotkey to start cronometer

    Gui, Add, DropDownList, w50 vCronometerHotkey1, %A_Space%|a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|x|w|y|z|1|2|3|4|5|6|7|8|9|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12
    GuiControl, ChooseString, CronometerHotkey1, %CronometerHotkey1%

    Gui, Add, Text, x65 yp+2, or

    Gui, Add, DropDownList, xp+15 yp-2 w50 vCronometerHotkey2, %A_Space%|a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|x|w|y|z|1|2|3|4|5|6|7|8|9|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12
    GuiControl, ChooseString, CronometerHotkey2, %CronometerHotkey2%

    Gui, Add, DropDownList, x10 yp+35 w50 vCronometerHotkey3, %A_Space%|a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|x|w|y|z|1|2|3|4|5|6|7|8|9|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12
    GuiControl, ChooseString, CronometerHotkey3, %CronometerHotkey3%
    
    Gui, Add, Text, x65 yp+2, or

    Gui, Add, DropDownList, xp+15 yp-2 w50 vCronometerHotkey4, %A_Space%|a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|x|w|y|z|1|2|3|4|5|6|7|8|9|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12
    GuiControl, ChooseString, CronometerHotkey4, %CronometerHotkey4%

    Gui, Add, DropDownList, x10 yp+35 w50 vCronometerHotkey5, %A_Space%|a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|x|w|y|z|1|2|3|4|5|6|7|8|9|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12
    GuiControl, ChooseString, CronometerHotkey5, %CronometerHotkey5%

    Gui, Add, Text, x65 yp+2, or

    Gui, Add, DropDownList, xp+15 yp-2 w50 vCronometerHotkey6, %A_Space%|a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|x|w|y|z|1|2|3|4|5|6|7|8|9|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12
    GuiControl, ChooseString, CronometerHotkey6, %CronometerHotkey6%


    Gui, Add, Button, x37 yp+30 h25 gStart, Start
    Gui, Add, Button, xp+40 h25 gClose, Stop


    Gui, Show, w150 h185, Cronometer
Return



Start:
{
    Gui, Submit, NoHide
    IniWrite, %CronometerHotkey1%, settings.ini, settings, CronometerHotkey1
    IniWrite, %CronometerHotkey2%, settings.ini, settings, CronometerHotkey2  
    IniWrite, %CronometerHotkey3%, settings.ini, settings, CronometerHotkey3 
    IniWrite, %CronometerHotkey4%, settings.ini, settings, CronometerHotkey4
    IniWrite, %CronometerHotkey5%, settings.ini, settings, CronometerHotkey5 
    IniWrite, %CronometerHotkey6%, settings.ini, settings, CronometerHotkey6 
    IniWrite, %CronometerSeconds%, settings.ini, settings, CronometerSeconds 
    Run, %A_ScriptDir%\Files\CronometerApp.exe
    Return
}

Close:
{
    Process, Close, CronometerApp.exe
    Return
}


GuiClose:
{
Process, Close, CronometerApp.exe
ExitApp
}