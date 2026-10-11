#NoEnv
#SingleInstance Force
SendMode Input
SetBatchLines, -1

clicking := false
RegisterCancelKeys()
Return

#IfWinActive ahk_exe Wrath.exe

Numpad9::
	if (!IsWrathActive())
		Return

	if (clicking)
		Return

	clicking := true
	; Ten clicks per second.
	SetTimer, AutoClick, 100
	Return

#IfWinActive

AutoClick:
	if (!clicking || !IsWrathActive()) {
		StopAutoClicker()
		Return
	}

	Click
	Return

CancelAutoClicker:
	if (clicking)
		StopAutoClicker()
	Return

StopAutoClicker() {
	global clicking

	clicking := false
	SetTimer, AutoClick, Off
}

RegisterCancelKeys() {
	; Assign every physical keyboard key except NumPad 9 to the cancel label.
	; The tilde keeps the pressed key available to Wrath as normal.
	Hotkey, IfWinActive, ahk_exe Wrath.exe
	Loop, 255 {
		if (A_Index = 0x49) ; NumPad 9's physical scan code.
			Continue

		keyName := "~*sc" . Format("{:03X}", A_Index)
		Hotkey, %keyName%, CancelAutoClicker, On
	}
	Hotkey, IfWinActive
}

IsWrathActive() {
	Process, Exist, Wrath.exe
	Return ErrorLevel && WinActive("ahk_exe Wrath.exe")
}
