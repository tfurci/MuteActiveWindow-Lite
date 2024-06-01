#Include %A_ScriptDir%\maw-muter.ahk
#Persistent
#SingleInstance Force
SetTitleMatchMode, 2

; Get the directory of the AutoHotkey script for svcl to work
ScriptDir := A_ScriptDir

; Define a hotkey (F1) to toggle mute/unmute the active window
F1:: 
    WindowEXE := WinExist("A")
    ControlGetFocus, FocusedControl, ahk_id %WindowEXE%
    ControlGet, Hwnd, Hwnd,, %FocusedControl%, ahk_id %WindowEXE%
    WinGet, simplexe, processname, ahk_id %Hwnd%
    WinGet, Pid, Pid, ahk_id %Hwnd%
	MAWAHK(simplexe)