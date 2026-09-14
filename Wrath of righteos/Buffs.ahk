class SpellController{
	__Init() {
		characterPortrait1 := [637,1144]
		characterPortrait2 := [765,1144]
		characterPortrait3 := [891,1144]
		characterPortrait4 := [1018,1144]
		characterPortrait5 := [1150, 1144]
		characterPortrait6 := [1276, 1144]
		
		this.selectCasterCharacter1 := characterPortrait1
		this.selectCasterCharacter2 := characterPortrait2
		this.selectCasterCharacter3 := characterPortrait3
		this.selectCasterCharacter4 := characterPortrait4
		this.selectCasterCharacter5 := characterPortrait5
		this.selectCasterCharacter6 := characterPortrait6
		
		this.castOncharacter1 := characterPortrait1
		this.castOncharacter2 := characterPortrait2
		this.castOncharacter3 := characterPortrait3
		this.castOncharacter4 := characterPortrait4
		this.castOncharacter5 := characterPortrait5
		this.castOncharacter6 := characterPortrait6
	}

	spell_1 := [25,30]
	spell_2 := [25,90]
	spell_3 := [25,150]
	spell_4 := [25,200]
	spell_5 := [25,270]
	spell_6 := [25,320]
	spell_7 := [25,370]

	quickSpell:=4500

}

castBuff(characterCasting, castOnCharacter,  spell, waitAfter:=0){
	; Never send clicks to another program if Wrath is closed or loses focus.
	if (!IsWrathActive())
		Return false

	MouseClick, left, characterCasting[1], characterCasting[2]
	if (!IsWrathActive())
		Return false

	MouseClick, left, spell[1], spell[2]
	if (!IsWrathActive())
		Return false

	if(castOnCharacter){
		MouseClick, left, castOnCharacter[1], castOnCharacter[2]
	}else{
		MouseClick, left
	}
	if(waitAfter){
		Sleep waitAfter
	}
	Return IsWrathActive()
}

#IfWinExist ahk_exe Wrath.exe

F12::
	if (!WinActive("ahk_exe Wrath.exe")) {
		WinActivate, ahk_exe Wrath.exe
		WinWaitActive, ahk_exe Wrath.exe, , 1
	}

	if (!WinActive("ahk_exe Wrath.exe"))
		Return

	spellController := new SpellController
	castBuff(spellController.selectCasterCharacter1, spellController.castOncharacter1, spellController.spell_1, spellController.quickSpell)
	Return
	
#IfWinExist

IsWrathActive(){
	Process, Exist, Wrath.exe
	Return ErrorLevel && WinActive("ahk_exe Wrath.exe")
}

; Debug hotkey intentionally disabled. The debug() function remains below for manual use.
debug(){
	spellController := new SpellController
	castBuff(spellController.selectCasterCharacter6, false, spellController.spell_3, spellController.quickSpell)
	MouseMove, spellController.spell_4[1], spellController.spell_4[2]
	Sleep 1000
	MouseMove, spellController.spell_5[1], spellController.spell_5[2]
	Sleep 1000
	MouseMove, spellController.spell_6[1], spellController.spell_6[2]
	Sleep 1000
	MouseMove, spellController.spell_7[1], spellController.spell_7[2]
	
	Return
}

sariaSpells(){
	spellController := new SpellController
	
	; Character 1 casts spell 1 on character 1.
	castBuff(spellController.selectCasterCharacter1, spellController.castOncharacter1, spellController.spell_1, spellController.quickSpell)
}
	
emberSpells(){
	spellController := new SpellController
	
	;spell 1
	castBuff(spellController.selectCasterCharacter5, spellController.castOncharacter4, spellController.spell_1, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter5, spellController.castOncharacter5, spellController.spell_1, spellController.quickSpell)

	;spell 2
	castBuff(spellController.selectCasterCharacter5, false, spellController.spell_2, spellController.quickSpell)
	Return
}

daeranSpells(){
	spellController := new SpellController
	
	;spell 1
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter1, spellController.spell_1, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter2, spellController.spell_1, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter4, spellController.spell_1, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter5, spellController.spell_1, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter6, spellController.spell_1, spellController.quickSpell)
	
	;spell 2
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter1, spellController.spell_2, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter2, spellController.spell_2, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter3, spellController.spell_2, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter4, spellController.spell_2, spellController.quickSpell)
	
	;spell 3
	castBuff(spellController.selectCasterCharacter6, false, spellController.spell_3, spellController.quickSpell)
	
	;spell 4
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter1, spellController.spell_4, spellController.quickSpell)
	
	;spell 5
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter4, spellController.spell_5, spellController.quickSpell)
	
	;spell 6
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter1, spellController.spell_6, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter2, spellController.spell_6, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter3, spellController.spell_6, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter4, spellController.spell_6, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter5, spellController.spell_6, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter6, spellController.spell_6, spellController.quickSpell)
	
	;spell 7
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter1, spellController.spell_7, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter2, spellController.spell_7, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter3, spellController.spell_7, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter4, spellController.spell_7, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter5, spellController.spell_7, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter6, spellController.castOncharacter6, spellController.spell_7)
	Return
}
