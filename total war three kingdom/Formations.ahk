^Numpad1::

SendInput, {z down}
Sleep 1000
SendInput, {z up}
SendInput, {x down}
Sleep 500
SendInput, {x up}
Return
;ungrouped army
unitColumns := [340, 400, 460, 620, 670, 720, 870, 920 ]
unitRows := [900, 1000]
general_1 := [283, 955]
general_2 := [543, 952]
general_3 := [808, 947]

;first line infantry
MouseMove, unitColumns[4], unitRows[1]
SendInput, {Ctrl down}{Click down}
Sleep 200
SendInput, {Click up}
SendInput, {Ctrl down}{Click down}
Sleep 200
SendInput, {Click up}{Ctrl up}
MouseMove, 885,484
SendInput, {RButton}

; second line infantry
MouseMove, unitColumns[5], unitRows[1]
SendInput, {Ctrl down}{Click down}
Sleep 200
SendInput, {Click up}
SendInput, {Ctrl down}{Click down}
Sleep 200
SendInput, {Click up}{Ctrl up}
MouseMove, unitColumns[2], unitRows[1]
SendInput, ^{Click}
MouseMove, 937, 523
SendInput, {RButton}

MouseMove, unitColumns[2], unitRows[2]
SendInput {Click}
MouseMove, 942, 413
SendInput, {RButton}

;third line archers
MouseMove, unitColumns[7], unitRows[1]
SendInput, {Ctrl down}{Click down}
Sleep 200
SendInput, {Click up}
SendInput, {Ctrl down}{Click down}
Sleep 200
SendInput, {Click up}{Ctrl up}
Sleep 200
SendInput, {PgDn down}
Sleep 200
Sendinput, {PgDn up}
MouseMove, 988, 491
SendInput, {RButton}

;calvery
MouseMove, unitColumns[1], unitRows[1]
SendInput, {Click}
MouseMove, unitColumns[3], unitRows[1]
SendInput, ^{Click}
MouseMove, 1067, 746
SendInput, {RButton}

MouseMove, unitColumns[1], unitRows[2]
SendInput, {Click}
MouseMove, unitColumns[3], unitRows[2]
SendInput, ^{Click}
MouseMove, 1072, 219
SendInput, {RButton}

;position generals
MouseMove, general_2[1], general_2[2]
SendInput, {Click}
MouseMove, 976, 466
SendInput, {RButton}

;position generals
MouseMove, general_1[1], general_1[2]
SendInput, {Click}
MouseMove, 977, 506
SendInput, {RButton}

;position generals
MouseMove, general_3[1], general_3[2]
SendInput, {Click}
MouseMove, 1040, 504
SendInput, {RButton}

SendInput, {home down}
Sleep 200
SendInput, {home up}
SendInput, {PgUp down}
Sleep 200
SendInput, {PgUp up}