highlightEnabled := false

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

RefreshHold:
if (highlightEnabled) {
    SendInput {Numpad1 up}
    Sleep 50
    SendInput {Numpad1 down}
}
Return
