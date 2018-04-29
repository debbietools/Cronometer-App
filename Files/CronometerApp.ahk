#persistent
#SingleInstance, Force
#NoEnv
#NoTrayIcon
SendMode, Input

IniRead, CronometerHotkey1, settings.ini, settings, CronometerHotkey1
IniRead, CronometerHotkey2, settings.ini, settings, CronometerHotkey2
IniRead, CronometerHotkey3, settings.ini, settings, CronometerHotkey3
IniRead, CronometerHotkey4, settings.ini, settings, CronometerHotkey4
IniRead, CronometerHotkey5, settings.ini, settings, CronometerHotkey5
IniRead, CronometerHotkey6, settings.ini, settings, CronometerHotkey6
IniRead, CronometerSeconds, settings.ini, settings, CronometerSeconds, 2
IniRead, CronometerMessage, settings.ini, settings, CronometerMessage, Done
IniRead, CronometerMessageDelay, settings.ini, settings, CronometerMessageDelay, 200
IniRead, CronometerMessageColor1, settings.ini, settings, CronometerMessageColor1, Green
IniRead, CronometerMessageColor2, settings.ini, settings, CronometerMessageColor2, Red
; Example: On-screen display (OSD) via transparent window:
CustomColor = EEAA99    ; Can be any RGB color (it will be made transparent below).
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s40  ; Set a large font size (32-point).
Gui, Add, Text, vMyText w1500 c%CronometerMessageColor1% Center  ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 255
if (CronometerHotkey1 = "")
{
CronometerHotkey1 := +!Esc
}
if (CronometerHotkey2 = "")
{
CronometerHotkey2 := +!Esc
}
if (CronometerHotkey3 = "")
{
CronometerHotkey3 := +!Esc
}
if (CronometerHotkey4 = "")
{
CronometerHotkey4 := +!Esc
}
if (CronometerHotkey5 = "")
{
CronometerHotkey5 := +!Esc
}
if (CronometerHotkey6 = "")
{
CronometerHotkey6 := +!Esc
}


Hotkey,%CronometerHotkey1%,Remap1
Hotkey,%CronometerHotkey2%,Remap2
Hotkey,%CronometerHotkey3%,Remap3
Hotkey,%CronometerHotkey4%,Remap4
Hotkey,%CronometerHotkey5%,Remap5
Hotkey,%CronometerHotkey6%,Remap6


SetTimer, bumpclock, 100
Gui, Font, c%CronometerMessageColor2%
Gui, Show, NoActivate  ; NoActivate avoids deactivating the currently active window.
return

bumpclock:
{
  milisecond++
  if milisecond >= 10
  {
    milisecond = 0
    second++
    GuiControl, Font, MyText
  if second >= %CronometerSeconds%
  {
    GuiControl,, MyText, %CronometerMessage%
    Sleep, %CronometerMessageDelay%
    SetTimer, bumpclock, off
    GuiControl, Hide, MyText
    

  }
}
myMessage = %second%:%milisecond%
GuiControl,, MyText, %myMessage%

Return
}

 
Return
Remap1:
{
Suspend
Send, {%CronometerHotkey1%}
Reload
ExitApp
}
Remap2:
{
Suspend
Send, {%CronometerHotkey2%}
Reload
ExitApp
}
Remap3:
{
Suspend
Send, {%CronometerHotkey3%}
Reload
ExitApp
}
Remap4:
{
Suspend
Send, {%CronometerHotkey4%}
Reload
ExitApp
}
Remap5:
{
Suspend
Send, {%CronometerHotkey5%}
Reload
ExitApp
}
Remap6:
{
Suspend
Send, {%CronometerHotkey6%}
Reload
ExitApp
}