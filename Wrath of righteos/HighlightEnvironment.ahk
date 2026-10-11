highlightEnabled := false

#NoEnv
#SingleInstance Force

; Only accept the hotkeys while Wrath is the focused application.
#IfWinActive ahk_exe Wrath.exe

$Numpad2::
highlightEnabled := false
SetTimer, RefreshHold, Off
SendInput {Numpad1 up}
Return

$Numpad1::
highlightEnabled := !highlightEnabled

if (highlightEnabled) {
    SendInput {Numpad1 down}
    SetTimer, RefreshHold, 2000
} else {
    SetTimer, RefreshHold, Off
    SendInput {Numpad1 up}
}
Return

#IfWinActive

RefreshHold:
; Stop cleanly if the game has been closed, so Numpad1 can never remain held.
Process, Exist, Wrath.exe
if (!ErrorLevel) {
    highlightEnabled := false
    SetTimer, RefreshHold, Off
    SendInput {Numpad1 up}
    Return
}

; Do not send Numpad1 to another application while the game is unfocused.
if (highlightEnabled && WinActive("ahk_exe Wrath.exe")) {
    SendInput {Numpad1 up}
    Sleep 50
    SendInput {Numpad1 down}
} else {
    SendInput {Numpad1 up}
}
Return
