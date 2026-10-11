class SpellController{
	__Init() {
		characterPortrait1 := [637,1144]
		characterPortrait2 := [765,1144]
		characterPortrait3 := [891,1144]
		characterPortrait4 := [1020,1144]
		characterPortrait5 := [1150, 1144]
		characterPortrait6 := [1280,1144]

		; Click these buttons to show the corresponding animal companion.
		; The companion then occupies the next portrait slot to that character's right.
		animalCompanionButtonCharacter1 := [637,1185]
		animalCompanionButtonCharacter2 := [765,1185]
		animalCompanionButtonCharacter3 := [891,1185]
		animalCompanionButtonCharacter4 := [1020,1185]
		animalCompanionButtonCharacter5 := [1150,1185]
		animalCompanionButtonCharacter6 := [1280,1185]
		
		this.selectCasterCharacter1 := characterPortrait1
		this.selectCasterCharacter2 := characterPortrait2
		this.selectCasterCharacter3 := characterPortrait3
		this.selectCasterCharacter3WithCompanion := characterPortrait4
		this.selectCasterCharacter5 := characterPortrait5
		this.selectCasterCharacter5WithCompanion := characterPortrait6
		
		this.castOncharacter1 := characterPortrait1
		this.castOncharacter2 := characterPortrait2
		this.castOncharacter3 := characterPortrait3
		this.castOncharacter4 := characterPortrait4
		this.castOncharacter5 := characterPortrait5
		this.castOnAnimalCompanionCharacter1 := characterPortrait2
		this.castOnAnimalCompanionCharacter2 := characterPortrait3

		this.animalCompanionButtonCharacter1 := animalCompanionButtonCharacter1
		this.animalCompanionButtonCharacter2 := animalCompanionButtonCharacter2
		this.animalCompanionButtonCharacter3 := animalCompanionButtonCharacter3
		this.animalCompanionButtonCharacter4 := animalCompanionButtonCharacter4
		this.animalCompanionButtonCharacter5 := animalCompanionButtonCharacter5
		this.animalCompanionButtonCharacter6 := animalCompanionButtonCharacter6
	}

	spell_1 := [25,30]
	spell_2 := [25,90]
	spell_3 := [25,150]
	spell_4 := [25,210]
	spell_5 := [25,270]
	spell_6 := [25,330]
	spell_7 := [25,390]
	spell_8 := [25,450]
	spell_9 := [25,510]

	quickSpell:=4000 ;This is for a standard cast, use this between all spell casts when multiple spells are being casted by a character
	longSpell:=8000  ;A spell that takes a long time to cast
}

buffSequenceRunning := false

castTargetedSpell(characterCasting, castOnCharacter, spell, waitAfter:=0){
	; Never send clicks to another program if Wrath is closed or loses focus.
	if (!IsWrathActive() || !IsBuffSequenceRunning())
		Return false

	MouseClick, left, characterCasting[1], characterCasting[2]
	if (!IsWrathActive() || !IsBuffSequenceRunning())
		Return false

	MouseClick, left, spell[1], spell[2]
	if (!IsWrathActive() || !IsBuffSequenceRunning())
		Return false

	MouseClick, left, castOnCharacter[1], castOnCharacter[2]
	if(waitAfter){
		Sleep waitAfter
	}
	Return IsWrathActive() && IsBuffSequenceRunning()
}

castPersonalSpell(characterCasting, spell, waitAfter:=0){
	if (!IsWrathActive() || !IsBuffSequenceRunning())
		Return false

	MouseClick, left, characterCasting[1], characterCasting[2]
	if (!IsWrathActive() || !IsBuffSequenceRunning())
		Return false

	; Personal spells cast on the selected caster without a target click.
	MouseClick, left, spell[1], spell[2]
	if(waitAfter){
		Sleep waitAfter
	}
	Return IsWrathActive() && IsBuffSequenceRunning()
}

toggleAnimalCompanion(animalCompanionButton){
	if (!IsWrathActive() || !IsBuffSequenceRunning())
		Return false

	MouseClick, left, animalCompanionButton[1], animalCompanionButton[2]
	Return IsWrathActive() && IsBuffSequenceRunning()
}

#IfWinActive ahk_exe Wrath.exe

