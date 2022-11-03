Scriptname StartMeUp:SMU_ShowTraitsMenu extends Terminal

GlobalVariable Property pSMU_FollowedVanillaPath Auto
GlobalVariable Property pSMU_VaultStart Auto
GlobalVariable Property pSMU_OldGifted Auto
GlobalVariable Property pSMU_OldSmallFrame Auto
bool PlayerTrait01 = false
bool PlayerTrait02 = false
bool PlayerTrait03 = false
bool PlayerTrait04 = false
bool PlayerTrait05 = false
bool PlayerTrait06 = false
bool PlayerTrait07 = false
bool PlayerTrait08 = false
bool PlayerTrait09 = false
bool PlayerTrait10 = false
bool PlayerTrait11 = false
bool PlayerTrait12 = false
bool PlayerTrait13 = false
bool PlayerTrait14 = false
bool PlayerTrait15 = false
bool PlayerTrait16 = false
bool PlayerTrait17 = false
bool PlayerTrait18 = false
bool PlayerTrait19 = false
bool OldSmallFrame = false
bool OldGifted = false
bool InMenu = True
int pressedButton = 0
int MessageCount = 0
Perk Property pSMU_PerkBroadShouldersNormal Auto Const
Perk Property pSMU_PerkBroadShouldersSurvival Auto Const
Perk Property pSMU_PerkBruiser Auto Const
Perk Property pSMU_PerkClaustrophobia Auto Const
Perk Property pSMU_PerkEarlyBird Auto Const
Perk Property pSMU_PerkFastMetabolism Auto Const
Perk Property pSMU_PerkFastShot Auto Const
Perk Property pSMU_PerkFinesse Auto Const
Perk Property pSMU_PerkFourEyes Auto Const
Perk Property pSMU_PerkGifted Auto Const
Perk Property pSMU_PerkGoodNatured Auto Const
Perk Property pSMU_PerkHeavyHanded Auto Const
Perk Property pSMU_PerkHotBlooded Auto Const
Perk Property pSMU_PerkKamikaze Auto Const
Perk Property pSMU_PerkLooseCannon Auto Const
Perk Property pSMU_PerkNightOwl Auto Const
Perk Property pSMU_PerkSmallFrame Auto Const
Perk Property pSMU_PerkTriggerDiscipline Auto Const
Perk Property pSMU_PerkUnsightly Auto Const
Perk Property pSMU_PerkGiftedDebuffOnly Auto Const
Perk Property pSMU_PerkSmallFrameDebuffOnly Auto Const
Message Property pSMU_Door5 Auto Const
Message Property pSMU_TraitNone Auto Const
Message Property pSMU_TraitBroadShoulders Auto Const
Message Property pSMU_TraitBruiser Auto Const
Message Property pSMU_TraitClaustrophobia Auto Const
Message Property pSMU_TraitEarlyBird Auto Const
Message Property pSMU_TraitFastMetabolism Auto Const
Message Property pSMU_TraitFastShot Auto Const
Message Property pSMU_TraitFinesse Auto Const
Message Property pSMU_TraitFourEyes Auto Const
Message Property pSMU_TraitGifted Auto Const
Message Property pSMU_TraitGoodNatured Auto Const
Message Property pSMU_TraitHeavyHanded Auto Const
Message Property pSMU_TraitHotBlooded Auto Const
Message Property pSMU_TraitKamikaze Auto Const
Message Property pSMU_TraitLooseCannon Auto Const
Message Property pSMU_TraitNightOwl Auto Const
Message Property pSMU_TraitSmallFrame Auto Const
Message Property pSMU_TraitTriggerDiscipline Auto Const
Message Property pSMU_TraitUnsightly Auto Const
ActorValue Property Strength Auto Const
ActorValue Property Perception Auto Const
ActorValue Property Endurance Auto Const
ActorValue Property Charisma Auto Const
ActorValue Property Intelligence Auto Const
ActorValue Property Agility Auto Const
ActorValue Property Luck Auto Const

