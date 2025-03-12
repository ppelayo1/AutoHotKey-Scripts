disableAutoWalk(AutoWalk){
	if (AutoWalk){
		AutoWalk := false
		SendInput {LShift up}
	}
}

Up::
AutoWalk := true
SendInput  {LShift down}
Return

~+w::
disableAutoWalk(AutoWalk)
Return

~+s::
disableAutoWalk(AutoWalk)
Return


~+d::
disableAutoWalk(AutoWalk)
Return

~+a::
disableAutoWalk(AutoWalk)
Return

~+Escape::
disableAutoWalk(AutoWalk)
Return

+Space::
disableAutoWalk(AutoWalk)
SendInput Space
Return

+1::
disableAutoWalk(AutoWalk)
SendInput 1
Return

+2::
disableAutoWalk(AutoWalk)
SendInput 2
Return

+m::
disableAutoWalk(AutoWalk)
SendInput m
Return

+i::
disableAutoWalk(AutoWalk)
SendInput i
Return

+j::
disableAutoWalk(AutoWalk)
SendInput j
Return