highlightEnabled:=false

Numpad2::
highlightEnabled:=false
Return

$Numpad1::
highlightEnabled:=!highlightEnabled


	Loop{
		Send {Numpad1 down}
		Sleep 1000
		Send {Numpad1 up}
	} Until (highlightEnabled = false)
Return