auto STATE waitingForPlayer
Event OnMenuItemRun(int auiMenuItemID, ObjectReference akTarget)
	if auiMenuItemID == 9
			InMenu = True
			Actor PlayerREF = Game.GetPlayer()
			WHILE (InMenu)
			pressedButton = pSMU_Door5.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
			If (pressedButton == 0)
					; when the player leaves the traits menu, display a message of each trait that is selected
					If (PlayerTrait01 == false && PlayerTrait02 == false && PlayerTrait03 == false && PlayerTrait04 == false && PlayerTrait05 == false && PlayerTrait06 == false && PlayerTrait07 == false && PlayerTrait08 == false && PlayerTrait09 == false && PlayerTrait10 == false && PlayerTrait11 == false && PlayerTrait12 == false && PlayerTrait13 == false && PlayerTrait14 == false && PlayerTrait15 == false && PlayerTrait16 == false && PlayerTrait17 == false && PlayerTrait18 == false && OldGifted == false && OldSmallFrame == false)
						Debug.MessageBox("You have chosen to have no traits")
					Endif
					If (PlayerTrait01 == true)
						Debug.MessageBox("You have selected the Broad Shoulders trait")
					Endif
					If (PlayerTrait02 == true)
						Debug.MessageBox("You have selected the Bruiser trait")
					Endif
					If (PlayerTrait03 == true)
						Debug.MessageBox("You have selected the Claustrophobia trait")
					Endif
					If (PlayerTrait04 == true)
						Debug.MessageBox("You have selected the Early Bird trait")
					EndIf
					If (PlayerTrait05 == true)
						Debug.MessageBox("You have selected the Fast Metabolism trait")
					EndIf
					If (PlayerTrait06 == true)
						Debug.MessageBox("You have selected the Fast Shot trait")
					EndIf
					If (PlayerTrait07 == true)
						Debug.MessageBox("You have selected the Finesse trait")
					EndIf
					If (PlayerTrait08 == true)
						Debug.MessageBox("You have selected the Four Eyes trait")
					EndIf
					If (PlayerTrait09 == true) || (OldGifted == true)
						Debug.MessageBox("You have selected the Gifted trait")
					EndIf
					If (PlayerTrait10 == true)
						Debug.MessageBox("You have selected the Good Natured trait")
					EndIf
					If (PlayerTrait11 == true)
						Debug.MessageBox("You have selected the Heavy Handed trait")
					EndIf
					If (PlayerTrait12 == true)
						Debug.MessageBox("You have selected the Hot Blooded trait")
					EndIf
					If (PlayerTrait13 == true)
						Debug.MessageBox("You have selected the Kamikaze trait")
					EndIf
					If (PlayerTrait14 == true)
						Debug.MessageBox("You have selected the Loose Cannon trait")
					EndIf
					If (PlayerTrait15 == true)
						Debug.MessageBox("You have selected the Night Owl trait")
					EndIf
					If (PlayerTrait16 == true) || (OldSmallFrame == true)
						Debug.MessageBox("You have selected the Small Frame trait")
					EndIf
					If (PlayerTrait17 == true)
						Debug.MessageBox("You have selected the Trigger Discipline trait")
					EndIf
					If (PlayerTrait18 == true)
						Debug.MessageBox("You have selected the Unsightly trait")
					EndIf
					;add traits
					SMUaddTrait()
					InMenu = False ;exit the WHILE loop
			ElseIf (pressedButton == 1)
				;No traits message
				pSMU_TraitNone.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				;reset all traits
				PlayerTrait01 = false
				PlayerREF.removeperk(pSMU_PerkBroadShouldersSurvival)
				PlayerREF.removeperk(pSMU_PerkBroadShouldersNormal)
				PlayerTrait02 = false
				PlayerREF.removeperk(pSMU_PerkBruiser)
				PlayerTrait03 = false
				PlayerREF.removeperk(pSMU_PerkClaustrophobia)
				PlayerTrait04 = false
				PlayerREF.removeperk(pSMU_PerkEarlyBird)
				PlayerTrait05 = false
				PlayerREF.removeperk(pSMU_PerkFastMetabolism)	
				PlayerTrait06 = false
				PlayerREF.removeperk(pSMU_PerkFastShot)
				PlayerTrait07 = false
				PlayerREF.removeperk(pSMU_PerkFinesse)
				PlayerTrait08 = false
				PlayerREF.removeperk(pSMU_PerkFourEyes)
				PlayerTrait09 = false
				PlayerREF.removeperk(pSMU_PerkGifted)
				PlayerTrait10 = false
				PlayerREF.removeperk(pSMU_PerkGoodNatured)
				PlayerTrait11 = false
				PlayerREF.removeperk(pSMU_PerkHeavyHanded)
				PlayerTrait12 = false
				PlayerREF.removeperk(pSMU_PerkHotBlooded)
				PlayerTrait13 = false
				PlayerREF.removeperk(pSMU_PerkKamikaze)
				PlayerTrait14 = false
				PlayerREF.removeperk(pSMU_PerkLooseCannon)
				PlayerTrait15 = false
				PlayerREF.removeperk(pSMU_PerkNightOwl)
				PlayerTrait16 = false
				PlayerREF.removeperk(pSMU_PerkSmallFrame)
				PlayerTrait17 = false
				PlayerREF.removeperk(pSMU_PerkTriggerDiscipline)
				PlayerTrait18 = false
				PlayerREF.removeperk(pSMU_PerkUnsightly)
				OldGifted = false
				if pSMU_OldSmallFrame.GetValueInt() == 1 ;if they already had small frame
					Game.GetPlayer().SetValue(Agility, Game.GetPlayer().GetBaseValue(Agility) - 2 as float)
					PlayerREF.removeperk(pSMU_PerkSmallFrameDebuffOnly)
					pSMU_OldSmallFrame.SetValueInt(0)
				endif
				OldSmallFrame = false
				if pSMU_OldGifted.GetValueInt() == 1 ;if they already had gifted
					Game.GetPlayer().SetValue(Strength, Game.GetPlayer().GetBaseValue(Strength) - 2 as float)
					Game.GetPlayer().SetValue(Perception, Game.GetPlayer().GetBaseValue(Perception) - 2 as float)
					Game.GetPlayer().SetValue(Endurance, Game.GetPlayer().GetBaseValue(Endurance) - 2 as float)
					Game.GetPlayer().SetValue(Charisma, Game.GetPlayer().GetBaseValue(Charisma) - 2 as float)
					Game.GetPlayer().SetValue(Intelligence, Game.GetPlayer().GetBaseValue(Intelligence) - 2 as float)
					Game.GetPlayer().SetValue(Agility, Game.GetPlayer().GetBaseValue(Agility) - 2 as float)
					Game.GetPlayer().SetValue(Luck, Game.GetPlayer().GetBaseValue(Luck) - 2 as float)
					PlayerREF.removeperk(pSMU_PerkGiftedDebuffOnly)
					pSMU_OldGifted.SetValueInt(0)
				endif
			ElseIf (pressedButton == 2)
				pressedButton = pSMU_TraitBroadShoulders.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait01 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 3)
				pressedButton = pSMU_TraitBruiser.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait02 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 4)
				pressedButton = pSMU_TraitClaustrophobia.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait03 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 5)
				pressedButton = pSMU_TraitEarlyBird.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait04 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 6)
				pressedButton = pSMU_TraitFastMetabolism.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait05 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 7)
				pressedButton = pSMU_TraitFastShot.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait06 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 8)
				pressedButton = pSMU_TraitFinesse.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait07 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 9)
				pressedButton = pSMU_TraitFourEyes.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait08 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 10)
				pressedButton = pSMU_TraitGifted.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait09 = true
					OldGifted = false
					MessageCount = 5
				elseif (pressedButton == 1)
					OldGifted = true
					PlayerTrait09 = false
					MessageCount = 5
				elseif (pressedButton == 2)
					MessageCount = 5
				endif
			ElseIf (pressedButton == 11)
				pressedButton = pSMU_TraitGoodNatured.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait10 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 12)
				pressedButton = pSMU_TraitHeavyHanded.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait11 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 13)
				pressedButton = pSMU_TraitHotBlooded.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait12 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 14)
				pressedButton = pSMU_TraitKamikaze.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait13 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 15)
				pressedButton = pSMU_TraitLooseCannon.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait14 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 16)
				pressedButton = pSMU_TraitNightOwl.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait15 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 17)
				pressedButton = pSMU_TraitSmallFrame.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait16 = true
					OldSmallFrame = false
					MessageCount = 5
				elseif (pressedButton == 1)
					OldSmallFrame = true
					PlayerTrait16 = false
					MessageCount = 5
				elseif (pressedButton == 1)
					MessageCount = 5
				endif
			ElseIf (pressedButton == 18)
				pressedButton = pSMU_TraitTriggerDiscipline.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait17 = true
				elseif (pressedButton == 1)
				endif
			ElseIf (pressedButton == 19)
				pressedButton = pSMU_TraitUnsightly.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0)
					PlayerTrait18 = true
				elseif (pressedButton == 1)
				endif
			EndIf ;traits message box
		endwhile
	endif ;if menuitemid
