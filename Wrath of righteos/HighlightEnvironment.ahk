highlightEnabled := false

#NoEnv
#SingleInstance Force

; Bind only while Wrath exists; fullscreen/borderless windows may not reliably
; report themselves as active even when the game is receiving input.
#IfWinExist ahk_exe Wrath.exe

$Numpad2::
highlightEnabled := false
SetTimer, RefreshHold, Off
SendInput {Numpad1 up}
Return

$Numpad1::
if (!WinActive("ahk_exe Wrath.exe")) {
    WinActivate, ahk_exe Wrath.exe
    WinWaitActive, ahk_exe Wrath.exe, , 1
}

if (!WinActive("ahk_exe Wrath.exe"))
    Return

highlightEnabled := !highlightEnabled

if (highlightEnabled) {
    SendInput {Numpad1 down}
    SetTimer, RefreshHold, 2000
} else {
    SetTimer, RefreshHold, Off
    SendInput {Numpad1 up}
}
Return

#IfWinExist

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
