Scriptname FFDiamondCity07PaperScript extends ObjectReference

Book Property Publick_Interview_01A Auto Const
Book Property Publick_Interview_01B Auto Const
Book Property Publick_Interview_01C Auto Const
Book Property Publick_Interview_02A Auto Const
Book Property Publick_Interview_02B Auto Const
Book Property Publick_Interview_02C Auto Const
Book Property Publick_Interview_02D Auto Const
Book Property Publick_Interview_03A Auto Const
Book Property Publick_Interview_03B Auto Const
Book Property Publick_Interview_03C Auto Const
Book Property Publick_Interview_02A_SMUalt Auto Const
Book Property Publick_Interview_02B_SMUalt Auto Const
Book Property Publick_Interview_02C_SMUalt Auto Const
Book Property Publick_Interview_02D_SMUalt Auto Const
Book Property Publick_Interview_03A_SMUalt Auto Const
Book Property Publick_Interview_03B_SMUalt Auto Const
Book Property Publick_Interview_03C_SMUalt Auto Const
GlobalVariable Property pSMU_FollowedVanillaPath Auto Const
MiscObject Property FFDiamondCity07Paper Auto Const
Book Property Publick_Interview_01_SMUalt Auto Const
Book Property Publick_Interview_02A_SMUalt2 Auto Const
Book Property Publick_Interview_02B_SMUalt2 Auto Const
Book Property Publick_Interview_02C_SMUalt2 Auto Const
Book Property Publick_Interview_02D_SMUalt2 Auto Const
GlobalVariable Property pSMU_VaultStart Auto Const
Book Property Publick_Interview_03A_SMUalt2 Auto Const
Book Property Publick_Interview_03B_SMUalt2 Auto Const
Book Property Publick_Interview_03C_SMUalt2 Auto Const

FFDiamondCity07Script Property FFDiamondCity07 Auto Const

Bool DOONCE = True

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If (akNewContainer == Game.GetPlayer()) && (DOONCE)
		DOONCE = False
		Actor PlayerREF = Game.GetPlayer()
		;remove this object silently
		PlayerREF.RemoveItem(FFDiamondCity07Paper, 1, true)

		;do the vanilla stuff
		if pSMU_FollowedVanillaPath.GetValueInt() > 0
		
			;add the correct articles
			If FFDiamondCity07.var_VaultLife == 1
				PlayerREF.AddItem(Publick_Interview_01A, 1)
			ElseIf FFDiamondCity07.var_VaultLife == 2
				PlayerREF.AddItem(Publick_Interview_01B, 1)
			ElseIf FFDiamondCity07.var_VaultLife == 3
				PlayerREF.AddItem(Publick_Interview_01C, 1)
			EndIf

			If FFDiamondCity07.var_Commonwealth == 1
				PlayerREF.AddItem(Publick_Interview_02A)
			ElseIf FFDiamondCity07.var_Commonwealth == 2
				PlayerREF.AddItem(Publick_Interview_02B)
			ElseIf FFDiamondCity07.var_Commonwealth == 3
				PlayerREF.AddItem(Publick_Interview_02C)
			ElseIf FFDiamondCity07.var_Commonwealth == 4
				PlayerREF.AddItem(Publick_Interview_02D)
			EndIf

			If FFDiamondCity07.var_LastWords == 1
				PlayerREF.AddItem(Publick_Interview_03A, 1)
			ElseIf FFDiamondCity07.var_LastWords == 2
				PlayerREF.AddItem(Publick_Interview_03B, 1)
			ElseIf FFDiamondCity07.var_LastWords == 3
				PlayerREF.AddItem(Publick_Interview_03C, 1)
			EndIf	

		;else, do the alt start stuff - vault start
		elseif pSMU_FollowedVanillaPath.GetValueInt() == 0 && pSMU_VaultStart.GetValueInt() > 0
		
			;add the correct articles
			If FFDiamondCity07.var_VaultLife == 1
				PlayerREF.AddItem(Publick_Interview_01A, 1)
			ElseIf FFDiamondCity07.var_VaultLife == 2
				PlayerREF.AddItem(Publick_Interview_01B, 1)
			ElseIf FFDiamondCity07.var_VaultLife == 3
				PlayerREF.AddItem(Publick_Interview_01C, 1)
			EndIf

			If FFDiamondCity07.var_Commonwealth == 1
				PlayerREF.AddItem(Publick_Interview_02A_SMUalt)
			ElseIf FFDiamondCity07.var_Commonwealth == 2
				PlayerREF.AddItem(Publick_Interview_02B_SMUalt)
			ElseIf FFDiamondCity07.var_Commonwealth == 3
				PlayerREF.AddItem(Publick_Interview_02C_SMUalt)
			ElseIf FFDiamondCity07.var_Commonwealth == 4
				PlayerREF.AddItem(Publick_Interview_02D_SMUalt)
			EndIf

			If FFDiamondCity07.var_LastWords == 1
				PlayerREF.AddItem(Publick_Interview_03A_SMUalt, 1)
			ElseIf FFDiamondCity07.var_LastWords == 2
				PlayerREF.AddItem(Publick_Interview_03B_SMUalt, 1)
			ElseIf FFDiamondCity07.var_LastWords == 3
				PlayerREF.AddItem(Publick_Interview_03C_SMUalt, 1)
			EndIf	

		;else, do the alt start stuff - non-vault start
		elseif pSMU_FollowedVanillaPath.GetValueInt() == 0 && pSMU_VaultStart.GetValueInt() == 0

			;add the correct articles
			If FFDiamondCity07.var_VaultLife == 1
				PlayerREF.AddItem(Publick_Interview_01_SMUalt, 1)
			ElseIf FFDiamondCity07.var_VaultLife == 2
				PlayerREF.AddItem(Publick_Interview_01_SMUalt, 1)
			ElseIf FFDiamondCity07.var_VaultLife == 3
				PlayerREF.AddItem(Publick_Interview_01_SMUalt, 1)
			EndIf

			If FFDiamondCity07.var_Commonwealth == 1
				PlayerREF.AddItem(Publick_Interview_02A_SMUalt2)
			ElseIf FFDiamondCity07.var_Commonwealth == 2
				PlayerREF.AddItem(Publick_Interview_02B_SMUalt2)
			ElseIf FFDiamondCity07.var_Commonwealth == 3
				PlayerREF.AddItem(Publick_Interview_02C_SMUalt2)
			ElseIf FFDiamondCity07.var_Commonwealth == 4
				PlayerREF.AddItem(Publick_Interview_02D_SMUalt)
			EndIf

			If FFDiamondCity07.var_LastWords == 1
				PlayerREF.AddItem(Publick_Interview_03A_SMUalt2, 1)
			ElseIf FFDiamondCity07.var_LastWords == 2
				PlayerREF.AddItem(Publick_Interview_03B_SMUalt2, 1)
			ElseIf FFDiamondCity07.var_LastWords == 3
				PlayerREF.AddItem(Publick_Interview_03C_SMUalt2, 1)
			EndIf	
			
		endif
	EndIf		
EndEvent



