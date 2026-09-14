#NoEnv
#SingleInstance Force
SetKeyDelay, 50, 50       ; Forces the game engine to notice keys
SendMode Event            ; Switches from SendInput to SendEvent

AutoWalk := false         ; Initialize the tracking variable

#IfWinActive ahk_exe KingdomCome.exe

Up::
AutoWalk := true
Send {LShift down}       ; KCD defaults Shift to sprinting/running
Return

~+w::disableAutoWalk()
~+s::disableAutoWalk()
~+a::disableAutoWalk()
~+d::disableAutoWalk()
~+Escape::disableAutoWalk()

+Space::
disableAutoWalk()
Send {Space}
Return

+1::
disableAutoWalk()
Send 1
Return

+2::
disableAutoWalk()
Send 2
Return

+m::
disableAutoWalk()
Send m
Return

+i::
disableAutoWalk()
Send i
Return

+j::
disableAutoWalk()
Send j
Return

#IfWinActive

; Fixed function to correctly modify the global variable
disableAutoWalk() {
    global AutoWalk
    if (AutoWalk) {
        AutoWalk := false
        Send {LShift up}
    }
}
