#Include %A_ScriptDir%\maw-muter.ahk
#Persistent
#SingleInstance Force
SetTitleMatchMode, 2

; Get the directory of the AutoHotkey script for svcl to work
ScriptDir := A_ScriptDir

HotkeyFile := ScriptDir . "\Hotkey.txt"
if (!FileExist(HotkeyFile)) {
    MsgBox, Hotkey.txt has been automatically created with the default hotkey F1 because it wasn't found in script's directory.`n`nTo change the hotkey, open Hotkey.txt in the script folder and replace "F1" with your preferred key.
    FileAppend, F1, %HotkeyFile%
}

Hotkey := ""

; Check if the script is running for the first time
if (A_PriorHotkey = "") {
    ; Read the hotkey from the external file "Hotkey.txt" in the Config folder
    FileReadLine, Hotkey, %HotkeyFile%, 1 ; Read the first line

    if (Hotkey != "") {
        HotkeyName := "RunMute"
        Hotkey, %Hotkey%, %HotkeyName% ; Call RunMute when the hotkey is pressed
    }
}

RunMute:
    if (A_ThisHotkey = Hotkey) {
        WindowEXE := WinExist("A")
        ControlGetFocus, FocusedControl, ahk_id %WindowEXE%
        ControlGet, Hwnd, Hwnd,, %FocusedControl%, ahk_id %WindowEXE%
        WinGet, simplexe, processname, ahk_id %Hwnd%
        WinGet, Pid, Pid, ahk_id %Hwnd%
        MAWAHK(simplexe)
    }
return