class SpellController{
	__Init() {
		characterPortrait1 := [600,1000]
		characterPortrait2 := [750,1000]
		characterPortrait3 := [900,1000]
		characterPortrait4 := [1000,1000]
		characterPortrait5 := [1150, 1000]
		characterPortrait6 := [1300, 1000]
		
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

	spell_1 := [30,30]
	spell_2 := [30,90]
	spell_3 := [30,150]
	spell_4 := [30,200]
	spell_5 := [30,270]
	spell_6 := [30,320]
	spell_7 := [30,370]

	quickSpell:=4500

}

castBuff(characterCasting, castOnCharacter,  spell, waitAfter:=0){
	MouseClick, left, characterCasting[1], characterCasting[2]
	MouseClick, left, spell[1], spell[2]
	if(castOnCharacter){
		MouseClick, left, castOnCharacter[1], castOnCharacter[2]
	}else{
		MouseClick, left
	}
	if(waitAfter){
		Sleep waitAfter
	}
	Return
}

F12::
	;party
	;main, Ulbrig, Seelah, Lann, Ember, Daeran

	;Ember
	emberSpells()
	
	;Daeran
	daeranSpells()
	Return
	
;F11::
	debug()
	Return
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
	
emberSpells(){
	spellController := new SpellController
	castBuff(spellController.selectCasterCharacter5, spellController.castOncharacter4, spellController.spell_1, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter5, spellController.castOncharacter5, spellController.spell_1, spellController.quickSpell)
	
	castBuff(spellController.selectCasterCharacter5, spellController.castOncharacter1, spellController.spell_2, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter5, spellController.castOncharacter2, spellController.spell_2, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter5, spellController.castOncharacter3, spellController.spell_2, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter5, spellController.castOncharacter4, spellController.spell_2, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter5, spellController.castOncharacter5, spellController.spell_2, spellController.quickSpell)
	castBuff(spellController.selectCasterCharacter5, spellController.castOncharacter6, spellController.spell_2)
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