F12::
	if (buffSequenceRunning)
		Return

	buffSequenceRunning := true
	BeginBuffCancellationWatch()
	spellController := new SpellController

	; Character 1: spell 1 is personal; spell 2 targets themself.
	if (!castPersonalSpell(spellController.selectCasterCharacter1, spellController.spell_1, spellController.quickSpell))
		Return
	; No delay after the final character 1 spell: move straight to character 3.
	if (!castTargetedSpell(spellController.selectCasterCharacter1, spellController.castOncharacter1, spellController.spell_2))
		Return

	; Character 2: spell 1 targets themself. Move straight to character 3 afterward.
	if (!castTargetedSpell(spellController.selectCasterCharacter2, spellController.castOncharacter2, spellController.spell_1))
		Return

	; Character 3: spell 1 is personal; spells 2 and 3 target themself; spell 3 then targets character 2 and their companion.
	if (!castPersonalSpell(spellController.selectCasterCharacter3, spellController.spell_1, spellController.quickSpell))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter3, spellController.castOncharacter3, spellController.spell_2, spellController.quickSpell))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter3, spellController.castOncharacter3, spellController.spell_3, spellController.quickSpell))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter3, spellController.castOncharacter2, spellController.spell_3, spellController.quickSpell))
		Return
	if (!toggleAnimalCompanion(spellController.animalCompanionButtonCharacter2))
		Return
	; With character 2's companion displayed, character 3 shifts to slot 4 and the companion occupies slot 3.
	if (!castTargetedSpell(spellController.selectCasterCharacter3WithCompanion, spellController.castOnAnimalCompanionCharacter2, spellController.spell_3))
		Return
	; Close the companion UI before moving to character 5.
	if (!toggleAnimalCompanion(spellController.animalCompanionButtonCharacter2))
		Return

	; Character 5: spells 1 and 2 target themself; spell 3 targets character 2 and character 1's companion.
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter5, spellController.spell_1, spellController.quickSpell))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter5, spellController.spell_2, spellController.quickSpell))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter2, spellController.spell_3, spellController.quickSpell))
		Return
	if (!toggleAnimalCompanion(spellController.animalCompanionButtonCharacter1))
		Return
	; With character 1's companion displayed, character 5 shifts to slot 6 and the companion occupies slot 2.
	if (!castTargetedSpell(spellController.selectCasterCharacter5WithCompanion, spellController.castOnAnimalCompanionCharacter1, spellController.spell_3, spellController.quickSpell))
		Return
	if (!toggleAnimalCompanion(spellController.animalCompanionButtonCharacter1))
		Return

	; Spell 4 targets character 2, their companion, character 1's companion, character 1, then character 3.
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter2, spellController.spell_4, spellController.quickSpell))
		Return
	if (!toggleAnimalCompanion(spellController.animalCompanionButtonCharacter2))
		Return
	; With character 2's companion displayed, character 5 shifts to slot 6 and the companion occupies slot 3.
	if (!castTargetedSpell(spellController.selectCasterCharacter5WithCompanion, spellController.castOnAnimalCompanionCharacter2, spellController.spell_4, spellController.quickSpell))
		Return
	; Close the companion UI so following portrait coordinates return to normal.
	if (!toggleAnimalCompanion(spellController.animalCompanionButtonCharacter2))
		Return
	if (!toggleAnimalCompanion(spellController.animalCompanionButtonCharacter1))
		Return
	; With character 1's companion displayed, character 5 shifts to slot 6 and the companion occupies slot 2.
	if (!castTargetedSpell(spellController.selectCasterCharacter5WithCompanion, spellController.castOnAnimalCompanionCharacter1, spellController.spell_4, spellController.quickSpell))
		Return
	if (!toggleAnimalCompanion(spellController.animalCompanionButtonCharacter1))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter1, spellController.spell_4, spellController.quickSpell))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter3, spellController.spell_4, spellController.quickSpell))
		Return

	; Spell 5 targets characters 4, then 3.
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter4, spellController.spell_5, spellController.quickSpell))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter3, spellController.spell_5, spellController.quickSpell))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter2, spellController.spell_6, spellController.quickSpell))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter1, spellController.spell_7, spellController.quickSpell))
		Return
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter5, spellController.spell_7, spellController.quickSpell))
		Return

	; Spell 8 targets character 4.
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter4, spellController.spell_8, spellController.longSpell))
		Return

	; Spell 9 targets character 5.
	if (!castTargetedSpell(spellController.selectCasterCharacter5, spellController.castOncharacter5, spellController.spell_9))
		Return

	EndBuffSequence()
	ToolTip, Buffs complete, 850, 100
	SetTimer, HideBuffMessage, -2500
	Return
	
#IfWinActive

CancelBuffSequence:
	EndBuffSequence("Buffs cancelled")
	Return

WatchBuffSequence:
	if (IsBuffSequenceRunning() && !IsWrathActive())
		EndBuffSequence("Buffs cancelled")
	Return

IsWrathActive(){
	Process, Exist, Wrath.exe
	Return ErrorLevel && WinActive("ahk_exe Wrath.exe")
}

IsBuffSequenceRunning(){
	global buffSequenceRunning
	Return buffSequenceRunning
}

BeginBuffCancellationWatch(){
	; Register every physical keyboard key except F12, which starts the buff sequence.
	Hotkey, IfWinActive, ahk_exe Wrath.exe
	Loop, 255 {
		if (A_Index = 0x58) ; F12's physical scan code.
			Continue

		keyName := "~*sc" . Format("{:03X}", A_Index)
		Hotkey, %keyName%, CancelBuffSequence, On
	}
	Hotkey, IfWinActive
	SetTimer, WatchBuffSequence, 100
}

EndBuffSequence(message := ""){
	global buffSequenceRunning

	buffSequenceRunning := false
	SetTimer, WatchBuffSequence, Off
	DisableBuffCancellationWatch()

	if (message != "") {
		ToolTip, %message%, 850, 100
		SetTimer, HideBuffMessage, -2500
	}
}

DisableBuffCancellationWatch(){
	Hotkey, IfWinActive, ahk_exe Wrath.exe
	Loop, 255 {
		if (A_Index = 0x58)
			Continue

		keyName := "~*sc" . Format("{:03X}", A_Index)
		Hotkey, %keyName%, Off
	}
	Hotkey, IfWinActive
}

HideBuffMessage:
ToolTip
Return