EndEvent
EndState

;-- Function -------------------------------------------
function SMUaddTrait()
	Actor PlayerREF = Game.GetPlayer()
	If (PlayerTrait01 == true)
		if Game.GetDifficulty() == 6 ;survival mode!
			PlayerREF.addperk(pSMU_PerkBroadShouldersSurvival, false)
		else
			PlayerREF.addperk(pSMU_PerkBroadShouldersNormal, false)
		endif
	Endif
	If (PlayerTrait02 == true)
		PlayerREF.addperk(pSMU_PerkBruiser, false)
	Endif
	If (PlayerTrait03 == true)
		PlayerREF.addperk(pSMU_PerkClaustrophobia, false)
	EndIf
	If (PlayerTrait04 == true)
		PlayerREF.addperk(pSMU_PerkEarlyBird, false)
	EndIf
	If (PlayerTrait05 == true)
		PlayerREF.addperk(pSMU_PerkFastMetabolism, false)	
	EndIf
	If (PlayerTrait06 == true)
		PlayerREF.addperk(pSMU_PerkFastShot, false)
	EndIf
	If (PlayerTrait07 == true)
		PlayerREF.addperk(pSMU_PerkFinesse, false)
	EndIf
	If (PlayerTrait08 == true)
		PlayerREF.addperk(pSMU_PerkFourEyes, false)
	EndIf
	If (PlayerTrait09 == true)
		PlayerREF.addperk(pSMU_PerkGifted, false)
	EndIf
	If (PlayerTrait10 == true)
		PlayerREF.addperk(pSMU_PerkGoodNatured, false)
	EndIf
	If (PlayerTrait11 == true)
		PlayerREF.addperk(pSMU_PerkHeavyHanded, false)
	EndIf
	If (PlayerTrait12 == true)
		PlayerREF.addperk(pSMU_PerkHotBlooded, false)
	EndIf
	If (PlayerTrait13 == true)
		PlayerREF.addperk(pSMU_PerkKamikaze, false)
	EndIf
	If (PlayerTrait14 == true)
		PlayerREF.addperk(pSMU_PerkLooseCannon, false)
	EndIf
	If (PlayerTrait15 == true)
		PlayerREF.addperk(pSMU_PerkNightOwl, false)
	EndIf
	If (PlayerTrait16 == true)
		PlayerREF.addperk(pSMU_PerkSmallFrame, false)
	EndIf
	If (PlayerTrait17 == true)
		PlayerREF.addperk(pSMU_PerkTriggerDiscipline, false)
	EndIf
	If (PlayerTrait18 == true)
		PlayerREF.addperk(pSMU_PerkUnsightly, false)
	EndIf
	If (OldGifted == true) && pSMU_OldGifted.GetValueInt() == 0
		PlayerREF.addperk(pSMU_PerkGiftedDebuffOnly, false)
		Game.GetPlayer().SetValue(Strength, Game.GetPlayer().GetBaseValue(Strength) + 2 as float)
		Game.GetPlayer().SetValue(Perception, Game.GetPlayer().GetBaseValue(Perception) + 2 as float)
		Game.GetPlayer().SetValue(Endurance, Game.GetPlayer().GetBaseValue(Endurance) + 2 as float)
		Game.GetPlayer().SetValue(Charisma, Game.GetPlayer().GetBaseValue(Charisma) + 2 as float)
		Game.GetPlayer().SetValue(Intelligence, Game.GetPlayer().GetBaseValue(Intelligence) + 2 as float)
		Game.GetPlayer().SetValue(Agility, Game.GetPlayer().GetBaseValue(Agility) + 2 as float)
		Game.GetPlayer().SetValue(Luck, Game.GetPlayer().GetBaseValue(Luck) + 2 as float)
		pSMU_OldGifted.SetValueInt(1) ;set the global so we can remove the trait later if needed
	EndIf
	If (OldSmallFrame == true) && pSMU_OldSmallFrame.GetValueInt() == 0
		PlayerREF.addperk(pSMU_PerkSmallFrameDebuffOnly, false)
		Game.GetPlayer().SetValue(Agility, Game.GetPlayer().GetBaseValue(Agility) + 2 as float)
		pSMU_OldSmallFrame.SetValueInt(1) ;set the global so we can remove the trait later if needed
	EndIf
	
EndFunction










