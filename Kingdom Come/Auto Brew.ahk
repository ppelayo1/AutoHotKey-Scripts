F8::toggle := !toggle

F7::
toggle := true
Loop
{
	MouseMove, 0,0
	MouseMove, 5000, 5000
	Sleep 100
	Send e
	sleep 1000
	Send {f down} 
	Sleep 1000
	Send {f up}
	Sleep 3000
} Until (toggle = false)

Return