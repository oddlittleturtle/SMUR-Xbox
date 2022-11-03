ScriptName StartMeUp:SMU_BathroomDoor extends ObjectReference
{moved to a quest script on SMU_Manager; bathroom door, sets the stage that fires this.}

; ------- GLOBALS, variables ETC -------------
GlobalVariable Property pSMU_FollowedVanillaPath Auto ;0=altstart, 1=quick, 2=vanilla
GlobalVariable Property pSMU_VaultStart Auto ;0=started outside of vault, 1=started in vault111
GlobalVariable Property pTimeScale Auto Const mandatory ;20=default starting timescale
GlobalVariable Property pGameHour Auto Const ;9=default starting gamehour
GlobalVariable Property pSMU_CanTalkToNick Auto ;0=player has not found the holotape yet 1=player has learned of the abduction
GlobalVariable Property pSMU_DidSpecial Auto
GlobalVariable Property pSMU_DidTraits Auto
GlobalVariable Property pSMU_DidClass Auto
GlobalVariable Property pSMU_DidLocation Auto
GlobalVariable Property pSMU_DidDiff Auto
GlobalVariable Property pSMU_DidLevel Auto
GlobalVariable Property pSMU_StartPoint Auto
GlobalVariable Property pSMU_StartLevel Auto
GlobalVariable Property pSMU_OldGifted Auto
GlobalVariable Property pSMU_OldSmallFrame Auto
GlobalVariable Property pSMU_PlayerClass Auto
GlobalVariable Property pPlayerKnowsBoS Auto
GlobalVariable Property pPlayerKnowsChildrenOfAtom Auto
GlobalVariable Property pPlayerKnowsGunners Auto
GlobalVariable Property pPlayerKnowsInstitute Auto
GlobalVariable Property pPlayerKnowsSynths Auto
GlobalVariable Property pSMU_RandomClass Auto
GlobalVariable Property pSMU_RandomGear Auto
GlobalVariable Property pSMU_RandomLevel Auto
GlobalVariable Property pSMU_RandomLocation Auto
GlobalVariable Property pSMU_RandomSpecial Auto
GlobalVariable Property pSMU_RandomTraits Auto

Keyword Property pAnimArchetypePlayer Auto Const mandatory
int MessageCount = 0
int ClassMessageCount = 0
int LocationMessageCount = 0
int PlayerTrait = 0
int PlayerClass = 0
int PlayerLocation = 0
int PlayerDiff = 1
int PlayerLevel = 1
int[] Specials ;for random start
int[] Classes ;for random start
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
bool OldSmallFrame = false
bool OldGifted = false

; ------- PERKS --------------------
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

; ------- MESSAGES ETC -------------
Message Property pSMU_Door Auto Const mandatory
Message Property pSMU_Door1 Auto Const
Message Property pSMU_Door2 Auto Const
Message Property pSMU_Door3 Auto Const
Message Property pSMU_Door3b Auto Const
Message Property pSMU_Door4 Auto Const
Message Property pSMU_Door4b Auto Const
Message Property pSMU_Door5 Auto Const
Message Property pSMU_Door6 Auto Const
Message Property pSMU_Door7 Auto Const
Message Property pSMU_Door8 Auto Const
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
Message Property pSMU_Randomize Auto Const

; ------- QUESTS --------
Quest Property pTutorial Auto Const mandatory
Quest Property pRadioDiamondCity Auto Const
Quest Property pRadioInstituteQuest Auto Const
Quest Property pBoSM01 Auto Const
Quest Property pMQ101 Auto mandatory
Quest Property pMQ102 Auto Const
Quest Property pMQ103 Auto Const
mq101questscript Property pMQ101questscript Auto Const
Quest Property pDialogueBunkerHill Auto Const

; ------ GEAR -------
Armor Property pPipboy Auto Const
Armor Property ClothesSuitDirty_Black Auto Const
Armor Property pClothesMilitaryCap Auto Const
Armor Property pClothesFatiguesPostWar Auto Const
Armor Property pClothesGrayKnitCap Auto Const
Armor Property pClothesResident6 Auto Const
Armor Property pClothesDog_Bandana Auto Const
Armor Property pClothesResident5 Auto Const
Armor Property pClothesWinterHat Auto Const
Weapon Property pKnife Auto Const
Armor Property pArmor_Raider_Underarmor Auto Const
Weapon Property pTireIron Auto Const
Armor Property pClothesRRJumpsuit Auto Const
Armor Property pClothes_Raider_Goggles Auto Const
Weapon Property pPipeWrench Auto Const
Armor Property pClothesResident3Hat Auto Const
Armor Property pClothesSunGlasses Auto Const
Weapon Property pSwitchblade Auto Const
Armor Property pClothesResident3 Auto Const
Armor Property pClothesResident7 Auto Const
Armor Property pClothesTattered Auto Const
Weapon Property pLeadPipe Auto Const
Armor Property pClothesLongshoreman Auto Const
Armor Property pClothesLongshoremanHat Auto Const
Armor Property pClothesBaseballHat Auto Const
Armor Property pClothesBaseballUniform Auto Const
Armor Property pClothesVaultTecScientist Auto Const
Armor Property pClothesScientist_VariantWasteland Auto Const
Armor Property pClothesEyeGlasses Auto Const
Armor Property pArmor_HazmatSuit Auto Const
Armor Property pArmor_Wastelander_Medium Auto Const
Armor Property pArmor_Wastelander_Light Auto Const
Armor Property pClothesGreaserJacket Auto Const
Armor Property pArmor_Rustic_Underarmor Auto Const
Weapon Property pMachete Auto Const
Weapon Property pKnuckles Auto Const
Weapon Property pWalkingCane Auto Const
Weapon Property pBaseballBat Auto Const
Armor Property pClothes_Raider_SurgicalMask Auto Const
Armor Property pArmor_Raider_GreenHoodGasmask Auto Const
Weapon Property pBaton Auto Const
Armor Property pArmor_Vault114_Underwear Auto Const
Armor Property pArmor_Wastelander_Heavy Auto Const
Weapon Property pPoolCue Auto Const
Armor Property pArmor_BoS_Soldier_Underarmor Auto Const
Armor Property pArmor_BoS_Knight_UnderarmorHelmet Auto Const
Armor Property pClothesWastelandCommon Auto Const
Armor Property pClothesResident5Hat Auto Const
Armor Property pArmor_Synth_Underarmor Auto Const
Armor Property pClothesMinutemanOutfit Auto Const
Armor Property pClothesMinutemanHat Auto Const
Weapon Property pRevolutionarySword Auto Const
Armor Property pClothesChildofAtomBrown Auto Const
Weapon Property pRollingPin Auto Const
Armor Property pArmor_GunnerGuard_UnderArmor Auto Const
Armor Property pClothesPoliceGlasses Auto Const
Armor Property pMS02_ClothesSubmarineCrew Auto Const
Armor Property pMS02_ClothesSubmarineCrewHat Auto Const
Weapon Property pChineseOfficerSword Auto Const
Armor Property pClothesSequinDress Auto Const
Armor Property pClothesTuxedo Auto Const
Armor Property pClothesTuxedoHat Auto Const
Armor Property pArmor_Wastelander_02_NoHood_GlovesB Auto Const
Armor Property pClothesPrewarSweaterVest Auto Const
Potion Property pSMU_StrangeMeat Auto Const
Armor Property pArmor_Raider_Underwear Auto Const
Armor Property pClothes_InstituteLabCoat_Dirty Auto Const

; ------ VAULT 111 --------
ObjectReference Property pMQ101HillSoldiersEnableMarker Auto Const
;ObjectReference Property SMUVault111CryoDoor Auto Const
;ReferenceAlias Property pAlias_SpouseFemale2 Auto Const
;ReferenceAlias Property pAlias_SpouseMale2 Auto Const
Sound Property AMBrIntVault111CreaksA Auto Const
SoundCategorySnapshot Property CSMQ101PlayerHouseInt Auto Const
ObjectReference Property pSMU_V111ElevatorDownTriggerREF Auto Const
;ObjectReference Property pMQ102SpouseCorpseFemaleREF2 Auto Const
;ObjectReference Property pMQ102SpouseCorpseMaleREF2 Auto Const
;Actor Property pMQ102SpouseCorpseFemaleREF2 Auto Const
;Actor Property pMQ102SpouseCorpseMaleREF2 Auto Const
Actor Property pSMU_PlayerSpouseMaleVaultREF Auto Const
Actor Property pSMU_PlayerSpouseFemaleVaultREF Auto Const

; ------ START LOCATION --------
ObjectReference Property pFFG07BobbiDebugSpawn Auto Const

; ------ CLEAN UP PLACES -------
Faction Property pSMU_RaiderFaction Auto Const
Faction Property pSMU_RaiderFaction2 Auto Const
Faction Property pRaiderFaction Auto Const
ObjectReference Property pSMU_SpawnTriggerREF Auto Const
ObjectReference Property pSMU_V111ExteriorElevatorTriggerREF Auto Const
Furniture Property pSMU_NpcBedGroundSleep01 Auto Const

LeveledItem Property pSMU_Gear_01AVaultDwellerHard Auto Const
LeveledItem Property pSMU_Gear_02ASurvivalistHard Auto Const
LeveledItem Property pSMU_Gear_03AScavengerHard Auto Const
LeveledItem Property pSMU_Gear_04AHunterHard Auto Const
LeveledItem Property pSMU_Gear_05ARaiderHard Auto Const
LeveledItem Property pSMU_Gear_06AMechanicHard Auto Const
LeveledItem Property pSMU_Gear_07AGangsterHard Auto Const
LeveledItem Property pSMU_Gear_08ATraderHard Auto Const
LeveledItem Property pSMU_Gear_09AFarmerHard Auto Const
LeveledItem Property pSMU_Gear_10ADrunkHard Auto Const
LeveledItem Property pSMU_Gear_11ADoctorHard Auto Const
LeveledItem Property pSMU_Gear_12AScientistHard Auto Const
LeveledItem Property pSMU_Gear_13AMercenaryHard Auto Const
LeveledItem Property pSMU_Gear_14ABallplayerHard Auto Const
LeveledItem Property pSMU_Gear_15ADrifterHard Auto Const
LeveledItem Property pSMU_Gear_16AThiefHard Auto Const
LeveledItem Property pSMU_Gear_17ASailorHard Auto Const
LeveledItem Property pSMU_Gear_18AGreaserHard Auto Const
LeveledItem Property pSMU_Gear_19AScoutHard Auto Const
LeveledItem Property pSMU_Gear_20AExplorerHard Auto Const
LeveledItem Property pSMU_Gear_21ABoSHard Auto Const
LeveledItem Property pSMU_Gear_22ARailroadHard Auto Const
LeveledItem Property pSMU_Gear_23ASynthHard Auto Const
LeveledItem Property pSMU_Gear_24AMinutemenHard Auto Const
LeveledItem Property pSMU_Gear_25AAtomHard Auto Const
LeveledItem Property pSMU_Gear_26AGunnersHard Auto Const
LeveledItem Property pSMU_Gear_27AForgedHard Auto Const
LeveledItem Property pSMU_Gear_28AChineseAgentHard Auto Const
LeveledItem Property pSMU_Gear_29AWealthyDCHard Auto Const
LeveledItem Property pSMU_Gear_30APoorDCHard Auto Const
LeveledItem Property pSMU_Gear_31AInstituteScientistHard Auto Const
LeveledItem Property pSMU_Gear_32ACannibalHard Auto Const
LeveledItem Property pSMU_Gear_33AFishermanHard Auto Const
LeveledItem Property pSMU_Gear_34ARustDevilHard Auto Const
LeveledItem Property pSMU_Gear_35ATrapperHard Auto Const
LeveledItem Property pSMU_Gear_36APackHard Auto Const
LeveledItem Property pSMU_Gear_37AOperatorsHard Auto Const
LeveledItem Property pSMU_Gear_38ADisciplesHard Auto Const
LeveledItem Property pSMU_Gear_39ANukaColaHard Auto Const

LeveledItem Property pSMU_Gear_01BVaultDwellerMedium Auto Const
LeveledItem Property pSMU_Gear_02BSurvivalistMedium Auto Const
LeveledItem Property pSMU_Gear_03BScavengerMedium Auto Const
LeveledItem Property pSMU_Gear_04BHunterMedium Auto Const
LeveledItem Property pSMU_Gear_05BRaiderMedium Auto Const
LeveledItem Property pSMU_Gear_06BMechanicMedium Auto Const
LeveledItem Property pSMU_Gear_07BGangsterMedium Auto Const
LeveledItem Property pSMU_Gear_08BTraderMedium Auto Const
LeveledItem Property pSMU_Gear_09BFarmerMedium Auto Const
LeveledItem Property pSMU_Gear_10BDrunkMedium Auto Const
LeveledItem Property pSMU_Gear_11BDoctorMedium Auto Const
LeveledItem Property pSMU_Gear_12BScientistMedium Auto Const
LeveledItem Property pSMU_Gear_13BMercenaryMedium Auto Const
LeveledItem Property pSMU_Gear_14BBallplayerMedium Auto Const
LeveledItem Property pSMU_Gear_15BDrifterMedium Auto Const
LeveledItem Property pSMU_Gear_16BThiefMedium Auto Const
LeveledItem Property pSMU_Gear_17BSailorMedium Auto Const
LeveledItem Property pSMU_Gear_18BGreaserMedium Auto Const
LeveledItem Property pSMU_Gear_19BScoutMedium Auto Const
LeveledItem Property pSMU_Gear_20BExplorerMedium Auto Const
LeveledItem Property pSMU_Gear_21BBoSMedium Auto Const
LeveledItem Property pSMU_Gear_22BRailroadMedium Auto Const
LeveledItem Property pSMU_Gear_23BSynthMedium Auto Const
LeveledItem Property pSMU_Gear_24BMinutemenMedium Auto Const
LeveledItem Property pSMU_Gear_25BAtomMedium Auto Const
LeveledItem Property pSMU_Gear_26BGunnersMedium Auto Const
LeveledItem Property pSMU_Gear_27BForgedMedium Auto Const
LeveledItem Property pSMU_Gear_28BChineseAgentMedium Auto Const
LeveledItem Property pSMU_Gear_29BWealthyDCMedium Auto Const
LeveledItem Property pSMU_Gear_30BPoorDCMedium Auto Const
LeveledItem Property pSMU_Gear_31BInstituteScientistMedium Auto Const
LeveledItem Property pSMU_Gear_32BCannibalMedium Auto Const
LeveledItem Property pSMU_Gear_33BFishermanMedium Auto Const
LeveledItem Property pSMU_Gear_34BRustDevilMedium Auto Const
LeveledItem Property pSMU_Gear_35BTrapperMedium Auto Const
LeveledItem Property pSMU_Gear_36BPackMedium Auto Const
LeveledItem Property pSMU_Gear_37BOperatorsMedium Auto Const
LeveledItem Property pSMU_Gear_38BDisciplesMedium Auto Const
LeveledItem Property pSMU_Gear_39BNukaColaMedium Auto Const

LeveledItem Property pSMU_Gear_01CVaultDwellerEasy Auto Const
LeveledItem Property pSMU_Gear_02CSurvivalistEasy Auto Const
LeveledItem Property pSMU_Gear_03CScavengerEasy Auto Const
LeveledItem Property pSMU_Gear_04CHunterEasy Auto Const
LeveledItem Property pSMU_Gear_05CRaiderEasy Auto Const
LeveledItem Property pSMU_Gear_06CMechanicEasy Auto Const
LeveledItem Property pSMU_Gear_07CGangsterEasy Auto Const
LeveledItem Property pSMU_Gear_08CTraderEasy Auto Const
LeveledItem Property pSMU_Gear_09CFarmerEasy Auto Const
LeveledItem Property pSMU_Gear_10CDrunkEasy Auto Const
LeveledItem Property pSMU_Gear_11CDoctorEasy Auto Const
LeveledItem Property pSMU_Gear_12CScientistEasy Auto Const
LeveledItem Property pSMU_Gear_13CMercenaryEasy Auto Const
LeveledItem Property pSMU_Gear_14CBallplayerEasy Auto Const
LeveledItem Property pSMU_Gear_15CDrifterEasy Auto Const
LeveledItem Property pSMU_Gear_16CThiefEasy Auto Const
LeveledItem Property pSMU_Gear_17CSailorEasy Auto Const
LeveledItem Property pSMU_Gear_18CGreaserEasy Auto Const
LeveledItem Property pSMU_Gear_19CScoutEasy Auto Const
LeveledItem Property pSMU_Gear_20CExplorerEasy Auto Const
LeveledItem Property pSMU_Gear_21CBoSEasy Auto Const
LeveledItem Property pSMU_Gear_22CRailroadEasy Auto Const
LeveledItem Property pSMU_Gear_23CSynthEasy Auto Const
LeveledItem Property pSMU_Gear_24CMinutemenEasy Auto Const
LeveledItem Property pSMU_Gear_25CAtomEasy Auto Const
LeveledItem Property pSMU_Gear_26CGunnersEasy Auto Const
LeveledItem Property pSMU_Gear_27CForgedEasy Auto Const
LeveledItem Property pSMU_Gear_28CChineseAgentEasy Auto Const
LeveledItem Property pSMU_Gear_29CWealthyDCEasy Auto Const
LeveledItem Property pSMU_Gear_30CPoorDCEasy Auto Const
LeveledItem Property pSMU_Gear_31CInstituteScientistEasy Auto Const
LeveledItem Property pSMU_Gear_32CCannibalEasy Auto Const
LeveledItem Property pSMU_Gear_33CFishermanEasy Auto Const
LeveledItem Property pSMU_Gear_34CRustDevilEasy Auto Const
LeveledItem Property pSMU_Gear_35CTrapperEasy Auto Const
LeveledItem Property pSMU_Gear_36CPackEasy Auto Const
LeveledItem Property pSMU_Gear_37COperatorsEasy Auto Const
LeveledItem Property pSMU_Gear_38CDisciplesEasy Auto Const
LeveledItem Property pSMU_Gear_39CNukaColaEasy Auto Const

LeveledItem Property pSMU_GearBaseAHard Auto Const
LeveledItem Property pSMU_GearBaseBMedium Auto Const
LeveledItem Property pSMU_GearBaseCEasy Auto Const

ActorValue Property Strength Auto Const
ActorValue Property Perception Auto Const
ActorValue Property Endurance Auto Const
ActorValue Property Charisma Auto Const
ActorValue Property Intelligence Auto Const
ActorValue Property Agility Auto Const
ActorValue Property Luck Auto Const
ActorValue Property Experience Auto

ReferenceAlias Property pCryoDoorAlias Auto

ObjectReference Property pSMU_CryopodExitTriggerREF Auto Const

;-- State -------------------------------------------
Auto State WaitingForTrigger
	Event onTriggerEnter(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			Self.prompt_player_to_submit(akActionRef)
		EndIf
	EndEvent
EndState

;-- State -------------------------------------------
State HasBeenTriggered
	Event onTriggerEnter(ObjectReference akActionRef)
		self.disable()
	EndEvent
EndState

;===============================================================================================================================
;===============================================================================================================================
;===============================================================================================================================
Function prompt_player_to_submit(ObjectReference akActionRef)
	;RegisterForMenuOpenCloseEvent("SpecialMenu")
	Actor PlayerREF = Game.GetPlayer()
	akActionRef = PlayerREF
	int pressedButton
	bool InMenu = True
	;begin menu
	WHILE (InMenu)
		;first menu - alt start, quick start, normal start
		If MessageCount == 0
		pressedButton = pSMU_Door.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
		;choice 1: alt start
			If (pressedButton == 0 )
				;proceed to next menu
				MessageCount = 1
			;choice 2: quick start
			;/ quick start removed for Xbox version
			ElseIf (pressedButton == 1 )
				;player picked a start - exit the menu
				InMenu = False
				;UnRegisterForMenuOpenCloseEvent("SpecialMenu")
				; ----- player is following the QUICK start path -------------------------
				;Set this up so the player can't trigger the door twice
				Self.gotoState("HasBeenTriggered")
				;set the globals so we know player is doing the QUICK start and a VAULT start
				pSMU_FollowedVanillaPath.SetValueInt(1)
				pSMU_VaultStart.SetValueInt(1)
				pSMU_CanTalkToNick.SetValueInt(1)
				
				;give the player full anims
				PlayerREF.ChangeAnimArchetype(None)
				PlayerREF.ChangeAnimArchetype(pAnimArchetypePlayer)
				
				;stuff from the Vault111 start debug of mq101
				pTimeScale.SetValueInt(0)
				pMQ101questscript.MQ101EnableLayer = inputenablelayer.Create()

				;functionally the same as in the mq101 script fragment: MQ101EnableLayer.EnablePlayerControls(abFighting = false, abSneaking = false, abMenu = false, abVats = false)
				pMQ101questscript.MQ101EnableLayer.EnablePlayerControls(True, False, True, True, False, False, True, True, False, True, True)
				;??
				pMQ101HillSoldiersEnableMarker.Disable(False)
				;enable that vertibird sound
				CSMQ101PlayerHouseInt.Remove()		
				;i'm not sure we want to set all these stages. let's see.
				;if there are problems, we should look at these stage's scripts to see what they do
				;pMQ101.SetStage(270) ;in the house, before the siren
				;pMQ101.SetStage(500) ;beginning of elevator, pre-bomb
				;pMQ101.SetStage(600) ;elevator down scene, post-bomb
				
				;lock the vault11 cryo door 
				;SMUVault111CryoDoor.Lock()
				;set the lock level to Terminal Only
				;SMUVault111CryoDoor.SetLockLevel(253)
				;ObjectReference CyroDoor = Game.GetFormFromFile(0x00001977, FO4) as ObjectReference
				
				;ObjectReference TheCryoDoor = Game.GetFormFromFile(0x00001977, FO4) as ObjectReference
				;pCryoDoorAlias.ForceRefTo(TheCryoDoor)
				;pCryoDoorAlias.GetRef().Lock()
				;pCryoDoorAlias.GetRef().SetLockLevel(253)
				
				pSMU_CryopodExitTriggerREF.MoveTo(Game.GetFormFromFile(0x04A011, FO4) as objectreference)
				pSMU_CryopodExitTriggerREF.SetPosition(664.4663, -433.5204, 28.0635)
				pSMU_CryopodExitTriggerREF.SetAngle(0, 0, 0)

				;SPECIAL EFFECTS FOR THE DREAM
				AMBrIntVault111CreaksA.Play(Game.GetPlayer())
				
				;fade out to black
				Game.FadeOutGame(true, true, 0, 8.0, false)
				;Game.FadeOutGame(abFadingOut=True, abBlackFade=False, afSecsBeforeFade=3.0, afFadeDuration=10.0, abStayFaded=True)
				;wait for the fade out
				Utility.Wait(7.0)		

				;stuff from the other stages of MQ101 that we might need to fix bugs
				;stop crowd panic sounds
				;pMQ101CrowdPanicSoundMarkerREF.Disable()
				;stop other running scenes
				;MQ101SanctuaryHills.SetStage(95)
				;disable air raid siren
				;pMQ101AirRaidSirenMarkerREF.Disable()
				;shutdown sanctuary hills dialogue
				;pMQ101SanctuaryHills.SetStage(1000) ;need to set property

				;we do want to go to this stage to start the game
				pMQ101.SetStage(900) 
				;770 is kellogg
			/;
			;choice three: normal start
			; normal choice completely removed. Why use the mod?
			;/
			ElseIf (pressedButton == 2 )
				;player picked a start - exit the menu
				InMenu = False
				;UnRegisterForMenuOpenCloseEvent("SpecialMenu")
				; ----- player is following the VANILLA path, game progresses as normal, this is the CANCEL button basically -----
				;Set this up so the player can't trigger the door twice
				Self.gotoState("HasBeenTriggered")
				;set the globals so we know what the player did - full vanilla start
				pSMU_FollowedVanillaPath.SetValueInt(2)
				pSMU_VaultStart.SetValueInt(1)
				pSMU_CanTalkToNick.SetValueInt(1)
			/;
			Else
				;do nothing, someone else activated the door wtf
			EndIf
		
		; second menu - pick start location, in vault or wasteland
		ElseIf MessageCount == 1
		
			;show the second message popup - alt start in vault, or in wasteland?
			pressedButton = pSMU_Door1.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)		
			
			; ----- OPTION 0: Start in the WASTELAND -------------------------------------------------------------------------
			If (pressedButton == 0 )
				;call a funciton to handle rolling your own character
				;SMUclasschoice(akActionRef)
				;proceed to next menu
				MessageCount = 2
			
			; ----- OPTION 0 - VAULT 111 alt start ------------------------------------------------------------------------------
			ElseIf (pressedButton == 1 )		
				;player picked a start - exit the menu
				InMenu = False
				;UnRegisterForMenuOpenCloseEvent("SpecialMenu")
				;Set this up so the player can't trigger the door twice
				Self.gotoState("HasBeenTriggered")
				
				;set the globals so we know player is doing the ALT start and a VAULT start
				pSMU_FollowedVanillaPath.SetValueInt(0)	
				pSMU_VaultStart.SetValueInt(1)
				pSMU_CanTalkToNick.SetValueInt(1)
				
				;give the player full anims
				;/-- set on SMUStartOutsideVault()
				PlayerREF.ChangeAnimArchetype(None)
				PlayerREF.ChangeAnimArchetype(pAnimArchetypePlayer)
				/;
				
				;stuff from the Vault111 start debug of mq101
				pTimeScale.SetValueInt(0)
				pMQ101questscript.MQ101EnableLayer = inputenablelayer.Create()

				;functionally the same as in the mq101 script fragment: MQ101EnableLayer.EnablePlayerControls(abFighting = false, abSneaking = false, abMenu = false, abVats = false)
				; Function EnablePlayerControls(bool abMovement = true, bool abFighting = true, bool abCamSwitch = true, 
				; bool abLooking = true, bool abSneaking = true, bool abMenu = true, bool abActivate = true, 
				; bool abJournalTabs = true, bool abVATS = true, bool abFavorites = true, bool abRunning = true) native
				;pMQ101questscript.MQ101EnableLayer.EnablePlayerControls(True, False, True, True, False, False, True, True, False, True, True)
				pMQ101questscript.MQ101EnableLayer.EnablePlayerControls(False, False, False, True, False, False, True, False, False, False, False)
				;stage 230?
				pMQ101HillSoldiersEnableMarker.Disable(False)
				;enable that vertibird sound
				CSMQ101PlayerHouseInt.Remove()
				;i'm not sure we want to set all these stages. let's see.
				;if there are problems, we should look at these stage's scripts to see what they do
				;pMQ101.SetStage(270) ;in the house, before the siren
				;pMQ101.SetStage(500) ;beginning of elevator, pre-bomb
				;pMQ101.SetStage(600) ;elevator down scene, post-bomb
				
				;SET UP Nate & Nora 
				If (Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1 ;if female
					;pSMU_PlayerSpouseFemaleVaultREF.EnableNoWait ()
					pSMU_PlayerSpouseFemaleVaultREF.SetLinkedRef(Game.GetFormFromFile(0x001934, FO4) as objectreference)
					pSMU_PlayerSpouseFemaleVaultREF.MoveTo(Game.GetFormFromFile(0x04A011, FO4) as objectreference)
					pSMU_PlayerSpouseFemaleVaultREF.SetPosition(-48.43, -446.30, -50.20)
					pSMU_PlayerSpouseFemaleVaultREF.SetAngle(0, 0, 190.04)
					pSMU_PlayerSpouseFemaleVaultREF.Enable()
					pSMU_PlayerSpouseFemaleVaultREF.EvaluatePackage()
				Else
					;pSMU_PlayerSpouseMaleVaultREF.EnableNoWait()
					pSMU_PlayerSpouseMaleVaultREF.SetLinkedRef(Game.GetFormFromFile(0x001934, FO4) as objectreference)
					pSMU_PlayerSpouseMaleVaultREF.MoveTo(Game.GetFormFromFile(0x04A011, FO4) as objectreference)
					pSMU_PlayerSpouseMaleVaultREF.SetPosition(50.05, -425.08, -50.17)
					pSMU_PlayerSpouseMaleVaultREF.SetAngle(0, 0, 2.86)
					pSMU_PlayerSpouseMaleVaultREF.Enable()
					pSMU_PlayerSpouseMaleVaultREF.EvaluatePackage()
				EndIf
				
				pSMU_CryopodExitTriggerREF.MoveTo(Game.GetFormFromFile(0x04A011, FO4) as objectreference)
				pSMU_CryopodExitTriggerREF.SetPosition(664.4663, -433.5204, 28.0635)
				pSMU_CryopodExitTriggerREF.SetAngle(0, 0, 0)

				;SPECIAL EFFECTS FOR THE DREAM
				AMBrIntVault111CreaksA.Play(Game.GetPlayer())
				
				;fade out to black
				Game.FadeOutGame(true, true, 0, 8.0, false)
				Utility.Wait(7.0)		

				;stuff from the other stages of MQ101 that we might need to fix bugs
				;stop crowd panic sounds
				;pMQ101CrowdPanicSoundMarkerREF.Disable()
				;stop other running scenes
				;MQ101SanctuaryHills.SetStage(95)
				;disable air raid siren
				;pMQ101AirRaidSirenMarkerREF.Disable()
				;shutdown sanctuary hills dialogue
				;pMQ101SanctuaryHills.SetStage(1000) ;need to set property
				
				;we do want to go to this stage to start the game
				;move player to Kellogg
				;sets stage 780
				pMQ101.SetStage(770)
				
				;sets stage 900
				pMQ101.SetStage(810)
				
				SMU_Manager.SendStartMeUpEvent(true)

			; ----- OPTION 2: <back to first menu>
			;/ -- going back is unnecessary
			ElseIf (pressedButton == 2 ) 
				;go back
				MessageCount = 0
			/;	
			EndIf
		
		;CUSTOMIZE CHARACTER MAIN MENU
		ElseIf MessageCount == 2
			;show the main menu for building a custom character
			pressedButton = pSMU_Door2.Show()		
			
			If (pressedButton == 0 )
				;special menu
				Game.ShowSPECIALMenu()
				Utility.Wait(0.1) ;pauses the menus, waiting for special menu to close
				pSMU_DidSpecial.SetValueInt(1)
				MessageCount = 2
								
			ElseIf (pressedButton == 1 )
				;traits menu
				pSMU_DidTraits.SetValueInt(1)
				MessageCount = 5
			
			ElseIf (pressedButton == 2 )
				;class menu
				pSMU_DidClass.SetValueInt(1)
				MessageCount = 3
								
			ElseIf (pressedButton == 3 )
				;location menu
				pSMU_DidLocation.SetValueInt(1)
				MessageCount = 4
								
			ElseIf (pressedButton == 4 )
				;difficulty (gear scarcity) menu
				pSMU_DidDiff.SetValueInt(1)
				MessageCount = 6				
								
			ElseIf (pressedButton == 5 )
				;player level menu
				pSMU_DidLevel.SetValueInt(1)
				MessageCount = 7				
								
			ElseIf (pressedButton == 6 )
				;FINISHED!!! show final menu
				MessageCount = 8
			
			ElseIf (pressedButton == 7 )
				;player hasn't fully specified character, do nothing
			
			ElseIf (pressedButton == 8 )
				;go back
				MessageCount = 1
			
			EndIf ;main character menu message box
			
		;select class
		ElseIf MessageCount == 3
			bool InClassMenu = True
			WHILE (InClassMenu)
			If (ClassMessageCount == 0)
				;show the 1st message popup with class choices
				pressedButton = pSMU_Door3.Show()					
				If (pressedButton == 0)
					;PREWAR ENTHUSIAST
					PlayerClass = 1
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 1)
					;SURVIVALIST
					PlayerClass = 2
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 2)
					;SCAVENGER
					PlayerClass = 3
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 3)
					;HUNTER
					PlayerClass = 4
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 4)
					;RAIDER
					PlayerClass = 5
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 5)
					;MECHANIC
					PlayerClass = 6
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 6)
					;GANGSTER
					PlayerClass = 7
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 7)
					;TRADER
					PlayerClass = 8
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 8)
					;FARMER
					PlayerClass = 9
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 9)
					;DRUNK
					PlayerClass = 10
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 10)
					;DOCTOR
					PlayerClass = 11
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 11)
					;SCIENTIST
					PlayerClass = 12
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 12)
					;MERCENARY
					PlayerClass = 13
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 13)
					;DC RESIDENT SWATTER
					PlayerClass = 14
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 14 )
					;THUG
					PlayerClass = 15
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 15 )
					;THIEF
					PlayerClass = 16
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 16 )
					;SAILOR
					PlayerClass = 17
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 17 )
					;GREASER
					PlayerClass = 18
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 18 )
					;SCOUT
					PlayerClass = 19
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 19 )
					;go to second menu page
					ClassMessageCount = 1
				EndIf
			ElseIf ClassMessageCount == 1	
				;show the 2nd message popup with class choices
				pressedButton = pSMU_Door3b.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)					
				If (pressedButton == 0 )
					;RAD EXPLORER
					PlayerClass = 20
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 1 )
					;BoS Initiate
					PlayerClass = 21
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 2 )
					;Railroad Tourist
					PlayerClass = 22
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 3 )
					;Institute Escaped Synth
					PlayerClass = 23
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 4 )
					;Minutemen Survivor
					PlayerClass = 24
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 5 )
					;Cult of Atom Novice
					PlayerClass = 25
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 6 )
					;Gunner Conscript Runaway
					PlayerClass = 26
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 7 )
					;Forged
					PlayerClass = 27
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 8 )
					;Chinese Agent
					PlayerClass = 28
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 9 )
					;Wealthy DC
					PlayerClass = 29
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 10 )
					;Poor DC
					PlayerClass = 30
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 11 )
					;Institute Scientist Deserter
					PlayerClass = 31
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 12 )
					;Cannibal
					PlayerClass = 32
					MessageCount = 2
					InClassMenu = False
				ElseIf (pressedButton == 13 )
					;Fisherman
					if Game.IsPluginInstalled("DLCCoast.esm") == false || Game.IsPluginInstalled("DLCCoast.esm") == false
						Debug.MessageBox("Option not available: Far Harbor not detected.")
					else
						PlayerClass = 33
						MessageCount = 2
						InClassMenu = False
					endif
				ElseIf (pressedButton == 14 )
					;Rust Devil
					if Game.IsPluginInstalled("DLCRobot.esm") == false
						Debug.MessageBox("Option not available: Automatron not detected.")
					else
						PlayerClass = 34
						MessageCount = 2
						InClassMenu = False
					endif
				ElseIf (pressedButton == 15 )
					;Trapper
					if Game.IsPluginInstalled("DLCCoast.esm") == False
						Debug.MessageBox("Option not available: Far Harbor not detected.")
					else
						PlayerClass = 35
						MessageCount = 2
						InClassMenu = False
					endif
				ElseIf (pressedButton == 16 )
					;Pack
					if Game.IsPluginInstalled("DLCNukaWorld.esm") == False
						Debug.MessageBox("Option not available: Nuka World not detected.")
					else
						PlayerClass = 36
						MessageCount = 2
						InClassMenu = False
					endif
				ElseIf (pressedButton == 17 )
					;Operators
					if Game.IsPluginInstalled("DLCNukaWorld.esm") == False
						Debug.MessageBox("Option not available: Nuka World not detected.")
					else
						PlayerClass = 37
						MessageCount = 2
						InClassMenu = False
					endif
				ElseIf (pressedButton == 18 )
					;Disciples
					if Game.IsPluginInstalled("DLCNukaWorld.esm") == False
						Debug.MessageBox("Option not available: Nuka World not detected.")
					else
						PlayerClass = 38
						MessageCount = 2
						InClassMenu = False
					endif
				ElseIf (pressedButton == 19 )
					;Nuka Cola Collector
					if Game.IsPluginInstalled("DLCNukaWorld.esm") == False
						Debug.MessageBox("Option not available: Nuka World not detected.")
					else
						PlayerClass = 39
						MessageCount = 2
						InClassMenu = False
					endif
				ElseIf (pressedButton == 20 )
					;go back to first menu page
					ClassMessageCount = 0
				EndIf

			EndIf ;classes message boxes
			EndWhile ;classes message boxes
		
		;select location
		ElseIf MessageCount == 4
			bool InLocationMenu = True
			WHILE (InLocationMenu)
			If LocationMessageCount == 0
				;show the message popup with location choices
				pressedButton = pSMU_Door4.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)		
				If (pressedButton == 0 )
					;VAULT 111 EXTERIOR
					PlayerLocation = 0
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 1 )
					;SANCTUARY BASEMENT
					PlayerLocation = 1
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 2 )
					;RAIDER GROUP
					PlayerLocation = 2
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 3 )
					;RANGER CABIN
					PlayerLocation = 3
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 4 )
					;RED ROCKET
					PlayerLocation = 4
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 5 )
					;ROBOTICS DISPOSAL
					PlayerLocation = 5
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 6 )
					;CONCORD
					PlayerLocation = 6
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 7 )
					;BENDER BUS
					PlayerLocation = 7
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 8 )
					;DRUMLIN
					PlayerLocation = 8
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 9 )
					;TENPINES
					PlayerLocation = 9
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 10 )
					;LONELY CHAPEL
					PlayerLocation = 10
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 11 )
					;ROCKY NARROWS
					PlayerLocation = 11
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 12 )
					;WILDWOOD CEMETERY
					PlayerLocation = 12
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 13 )
					;LAKE QUANNAPOWITT
					PlayerLocation = 13
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 14 )
					;RELAY TOWER 1DL 109
					PlayerLocation = 14
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 15 )
					;UNION HOPE CATHEDRAL
					PlayerLocation = 15
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 16 )
					;VAULT 81
					PlayerLocation = 16
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 17 )
					;DIAMOND CITY OUTSKIRTS
					PlayerLocation = 17
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 18 )
					;BOYLSTON CLUB
					PlayerLocation = 18
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 19 )
					;go to second menu page
					LocationMessageCount = 1
				EndIf ;location message box
			ElseIf LocationMessageCount == 1	
				;show the 2nd message popup with class choices
				pressedButton = pSMU_Door4b.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				If (pressedButton == 0 )
					;GOODNEIGHBOOR
					PlayerLocation = 19
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 1 )
					;BUNKER HILL
					PlayerLocation = 20
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 2 )
					;RELAY TOWER 0MC 810
					PlayerLocation = 21
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 3 )
					;GREENTOP NURSERY
					PlayerLocation = 22
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 4 )
					;ROADSIDE PINES MOTEL
					PlayerLocation = 23
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 5 )
					;EGRET TOURS MARINA
					PlayerLocation = 24
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 6 )
					;FAIRLINE HILL ESTATES
					PlayerLocation = 25
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 7 )
					;SOUTH BOSTON HIGH SCHOOL AREA
					PlayerLocation = 26
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 8 )
					;CRATER OF THE ATOM
					PlayerLocation = 27
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 9 )
					;SOMERVILLE PLACE
					PlayerLocation = 28
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 10 )
					;PARSON'S CREAMERY
					PlayerLocation = 29
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 11 )
					;GLOWING SEA AIR PLANE
					PlayerLocation = 30
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 12 )
					;QUINCY
					PlayerLocation = 31
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 13 )
					;ATOM CATS
					PlayerLocation = 32
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 14 )
					;SPECTACLE ISLAND
					PlayerLocation = 33
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 15 )
					;MURKWATER FAR SE SWAMP
					PlayerLocation = 34
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 16 )
					;NORDHAGEN BEACH
					PlayerLocation = 35
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 17 )
					;NAHANT OCEANOLOGICAL SOCIETY
					PlayerLocation = 36
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 18 )
					;HUGO'S HOLE
					PlayerLocation = 37
					MessageCount = 2
					InLocationMenu = False
				ElseIf (pressedButton == 19 )
					;go back to first menu page
					LocationMessageCount = 0
				EndIf ;location message box
			EndIf ;location message boxes
			EndWhile ;location message boxes
		
		;traits menu
		ElseIf MessageCount == 5
			;show the traits menu popup
			pressedButton = pSMU_Door5.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
			If (pressedButton == 0 )
				; Go back to the main character menu
				MessageCount = 2
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
			ElseIf (pressedButton == 1 )
				;No traits message
				pSMU_TraitNone.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				;reset all traits
				PlayerTrait01 = false
				PlayerTrait02 = false
				PlayerTrait03 = false
				PlayerTrait04 = false
				PlayerTrait05 = false
				PlayerTrait06 = false
				PlayerTrait07 = false
				PlayerTrait08 = false
				PlayerTrait09 = false
				PlayerTrait10 = false
				PlayerTrait11 = false
				PlayerTrait12 = false
				PlayerTrait13 = false
				PlayerTrait14 = false
				PlayerTrait15 = false
				PlayerTrait16 = false
				PlayerTrait17 = false
				PlayerTrait18 = false
				OldGifted = false
				OldSmallFrame = false
				MessageCount = 5
			ElseIf (pressedButton == 2 )
				pressedButton = pSMU_TraitBroadShoulders.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait01 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 3 )
				pressedButton = pSMU_TraitBruiser.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait02 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 4 )
				pressedButton = pSMU_TraitClaustrophobia.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait03 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 5 )
				pressedButton = pSMU_TraitEarlyBird.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait04 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 6 )
				pressedButton = pSMU_TraitFastMetabolism.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait05 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 7 )
				pressedButton = pSMU_TraitFastShot.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait06 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 8 )
				pressedButton = pSMU_TraitFinesse.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait07 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 9 )
				pressedButton = pSMU_TraitFourEyes.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait08 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 10 )
				pressedButton = pSMU_TraitGifted.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait09 = true
					OldGifted = false
					MessageCount = 5
				elseif (pressedButton == 1 )
					OldGifted = true
					PlayerTrait09 = false
					MessageCount = 5
				elseif (pressedButton == 2 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 11 )
				pressedButton = pSMU_TraitGoodNatured.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait10 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 12 )
				pressedButton = pSMU_TraitHeavyHanded.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait11 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 13 )
				pressedButton = pSMU_TraitHotBlooded.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait12 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 14 )
				pressedButton = pSMU_TraitKamikaze.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait13 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 15 )
				pressedButton = pSMU_TraitLooseCannon.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait14 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 16 )
				pressedButton = pSMU_TraitNightOwl.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait15 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 17 )
				pressedButton = pSMU_TraitSmallFrame.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait16 = true
					OldSmallFrame = false
					MessageCount = 5
				elseif (pressedButton == 1 )
					OldSmallFrame = true
					PlayerTrait16 = false
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 18 )
				pressedButton = pSMU_TraitTriggerDiscipline.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait17 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			ElseIf (pressedButton == 19 )
				pressedButton = pSMU_TraitUnsightly.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)
				if (pressedButton == 0 )
					PlayerTrait18 = true
					MessageCount = 5
				elseif (pressedButton == 1 )
					MessageCount = 5
				endif
			EndIf ;traits message box
		
		;select difficulty (gear scarcity)
		ElseIf MessageCount == 6
			;show the message popup with difficulty choices
			pressedButton = pSMU_Door6.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)		
			If (pressedButton == 0 )
				;easy
				PlayerDiff = 3
				MessageCount = 2
			ElseIf (pressedButton == 1 )
				;medium
				PlayerDiff = 2
				MessageCount = 2
			ElseIf (pressedButton == 2 )
				;hard
				PlayerDiff = 1
				MessageCount = 2
			ElseIf (pressedButton == 3 )
				;just clothes
				PlayerDiff = 0
				MessageCount = 2
			EndIf
		
		;select level
		ElseIf MessageCount == 7
			;show the message popup with Level choices
			pressedButton = pSMU_Door7.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)		
			If (pressedButton == 0 )
				pSMU_StartLevel.SetValueInt(1)
				MessageCount = 2
			ElseIf (pressedButton == 1 )
				pSMU_StartLevel.SetValueInt(5)
				MessageCount = 2
			ElseIf (pressedButton == 2 )
				pSMU_StartLevel.SetValueInt(10)
				MessageCount = 2
			ElseIf (pressedButton == 3 )
				pSMU_StartLevel.SetValueInt(15)
				MessageCount = 2
			ElseIf (pressedButton == 4 )
				pSMU_StartLevel.SetValueInt(25)
				MessageCount = 2
			ElseIf (pressedButton == 5 )
				pSMU_StartLevel.SetValueInt(50)
				MessageCount = 2
			ElseIf (pressedButton == 6 )
				pSMU_StartLevel.SetValueInt(100)
				MessageCount = 2
			ElseIf (pressedButton == 7 )
				pSMU_StartLevel.SetValueInt(Utility.RandomInt(1, 5))
				MessageCount = 2
			ElseIf (pressedButton == 8 )
				pSMU_StartLevel.SetValueInt(Utility.RandomInt(1, 10))
				MessageCount = 2
			ElseIf (pressedButton == 9 )
				pSMU_StartLevel.SetValueInt(Utility.RandomInt(1, 15))
				MessageCount = 2
			ElseIf (pressedButton == 10 )
				pSMU_StartLevel.SetValueInt(Utility.RandomInt(1, 25))
				MessageCount = 2
			ElseIf (pressedButton == 11 )
				pSMU_StartLevel.SetValueInt(Utility.RandomInt(1, 50))
				MessageCount = 2
			ElseIf (pressedButton == 12 )
				pSMU_StartLevel.SetValueInt(Utility.RandomInt(1, 100))
				MessageCount = 2
			ElseIf (pressedButton == 13 )
				pSMU_StartLevel.SetValueInt(Utility.RandomInt(25, 50))
				MessageCount = 2
			ElseIf (pressedButton == 14 )
				pSMU_StartLevel.SetValueInt(Utility.RandomInt(50, 100))
				MessageCount = 2
			EndIf
			
		Elseif MessageCount == 8
			;showtherandommenu
			;show the 1st message popup with class choices
			pressedButton = pSMU_Door8.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)					
			If (pressedButton == 0 )
				;ready to rock and roll
				;set globals 
				pSMU_FollowedVanillaPath.SetValueInt(0)	
				pSMU_VaultStart.SetValueInt(0)
				pSMU_CanTalkToNick.SetValueInt(0)
				;player picked a start - exit the menu
				InMenu = False
				;Set this up so the player can't trigger the door twice
				Self.gotoState("HasBeenTriggered")	
				;fade out to black
				Game.FadeOutGame(true, true, 0, 6.0, false)
				Utility.Wait(5.0)	
				;randomize character stats if they need to be randomized
				SMUrandomcharacter()
				
				;move player to xmarker heading
				SMUmovePlayer()
				
				
				;add traits
				SMUaddTrait()
				
				;level player
				SMUlevelup()
				
				;give player their gear (has to be done after the player is moved, otherwise they will see it if they are in third person mode)
				SMUgivegear()
			ElseIf (pressedButton == 1 )	
				;go back
				MessageCount = 2
			ElseIf (pressedButton == 2 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomSpecial.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomSpecial.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 3 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomSpecial.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomSpecial.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 4 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomTraits.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomTraits.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 5 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomTraits.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomTraits.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 6 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomClass.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomClass.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 7 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomClass.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomClass.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 8 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomLocation.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomLocation.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 9 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomLocation.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomLocation.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 10 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomGear.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomGear.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 11 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomGear.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomGear.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 12 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomLevel.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomLevel.SetValueInt(0)
					MessageCount = 8
				endif
			ElseIf (pressedButton == 13 )	
				pressedButton = pSMU_Randomize.Show(0, 0, 0, 0, 0, 0, 0, 0, 0)	
				if (pressedButton == 0 )
					pSMU_RandomLevel.SetValueInt(1)
					MessageCount = 8
				elseif (pressedButton == 1 )
					pSMU_RandomLevel.SetValueInt(0)
					MessageCount = 8
				endif
			EndIf
		
		EndIf ;messagecount
	ENDWHILE
EndFunction

;===============================================================================================================================
;===============================================================================================================================
;===============================================================================================================================

bool Function MovePlayerTo()
	return Player.MoveTo(pSMU_SpawnTriggerREF)
EndFunction

int iXmarkerHeading = 0x0973E2 const
string FO4 = "Fallout4.esm"
string sDLC01 = "DLC01Robot.esm"
string sDLC03 = "DLC03Coast.esm"

; SMUR Xbox 1.0.0 move player now sets stages to move the player for easier reference later as the quests expand into actual quests.
function SMUmovePlayer()
	Actor PlayerREF = Game.GetPlayer()
	Game.ForceFirstPerson()
	
	;/ -- set onQuestInit()
	;always move in the big trigger box for entering v111
	pSMU_V111ExteriorElevatorTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
	pSMU_V111ExteriorElevatorTriggerREF.SetPosition(-88456.21875, 91542.28125, 7001.701172)
	pSMU_V111ExteriorElevatorTriggerREF.SetAngle(0, 0, 0)
	/;
	If (PlayerLocation == 0)
		;VAULT 111 EXTERIOR WATCHING POINT
		;SetStage(1000)
		;/
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-92614.51563, 86043.04688, 9590.967773)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		/;
		MovePlayerTo()
	ElseIf (PlayerLocation == 1)
		;JAHANI BUNKER - INTERIOR
		;SetStage(1100)
		;/
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(0x0A3701, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-60.152977, -147.57962, 70.390335)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		/;
	ElseIf (PlayerLocation == 2)
		;RAIDER GROUP
		;set a global so we know that we have enemies at this location to add to the player's faction
		pSMU_StartPoint.SetValueInt(4)
		
		; Start the Quest to move everything into position:
		;pSMU_Raiders.Start()
		;let quest do its thing
		Utility.Wait(5.0)
		;pSMU_Raiders.SetStage(15)
		
		; below is handled by quest stage 10 and 15 now.
		;add player to raider faction for this group of raiders
		;/
		PlayerREF.AddToFaction(pSMU_RaiderFaction)
		;try to add raiders to faction in advance
		(Game.GetFormFromFile(0x246D12, FO4) as Actor).AddToFaction(pSMU_RaiderFaction)
		(Game.GetFormFromFile(0x246D10, FO4) as Actor).AddToFaction(pSMU_RaiderFaction)
		(Game.GetFormFromFile(0x246D0F, FO4) as Actor).AddToFaction(pSMU_RaiderFaction)
		(Game.GetFormFromFile(0x246D11, FO4) as Actor).AddToFaction(pSMU_RaiderFaction)
		(Game.GetFormFromFile(0x246D13, FO4) as Actor).AddToFaction(pSMU_RaiderFaction)
		(Game.GetFormFromFile(0x246D12, FO4) as Actor).RemoveFromFaction(pRaiderFaction)
		(Game.GetFormFromFile(0x246D10, FO4) as Actor).RemoveFromFaction(pRaiderFaction)
		(Game.GetFormFromFile(0x246D0F, FO4) as Actor).RemoveFromFaction(pRaiderFaction)
		(Game.GetFormFromFile(0x246D11, FO4) as Actor).RemoveFromFaction(pRaiderFaction)
		(Game.GetFormFromFile(0x246D13, FO4) as Actor).RemoveFromFaction(pRaiderFaction)
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-94041.50781, 77626.14844, 8854.283203)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		/;
	ElseIf (PlayerLocation == 3)
		;RANGER CABIN
		;set a global so we know that we have enemies at this location to disable via the trigger box script
		pSMU_StartPoint.SetValueInt(1)

		;SMU_RangerCabin.Start()
		
		;below is handled by quest stage 10 now
		;/
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-87821.14844, 71251.51563, 7806.604004)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		/;
	ElseIf (PlayerLocation == 4)
		;RED ROCKET
		
		;SetStage(1200)
		
		;/
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-70170.41406, 79006.5625, 7424)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		/;
	ElseIf (PlayerLocation == 5)
		;ROBOTICS DISPOSAL
		
		;SetStage(1300)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-52832.03906, 98285.78906, 8761.40625)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		;enable ground mattress
		ObjectReference SMU_BedREF = (Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference).PlaceAtMe(pSMU_NpcBedGroundSleep01)
		SMU_BedREF.SetPosition(-52891.91406, 98168.64063, 8693.09961)
		SMU_BedREF.SetAngle(0, 0, 69.7185)
	ElseIf (PlayerLocation == 6)
		;CONCORD HOUSE
		
		;SetStage(1400)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-66983.03906, 76797.51563, 6896.92627)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 7)
		;DRUNK
		
		;SetStage(1500)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-46835.05469, 74311.50781, 5072.693848)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)	
	ElseIf (PlayerLocation == 8)
		;DRUMLIN
		
		;SetStage(1600)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-51770.86719, 51754.89844, 4699.465332)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 308.4339)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 9)
		;TENPINES
		;set a global so we know that we have enemies at this location to disable via the trigger box script
		pSMU_StartPoint.SetValueInt(2)
		
		;pSMU_Tenpines.Start()
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-23145.80469, 91774.36719, 6078.209473)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)	
	ElseIf (PlayerLocation == 10)
		;LONELY CHAPEL
		
		;SetStage(1700)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-90299.1250, 29514.1738, 6416.4272)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		;enable ground mattress
		ObjectReference SMU_BedREF = (Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference).PlaceAtMe(pSMU_NpcBedGroundSleep01)
		SMU_BedREF.SetPosition(-90281.2734, 29561.0781, 6338.5088)
		SMU_BedREF.SetAngle(0, 0, -28.6477)
	ElseIf (PlayerLocation == 11)
		;ROCKY NARROWS
		
		;SetStage(1800)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-55775.3438, 28319.1797, 5168.9683)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 12)
		;WILDWOOD CEMETERY
		;there is a Shiba Inu nearby added by Creation Club
		
		;SetStage(1900)
		
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-9224.3145, 66715.9453, 2965.1833)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 13)
		;LAKE QUANNAPOWITT
		
		;SetStage(2000)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(17640.5957, 94955.0313, 3171.5613)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 14)
		;RELAY TOWER 1DL 109
		
		;SetStage(2100)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-51114.1953, -11463.7451, 2304.6558)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, -5.7295)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		;enable ground mattress
		ObjectReference SMU_BedREF = (Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference).PlaceAtMe(pSMU_NpcBedGroundSleep01)
		SMU_BedREF.SetPosition(-51101.3320, -11486.7998, 2228.3689)
		SMU_BedREF.SetAngle(0, 0, -102.1689)
	ElseIf (PlayerLocation == 15)
		;UNION HOPE CATHEDRAL (cambridgechurchgraveyard01) - INTERIOR
		
		;SetStage(2200)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(0x1BAF4B, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(2231.4644, 2878.6875, 846.1039)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, -5.7295)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		;enable ground mattress
		ObjectReference SMU_BedREF = (Game.GetFormFromFile(0x1BAF4B, FO4) as objectreference).PlaceAtMe(pSMU_NpcBedGroundSleep01)
		SMU_BedREF.SetPosition(2248.1885, 2904.7068, 767.9999)
		SMU_BedREF.SetAngle(0, 0, -5.7295)
	ElseIf (PlayerLocation == 16)
		;VAULT 81
		
		;SetStage(2300)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-36636.625, -25005.67773, 1971.90979)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 45.8367)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 17)
		;DC RESIDENT SWATTER
		
		;SetStage(2400)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-9497.65625, -29628.35742, 1424.256958)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 131.7803)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 18)
		;BOYLSTON CLUB (bostoncommon02) - INTERIOR
		
		;SetStage(2500)
				
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(0x1AD6B3, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(108.2223, 2810.4109, 128.7562)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 19)
		;GOODNEIGHBOR - luckily we have a vanilla x-marker right by a bed!
		
		;SetStage(2600)
		
		;PlayerRef.Moveto(pFFG07BobbiDebugSpawn)
		pSMU_SpawnTriggerREF.MoveTo(pFFG07BobbiDebugSpawn)
		pSMU_SpawnTriggerREF.SetPosition(20455.72266, -10444.55566, 699.951172)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 20)
		;BUNKER HILL
		
		;SetStage(2700)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(16961.0957, 13433.6377, 1328.548828)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 68.7549)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		;skip the Bunker Hill intro dialogue
		pDialogueBunkerHill.SetStage(10)
	ElseIf (PlayerLocation == 21)
		;RELAY TOWER 0MC 810
		
		;SetStage(2800)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(25581.31641, 38939.16016, 1979.527466)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
	ElseIf (PlayerLocation == 22)
		;GREENTOP NURSERY
		
		;SetStage(2900)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(29678.0039, 66554.8359, 2262.3281)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
		;enable ground mattress
		ObjectReference SMU_BedREF = (Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference).PlaceAtMe(pSMU_NpcBedGroundSleep01)
		SMU_BedREF.SetPosition(29659.8672, 66560.9531, 2189.9216)
		SMU_BedREF.SetAngle(0, 0, -22.9182)
	ElseIf (PlayerLocation == 23)
		;ROADSIDE PINES - raider gang #2
		;set a global so we know that we have enemies at this location to add to the player's faction
		pSMU_StartPoint.SetValueInt(5)
		
		; Start the Quest to move everything into position:
		;pSMU_Raiders2.Start()
		;let Raiders2 do it's thing.
		Utility.Wait(5.0)
		;move player to xmarker heading.
		;pSMU_Raiders2.SetStage(15)
		; below is handled by quest stage 10 and 15 now.
		
		;/
		;add player to raider faction for this group of raiders
		PlayerREF.AddToFaction(pSMU_RaiderFaction2)
		;try to add raiders to faction in advance
		(Game.GetFormFromFile(0x04E933, FO4) as Actor).AddToFaction(pSMU_RaiderFaction2)
		(Game.GetFormFromFile(0x1CCBB8, FO4) as Actor).AddToFaction(pSMU_RaiderFaction2)
		(Game.GetFormFromFile(0x1CCBF5, FO4) as Actor).AddToFaction(pSMU_RaiderFaction2)
		(Game.GetFormFromFile(0x1CCBF8, FO4) as Actor).AddToFaction(pSMU_RaiderFaction2)
		(Game.GetFormFromFile(0x04E933, FO4) as Actor).RemoveFromFaction(pRaiderFaction)
		(Game.GetFormFromFile(0x1CCBB8, FO4) as Actor).RemoveFromFaction(pRaiderFaction)
		(Game.GetFormFromFile(0x1CCBF5, FO4) as Actor).RemoveFromFaction(pRaiderFaction)
		(Game.GetFormFromFile(0x1CCBF8, FO4) as Actor).RemoveFromFaction(pRaiderFaction)
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-89227.5234, -42622.9023, 2906.6938)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, -34.3774)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
		/;
		
		
	ElseIf (PlayerLocation == 24)
		;EGRET TOURS
		
		;SetStage(3000)
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-34281.4648, -58842.4258, 1381.7563)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
		;enable ground mattress
		ObjectReference SMU_BedREF = (Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference).PlaceAtMe(pSMU_NpcBedGroundSleep01)
		SMU_BedREF.SetPosition(-34331.6484, -58690.5117, 1316.3940)
		SMU_BedREF.SetAngle(0, 0, -114.5914)
	ElseIf (PlayerLocation == 25)
		;FAIRLINE HILL ESTATES
		
		;SetStage(3100)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-16684.3027, -50884.9922, 2631.2061)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, -74.4844)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
	ElseIf (PlayerLocation == 26)
		;SOUTH BOSTON AREA
		
		;SetStage(3200)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(35214.0352, -43609.0117, 1333.7786)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 45.8367)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
	ElseIf (PlayerLocation == 27)
		;CRATER OF Atom
		
		;SetStage(3300)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-102417.4297, -115653.0313, 7988.8516)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
	ElseIf (PlayerLocation == 28)
		;SOMERVILLE PLACE (cambridgeplumbing01) - INTERIOR
		
		;SetStage(3400)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(0x1BC0EA, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(556.9954, 2147.8765, 454.4336)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
		;enable ground mattress
		ObjectReference SMU_BedREF = (Game.GetFormFromFile(0x1BC0EA, FO4) as objectreference).PlaceAtMe(pSMU_NpcBedGroundSleep01)
		SMU_BedREF.SetPosition(550.0901, 2308.1968, 382.8701)
		SMU_BedREF.SetAngle(0, 0, -80.2139)
	ElseIf (PlayerLocation == 29)
		;PARSON'S CREAMERY
		
		;SetStage(3500)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(49625.9336, 99536.9844, 2648.0999)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
	ElseIf (PlayerLocation == 30)
		;GLOWING SEA - INTERIOR
		
		;SetStage(3600)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(0x1B2F2C, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(-745.453552, -576.368347, 1400.556274)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
	ElseIf (PlayerLocation == 31)
		;QUINCY
		
		;pSMU_Quincy.Start()
		
		;set a global so we know that we have enemies at this location to disable via the trigger box script
		pSMU_StartPoint.SetValueInt(3)
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(16745.45703, -72603.83594, 1903.548706)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 32)
		;ATOMCATS
		
		;SetStage(3700)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(41464.87109, -71519.5625, 733.578247)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		;enable ground mattress
		ObjectReference SMU_BedREF = (Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference).PlaceAtMe(pSMU_NpcBedGroundSleep01)
		SMU_BedREF.SetPosition(41418.8281, -71564.6797, 673.7899)
		SMU_BedREF.SetAngle(-4.4404, 359.6722, -18.1496)
	ElseIf (PlayerLocation == 33)
		;SAILOR
		
		;SetStage(3800)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(83838.36719, -86575.04688, 533.56311)
		pSMU_SpawnTriggerREF.SetAngle(359.1167, 4.4372, 11.8701)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
	ElseIf (PlayerLocation == 34)
		;MURKWATER SE
		
		;SetStage(3900)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(50741.2578, -99524.8359, 741.7751)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, -74.4844)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
	ElseIf (PlayerLocation == 35)
		;NORDHAGEN BEACH
		
		;SetStage(4000)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(64219.5859, 3435.1958, 783.5336)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, -57.2957)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF) 
	ElseIf (PlayerLocation == 36)
		;NAHANT OCEANOLOGICAL SOCIETY - INTERIOR
		
		;SetStage(4100)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(0x0461AA, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(2231.0630, -125.7197, 325.5001)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
	ElseIf (PlayerLocation == 37)
		;HUGO'S HOLE
		
		;SetStage(4200)
		
		;move player to xmarker heading
		pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(iXMarkerHeading, FO4) as objectreference)
		pSMU_SpawnTriggerREF.SetPosition(73585.2344, 72237.7656, 1779.0452)
		pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)
		PlayerRef.Moveto(pSMU_SpawnTriggerREF)
		(Game.GetFormFromFile(0x13BF1F, FO4) as Actor).DisableNoWait()
	EndIf
EndFunction

;===============================================================================================================================
;===============================================================================================================================
;===============================================================================================================================
function SMUgivegear()
	Actor PlayerREF = Game.GetPlayer()
	;add base gear
	If PlayerDiff == 0
		PlayerREF.addItem(pPipboy, 1, True)
		PlayerREF.equipItem(pPipboy, False, True)
	Elseif PlayerDiff == 1
		PlayerREF.additem(pSMU_GearBaseAHard, 1, True)
		PlayerREF.equipItem(pPipboy, False, True)
	Elseif PlayerDiff == 2
		PlayerREF.additem(pSMU_GearBaseBMedium, 1, True)
		PlayerREF.equipItem(pPipboy, False, True)
	Elseif PlayerDiff == 3
		PlayerREF.additem(pSMU_GearBaseCEasy, 1, True)
		PlayerREF.equipItem(pPipboy, False, True)
	Endif
	;add class gear
	If (PlayerClass == 1)
		;VAULT ENTHUSIAST
		pSMU_PlayerClass.SetValueInt(1)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_Vault114_Underwear, 1, True)
			PlayerREF.equipItem(pArmor_Vault114_Underwear, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_01AVaultDwellerHard, 1, True)
			PlayerREF.equipItem(pArmor_Vault114_Underwear, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_01BVaultDwellerMedium, 1, True)
			PlayerREF.equipItem(pArmor_Vault114_Underwear, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_01CVaultDwellerEasy, 1, True)
			PlayerREF.equipItem(pArmor_Vault114_Underwear, False, True)
		endif

	ElseIf (PlayerClass == 2)
		;SURVIVALIST
		pSMU_PlayerClass.SetValueInt(2)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesFatiguesPostWar, 1, True)
			PlayerREF.equipItem(pClothesFatiguesPostWar, False, True)
			PlayerREF.addItem(pClothesGrayKnitCap, 1, True)
			PlayerREF.equipItem(pClothesGrayKnitCap, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_02ASurvivalistHard, 1, True)
			PlayerREF.equipItem(pClothesFatiguesPostWar, False, True)
			PlayerREF.equipItem(pClothesGrayKnitCap, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_02BSurvivalistMedium, 1, True)
			PlayerREF.equipItem(pClothesFatiguesPostWar, False, True)
			PlayerREF.equipItem(pClothesGrayKnitCap, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_02CSurvivalistEasy, 1, True)
			PlayerREF.equipItem(pClothesFatiguesPostWar, False, True)
			PlayerREF.equipItem(pClothesGrayKnitCap, False, True)
		endif			

	ElseIf (PlayerClass == 3)
		;SCAVENGER
		pSMU_PlayerClass.SetValueInt(3)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesResident6, 1, True)
			PlayerREF.equipItem(pClothesResident6, False, True)
			PlayerREF.addItem(pClothesDog_Bandana, 1, True)
			PlayerREF.equipItem(pClothesDog_Bandana, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_03AScavengerHard, 1, True)
			PlayerREF.equipItem(pClothesResident6, False, True)
			PlayerREF.equipItem(pClothesDog_Bandana, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_03BScavengerMedium, 1, True)
			PlayerREF.equipItem(pClothesResident6, False, True)
			PlayerREF.equipItem(pClothesDog_Bandana, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_03CScavengerEasy, 1, True)
			PlayerREF.equipItem(pClothesResident6, False, True)
			PlayerREF.equipItem(pClothesDog_Bandana, False, True)
		endif	

	ElseIf (PlayerClass == 4)
		;HUNTER
		pSMU_PlayerClass.SetValueInt(4)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesResident5, 1, True)
			PlayerREF.equipItem(pClothesResident5, False, True)
			PlayerREF.addItem(pClothesWinterHat, 1, True)
			PlayerREF.equipItem(pClothesWinterHat, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_04AHunterHard, 1, True)
			PlayerREF.equipItem(pClothesResident5, False, True)
			PlayerREF.equipItem(pClothesWinterHat, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_04BHunterMedium, 1, True)
			PlayerREF.equipItem(pClothesResident5, False, True)
			PlayerREF.equipItem(pClothesWinterHat, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_04CHunterEasy, 1, True)
			PlayerREF.equipItem(pClothesResident5, False, True)
			PlayerREF.equipItem(pClothesWinterHat, False, True)
		endif	

	ElseIf (PlayerClass == 5)
		;RAIDER
		pSMU_PlayerClass.SetValueInt(5)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_Raider_Underarmor, 1, True)
			PlayerREF.equipItem(pArmor_Raider_Underarmor, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_05ARaiderHard, 1, True)
			PlayerREF.equipItem(pArmor_Raider_Underarmor, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_05BRaiderMedium, 1, True)
			PlayerREF.equipItem(pArmor_Raider_Underarmor, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_05CRaiderEasy, 1, True)
			PlayerREF.equipItem(pArmor_Raider_Underarmor, False, True)
		endif	

	ElseIf (PlayerClass == 6)
		;MECHANIC
		pSMU_PlayerClass.SetValueInt(6)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesRRJumpsuit, 1, True)
			PlayerREF.equipItem(pClothesRRJumpsuit, False, True)
			PlayerREF.addItem(pClothes_Raider_Goggles, 1, True)
			PlayerREF.equipItem(pClothes_Raider_Goggles, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_06AMechanicHard, 1, True)
			PlayerREF.equipItem(pClothesRRJumpsuit, False, True)
			PlayerREF.equipItem(pClothes_Raider_Goggles, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_06BMechanicMedium, 1, True)
			PlayerREF.equipItem(pClothesRRJumpsuit, False, True)
			PlayerREF.equipItem(pClothes_Raider_Goggles, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_06CMechanicEasy, 1, True)
			PlayerREF.equipItem(pClothesRRJumpsuit, False, True)
			PlayerREF.equipItem(pClothes_Raider_Goggles, False, True)
		endif	

	ElseIf (PlayerClass == 7)
		;GANGSTER
		pSMU_PlayerClass.SetValueInt(7)
		if PlayerDiff == 0	
			PlayerREF.addItem(ClothesSuitDirty_Black, 1, True)
			PlayerREF.equipItem(ClothesSuitDirty_Black, False, True)
			PlayerREF.addItem(pClothesResident3Hat, 1, True)
			PlayerREF.equipItem(pClothesResident3Hat, False, True)
			PlayerREF.addItem(pClothesSunGlasses, 1, True)
			PlayerREF.equipItem(pClothesSunGlasses, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_07AGangsterHard, 1, True)
			PlayerREF.equipItem(ClothesSuitDirty_Black, False, True)
			PlayerREF.equipItem(pClothesResident3Hat, False, True)
			PlayerREF.equipItem(pClothesSunGlasses, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_07BGangsterMedium, 1, True)
			PlayerREF.equipItem(ClothesSuitDirty_Black, False, True)
			PlayerREF.equipItem(pClothesResident3Hat, False, True)
			PlayerREF.equipItem(pClothesSunGlasses, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_07CGangsterEasy, 1, True)
			PlayerREF.equipItem(ClothesSuitDirty_Black, False, True)
			PlayerREF.equipItem(pClothesResident3Hat, False, True)
			PlayerREF.equipItem(pClothesSunGlasses, False, True)
		endif	

	ElseIf (PlayerClass == 8)
		;TRADER
		pSMU_PlayerClass.SetValueInt(8)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesResident7, 1, True)
			PlayerREF.equipItem(pClothesResident7, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_08ATraderHard, 1, True)
			PlayerREF.equipItem(pClothesResident7, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_08BTraderMedium, 1, True)
			PlayerREF.equipItem(pClothesResident7, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_08CTraderEasy, 1, True)
			PlayerREF.equipItem(pClothesResident7, False, True)
		endif	
		
	ElseIf (PlayerClass == 9)
		;FARMER
		pSMU_PlayerClass.SetValueInt(9)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesResident3, 1, True)
			PlayerREF.equipItem(pClothesResident3, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_09AFarmerHard, 1, True)
			PlayerREF.equipItem(pClothesResident3, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_09BFarmerMedium, 1, True)
			PlayerREF.equipItem(pClothesResident3, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_09CFarmerEasy, 1, True)
			PlayerREF.equipItem(pClothesResident3, False, True)
		endif	

	ElseIf (PlayerClass == 10)
		;DRUNK
		pSMU_PlayerClass.SetValueInt(10)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesTattered, 1, True)
			PlayerREF.equipItem(pClothesTattered, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_10ADrunkHard, 1, True)
			PlayerREF.equipItem(pClothesTattered, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_10BDrunkMedium, 1, True)
			PlayerREF.equipItem(pClothesTattered, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_10CDrunkEasy, 1, True)
			PlayerREF.equipItem(pClothesTattered, False, True)
		endif	

	ElseIf (PlayerClass == 11)
		;DOCTOR
		pSMU_PlayerClass.SetValueInt(11)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesScientist_VariantWasteland, 1, True)
			PlayerREF.equipItem(pClothesScientist_VariantWasteland, False, True)
			PlayerREF.addItem(pClothesEyeGlasses, 1, True)
			PlayerREF.equipItem(pClothesEyeGlasses, False, True)
			PlayerREF.addItem(pClothes_Raider_SurgicalMask, 1, True)
			PlayerREF.equipItem(pClothes_Raider_SurgicalMask, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_11ADoctorHard, 1, True)
			PlayerREF.equipItem(pClothesScientist_VariantWasteland, False, True)
			PlayerREF.equipItem(pClothesEyeGlasses, False, True)
			PlayerREF.equipItem(pClothes_Raider_SurgicalMask, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_11BDoctorMedium, 1, True)
			PlayerREF.equipItem(pClothesScientist_VariantWasteland, False, True)
			PlayerREF.equipItem(pClothesEyeGlasses, False, True)
			PlayerREF.equipItem(pClothes_Raider_SurgicalMask, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_11CDoctorEasy, 1, True)
			PlayerREF.equipItem(pClothesScientist_VariantWasteland, False, True)
			PlayerREF.equipItem(pClothesEyeGlasses, False, True)
			PlayerREF.equipItem(pClothes_Raider_SurgicalMask, False, True)
		endif	

	ElseIf (PlayerClass == 12)
		;SCIENTIST
		pSMU_PlayerClass.SetValueInt(12)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesVaultTecScientist, 1, True)
			PlayerREF.equipItem(pClothesVaultTecScientist, False, True)
			PlayerREF.addItem(pClothesEyeGlasses, 1, True)
			PlayerREF.equipItem(pClothesEyeGlasses, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_12AScientistHard, 1, True)
			PlayerREF.equipItem(pClothesVaultTecScientist, False, True)
			PlayerREF.equipItem(pClothesEyeGlasses, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_12BScientistMedium, 1, True)
			PlayerREF.equipItem(pClothesVaultTecScientist, False, True)
			PlayerREF.equipItem(pClothesEyeGlasses, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_12CScientistEasy, 1, True)
			PlayerREF.equipItem(pClothesVaultTecScientist, False, True)
			PlayerREF.equipItem(pClothesEyeGlasses, False, True)
		endif	

	ElseIf (PlayerClass == 13)
		;MERCENARY
		pSMU_PlayerClass.SetValueInt(13)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_Wastelander_Light, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Light, False, True)
			PlayerREF.addItem(pArmor_Raider_GreenHoodGasmask, 1, True)
			PlayerREF.equipItem(pArmor_Raider_GreenHoodGasmask, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_13AMercenaryHard, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Light, False, True)
			PlayerREF.equipItem(pArmor_Raider_GreenHoodGasmask, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_13BMercenaryMedium, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Medium, False, True)
			PlayerREF.equipItem(pArmor_Raider_GreenHoodGasmask, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_13CMercenaryEasy, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Heavy, False, True)
			PlayerREF.equipItem(pArmor_Raider_GreenHoodGasmask, False, True)
		endif	

	ElseIf (PlayerClass == 14)
		;DC RESIDENT SWATTER
		pSMU_PlayerClass.SetValueInt(14)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesBaseballUniform, 1, True)
			PlayerREF.equipItem(pClothesBaseballUniform, False, True)
			PlayerREF.addItem(pClothesBaseballHat, 1, True)
			PlayerREF.equipItem(pClothesBaseballHat, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_14ABallplayerHard, 1, True)
			PlayerREF.equipItem(pClothesBaseballUniform, False, True)
			PlayerREF.equipItem(pClothesBaseballHat, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_14BBallplayerMedium, 1, True)
			PlayerREF.equipItem(pClothesBaseballUniform, False, True)
			PlayerREF.equipItem(pClothesBaseballHat, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_14CBallplayerEasy, 1, True)
			PlayerREF.equipItem(pClothesBaseballUniform, False, True)
			PlayerREF.equipItem(pClothesBaseballHat, False, True)
		endif	

	ElseIf (PlayerClass == 15)
		;THUG-DRIFTER
		pSMU_PlayerClass.SetValueInt(15)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_Wastelander_Light, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Light, False, True)
			PlayerREF.addItem(pClothesResident3Hat, 1, True)
			PlayerREF.equipItem(pClothesResident3Hat, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_15ADrifterHard, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Light, False, True)
			PlayerREF.equipItem(pClothesResident3Hat, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_15BDrifterMedium, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Light, False, True)
			PlayerREF.equipItem(pClothesResident3Hat, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_15CDrifterEasy, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Medium, False, True)
			PlayerREF.equipItem(pClothesResident3Hat, False, True)
		endif	

	ElseIf (PlayerClass == 16)
		;THIEF
		pSMU_PlayerClass.SetValueInt(16)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_Rustic_Underarmor, 1, True)
			PlayerREF.equipItem(pArmor_Rustic_Underarmor, False, True)
			PlayerREF.addItem(pClothesGrayKnitCap, 1, True)
			PlayerREF.equipItem(pClothesGrayKnitCap, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_16AThiefHard, 1, True)
			PlayerREF.equipItem(pArmor_Rustic_Underarmor, False, True)
			PlayerREF.equipItem(pClothesGrayKnitCap, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_16BThiefMedium, 1, True)
			PlayerREF.equipItem(pArmor_Rustic_Underarmor, False, True)
			PlayerREF.equipItem(pClothesGrayKnitCap, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_16CThiefEasy, 1, True)
			PlayerREF.equipItem(pArmor_Rustic_Underarmor, False, True)
			PlayerREF.equipItem(pClothesGrayKnitCap, False, True)
		endif	

	ElseIf (PlayerClass == 17)
		;SAILOR
		pSMU_PlayerClass.SetValueInt(17)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesLongshoreman, 1, True)
			PlayerREF.equipItem(pClothesLongshoreman, False, True)
			PlayerREF.addItem(pClothesLongshoremanHat, 1, True)
			PlayerREF.equipItem(pClothesLongshoremanHat, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_17ASailorHard, 1, True)
			PlayerREF.equipItem(pClothesLongshoreman, False, True)
			PlayerREF.equipItem(pClothesLongshoremanHat, False, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Weapon HarpoonGun = Game.GetFormFromFile(0x010B81, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(HarpoonGun, 1, True)
				Ammo Harpoon = Game.GetFormFromFile(0x010B80, "DLCCoast.esm") as Ammo
                PlayerREF.Additem(Harpoon, 3, True)  				
            endif
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_17BSailorMedium, 1, True)
			PlayerREF.equipItem(pClothesLongshoreman, False, True)
			PlayerREF.equipItem(pClothesLongshoremanHat, False, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Weapon HarpoonGun = Game.GetFormFromFile(0x010B81, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(HarpoonGun, 1, True)
				Ammo Harpoon = Game.GetFormFromFile(0x010B80, "DLCCoast.esm") as Ammo
                PlayerREF.Additem(Harpoon, 6, True)   				
            endif
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_17CSailorEasy, 1, True)
			PlayerREF.equipItem(pClothesLongshoreman, False, True)
			PlayerREF.equipItem(pClothesLongshoremanHat, False, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Weapon HarpoonGun = Game.GetFormFromFile(0x010B81, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(HarpoonGun, 1, True)
				Ammo Harpoon = Game.GetFormFromFile(0x010B80, "DLCCoast.esm") as Ammo
                PlayerREF.Additem(Harpoon, 12, True)
				Weapon PoleHook = Game.GetFormFromFile(0x009582, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(PoleHook, 1, True)     				
            endif
		endif	

	ElseIf (PlayerClass == 18)
		;GREASER
		pSMU_PlayerClass.SetValueInt(18)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesGreaserJacket, 1, True)
			PlayerREF.equipItem(pClothesGreaserJacket, False, True)
			PlayerREF.addItem(pClothesSunGlasses, 1, True)
			PlayerREF.equipItem(pClothesSunGlasses, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_18AGreaserHard, 1, True)
			PlayerREF.equipItem(pClothesGreaserJacket, False, True)
			PlayerREF.equipItem(pClothesSunGlasses, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_18BGreaserMedium, 1, True)
			PlayerREF.equipItem(pClothesGreaserJacket, False, True)
			PlayerREF.equipItem(pClothesSunGlasses, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_18CGreaserEasy, 1, True)
			PlayerREF.equipItem(pClothesGreaserJacket, False, True)
			PlayerREF.equipItem(pClothesSunGlasses, False, True)
		endif	

	ElseIf (PlayerClass == 19)
		;SCOUT
		pSMU_PlayerClass.SetValueInt(19)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesFatiguesPostWar, 1, True)
			PlayerREF.equipItem(pClothesFatiguesPostWar, False, True)
			PlayerREF.addItem(pClothesMilitaryCap, 1, True)
			PlayerREF.equipItem(pClothesMilitaryCap, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_19AScoutHard, 1, True)
			PlayerREF.equipItem(pClothesFatiguesPostWar, False, True)
			PlayerREF.equipItem(pClothesMilitaryCap, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_19BScoutMedium, 1, True)
			PlayerREF.equipItem(pClothesFatiguesPostWar, False, True)
			PlayerREF.equipItem(pClothesMilitaryCap, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_19CScoutEasy, 1, True)
			PlayerREF.equipItem(pClothesFatiguesPostWar, False, True)
			PlayerREF.equipItem(pClothesMilitaryCap, False, True)
		endif	

	ElseIf (PlayerClass == 20)
		;RAD EXPLORER
		pSMU_PlayerClass.SetValueInt(20)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_HazmatSuit, 1, True)
			PlayerREF.equipItem(pArmor_HazmatSuit, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_20AExplorerHard, 1, True)
			PlayerREF.equipItem(pArmor_HazmatSuit, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_20BExplorerMedium, 1, True)
			PlayerREF.equipItem(pArmor_HazmatSuit, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_20CExplorerEasy, 1, True)
			PlayerREF.equipItem(pArmor_HazmatSuit, False, True)
		endif	

	ElseIf (PlayerClass == 21)
		;BOS Initiate
		pSMU_PlayerClass.SetValueInt(21)
		pPlayerKnowsBoS.SetValueInt(1)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_BoS_Soldier_Underarmor, 1, True)
			PlayerREF.equipItem(pArmor_BoS_Soldier_Underarmor, False, True)
			PlayerREF.addItem(pArmor_BoS_Knight_UnderarmorHelmet, 1, True)
			PlayerREF.equipItem(pArmor_BoS_Knight_UnderarmorHelmet, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_21ABoSHard, 1, True)
			PlayerREF.equipItem(pArmor_BoS_Soldier_Underarmor, False, True)
			PlayerREF.equipItem(pArmor_BoS_Knight_UnderarmorHelmet, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_21BBoSMedium, 1, True)
			PlayerREF.equipItem(pArmor_BoS_Soldier_Underarmor, False, True)
			PlayerREF.equipItem(pArmor_BoS_Knight_UnderarmorHelmet, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_21CBoSEasy, 1, True)
			PlayerREF.equipItem(pArmor_BoS_Soldier_Underarmor, False, True)
			PlayerREF.equipItem(pArmor_BoS_Knight_UnderarmorHelmet, False, True)
		endif	
	
	ElseIf (PlayerClass == 22)
		;RailRoad Tourist
		pSMU_PlayerClass.SetValueInt(22)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesWastelandCommon, 1, True)
			PlayerREF.equipItem(pClothesWastelandCommon, False, True)
			PlayerREF.addItem(pClothesResident5Hat, 1, True)
			PlayerREF.equipItem(pClothesResident5Hat, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_22ARailroadHard, 1, True)
			PlayerREF.equipItem(pClothesWastelandCommon, False, True)
			PlayerREF.equipItem(pClothesResident5Hat, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_22BRailroadMedium, 1, True)
			PlayerREF.equipItem(pClothesWastelandCommon, False, True)
			PlayerREF.equipItem(pClothesResident5Hat, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_22CRailroadEasy, 1, True)
			PlayerREF.equipItem(pClothesWastelandCommon, False, True)
			PlayerREF.equipItem(pClothesResident5Hat, False, True)
		endif	
	
	ElseIf (PlayerClass == 23)
		;Institute Escaped Synth
		pSMU_PlayerClass.SetValueInt(23)
		pPlayerKnowsSynths.SetValueInt(1)
		pPlayerKnowsInstitute.SetValueInt(1)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_Synth_Underarmor, 1, True)
			PlayerREF.equipItem(pArmor_Synth_Underarmor, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_23ASynthHard, 1, True)
			PlayerREF.equipItem(pArmor_Synth_Underarmor, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_23BSynthMedium, 1, True)
			PlayerREF.equipItem(pArmor_Synth_Underarmor, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_23CSynthEasy, 1, True)
			PlayerREF.equipItem(pArmor_Synth_Underarmor, False, True)
		endif	
		
	ElseIf (PlayerClass == 24)
		;Minutemen Survivor
		pSMU_PlayerClass.SetValueInt(24)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesMinutemanOutfit, 1, True)
			PlayerREF.equipItem(pClothesMinutemanOutfit, False, True)
			PlayerREF.addItem(pClothesMinutemanHat, 1, True)
			PlayerREF.equipItem(pClothesMinutemanHat, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_24AMinutemenHard, 1, True)
			PlayerREF.equipItem(pClothesMinutemanOutfit, False, True)
			PlayerREF.equipItem(pClothesMinutemanHat, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_24BMinutemenMedium, 1, True)
			PlayerREF.equipItem(pClothesMinutemanOutfit, False, True)
			PlayerREF.equipItem(pClothesMinutemanHat, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_24CMinutemenEasy, 1, True)
			PlayerREF.equipItem(pClothesMinutemanOutfit, False, True)
			PlayerREF.equipItem(pClothesMinutemanHat, False, True)
		endif	
	
	ElseIf (PlayerClass == 25)
		;Atom - Novice
		pSMU_PlayerClass.SetValueInt(25)
		pPlayerKnowsChildrenOfAtom.SetValueInt(1)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesChildofAtomBrown, 1, True)
			PlayerREF.equipItem(pClothesChildofAtomBrown, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_25AAtomHard, 1, True)
			PlayerREF.equipItem(pClothesChildofAtomBrown, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_25BAtomMedium, 1, True)
			PlayerREF.equipItem(pClothesChildofAtomBrown, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_25CAtomEasy, 1, True)
			PlayerREF.equipItem(pClothesChildofAtomBrown, False, True)
		endif	

	ElseIf (PlayerClass == 26)
		;Gunner Conscript Runaway
		pSMU_PlayerClass.SetValueInt(26)
		pPlayerKnowsGunners.SetValueInt(1)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_GunnerGuard_UnderArmor, 1, True)
			PlayerREF.equipItem(pArmor_GunnerGuard_UnderArmor, False, True)
			PlayerREF.addItem(pClothesPoliceGlasses, 1, True)
			PlayerREF.equipItem(pClothesPoliceGlasses, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_26AGunnersHard, 1, True)
			PlayerREF.equipItem(pArmor_GunnerGuard_UnderArmor, False, True)
			PlayerREF.equipItem(pClothesPoliceGlasses, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_26BGunnersMedium, 1, True)
			PlayerREF.equipItem(pArmor_GunnerGuard_UnderArmor, False, True)
			PlayerREF.equipItem(pClothesPoliceGlasses, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_26CGunnersEasy, 1, True)
			PlayerREF.equipItem(pArmor_GunnerGuard_UnderArmor, False, True)
			PlayerREF.equipItem(pClothesPoliceGlasses, False, True)
		endif	
		
	ElseIf (PlayerClass == 27)
		;Forged
		pSMU_PlayerClass.SetValueInt(27)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_Wastelander_Light, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Light, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_27AForgedHard, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Light, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_27BForgedMedium, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Medium, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_27CForgedEasy, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_Heavy, False, True)
		endif	
	
	ElseIf (PlayerClass == 28)
		;Chinese Agent
		pSMU_PlayerClass.SetValueInt(28)
		if PlayerDiff == 0	
			PlayerREF.addItem(pMS02_ClothesSubmarineCrew, 1, True)
			PlayerREF.equipItem(pMS02_ClothesSubmarineCrew, False, True)
			PlayerREF.addItem(pMS02_ClothesSubmarineCrewHat, 1, True)
			PlayerREF.equipItem(pMS02_ClothesSubmarineCrewHat, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_28AChineseAgentHard, 1, True)
			PlayerREF.equipItem(pMS02_ClothesSubmarineCrew, False, True)
			PlayerREF.equipItem(pMS02_ClothesSubmarineCrewHat, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_28BChineseAgentMedium, 1, True)
			PlayerREF.equipItem(pMS02_ClothesSubmarineCrew, False, True)
			PlayerREF.equipItem(pMS02_ClothesSubmarineCrewHat, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_28CChineseAgentEasy, 1, True)
			PlayerREF.equipItem(pMS02_ClothesSubmarineCrew, False, True)
			PlayerREF.equipItem(pMS02_ClothesSubmarineCrewHat, False, True)
		endif	
	
	ElseIf (PlayerClass == 29)
		;Wealthy DC / Pool Shark
		pSMU_PlayerClass.SetValueInt(29)
		If (Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1 ;if female
			PlayerREF.addItem(pClothesSequinDress, 1, True)
			PlayerREF.equipItem(pClothesSequinDress, False, True)
		Else ;if male
			PlayerREF.addItem(pClothesTuxedo, 1, True)
			PlayerREF.equipItem(pClothesTuxedo, False, True)
			PlayerREF.addItem(pClothesTuxedoHat, 1, True)
			PlayerREF.equipItem(pClothesTuxedoHat, False, True)
		EndIf
		if PlayerDiff == 0
			;do nothing, clothes are handled above
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_29AWealthyDCHard, 1, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_29BWealthyDCMedium, 1, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_29CWealthyDCEasy, 1, True)
		endif	
		
	ElseIf (PlayerClass == 30)
		;Poor DC
		pSMU_PlayerClass.SetValueInt(30)
		if PlayerDiff == 0	
			PlayerREF.addItem(pArmor_Wastelander_02_NoHood_GlovesB, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_02_NoHood_GlovesB, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_30APoorDCHard, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_02_NoHood_GlovesB, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_30BPoorDCMedium, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_02_NoHood_GlovesB, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_30CPoorDCEasy, 1, True)
			PlayerREF.equipItem(pArmor_Wastelander_02_NoHood_GlovesB, False, True)
		endif	
	
	ElseIf (PlayerClass == 31)
		;Institute Scientist Deserter
		pSMU_PlayerClass.SetValueInt(31)
		pPlayerKnowsSynths.SetValueInt(1)
		pPlayerKnowsInstitute.SetValueInt(1)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothes_InstituteLabCoat_Dirty, 1, True)
			PlayerREF.equipItem(pClothes_InstituteLabCoat_Dirty, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_31AInstituteScientistHard, 1, True)
			PlayerREF.equipItem(pClothes_InstituteLabCoat_Dirty, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_31BInstituteScientistMedium, 1, True)
			PlayerREF.equipItem(pClothes_InstituteLabCoat_Dirty, False, True)
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_31CInstituteScientistEasy, 1, True)
			PlayerREF.equipItem(pClothes_InstituteLabCoat_Dirty, False, True)
		endif	
			
	ElseIf (PlayerClass == 32)
		;Cannibal (should have meat hook from DLC03)
		pSMU_PlayerClass.SetValueInt(32)
		if PlayerDiff == 0	
			PlayerREF.addItem(pClothesPrewarSweaterVest, 1, True)
			PlayerREF.equipItem(pClothesPrewarSweaterVest, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_32ACannibalHard, 1, True)
			PlayerREF.equipItem(pClothesPrewarSweaterVest, False, True)
			PlayerREF.additem(pSMU_StrangeMeat, 3, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Weapon MeatHook = Game.GetFormFromFile(0x04b5f4, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(MeatHook, 1, True)   				
            endif
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_32BCannibalMedium, 1, True)
			PlayerREF.equipItem(pClothesPrewarSweaterVest, False, True)
			PlayerREF.additem(pSMU_StrangeMeat, 7, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Weapon MeatHook = Game.GetFormFromFile(0x04b5f4, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(MeatHook, 1, True)     				
            endif
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_32CCannibalEasy, 1, True)
			PlayerREF.equipItem(pClothesPrewarSweaterVest, False, True)
			PlayerREF.additem(pSMU_StrangeMeat, 9, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Weapon MeatHook = Game.GetFormFromFile(0x04b5f4, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(MeatHook, 1, True)			
            endif
		endif	
	
	ElseIf (PlayerClass == 33)
		;Fisherman
		pSMU_PlayerClass.SetValueInt(33)
		if PlayerDiff == 0
			if Game.IsPluginInstalled("DLCCoast.esm")
				Armor FishermanOutfit = Game.GetFormFromFile(0x00914E, "DLCCoast.esm") as Armor
				Armor FishermanHat = Game.GetFormFromFile(0x00914B, "DLCCoast.esm") as Armor
				PlayerREF.Additem(FishermanOutfit, 1, True)
				PlayerREF.Additem(FishermanHat, 1, True)
				PlayerREF.Equipitem(FishermanOutfit, False, True)
				PlayerREF.Equipitem(FishermanHat, False, True)
			endif
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_33AFishermanHard, 1, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Armor FishermanOutfit = Game.GetFormFromFile(0x00914E, "DLCCoast.esm") as Armor
				Armor FishermanHat = Game.GetFormFromFile(0x00914B, "DLCCoast.esm") as Armor
				PlayerREF.Additem(FishermanOutfit, 1, True)
				PlayerREF.Additem(FishermanHat, 1, True)
				PlayerREF.Equipitem(FishermanOutfit, False, True)
				PlayerREF.Equipitem(FishermanHat, False, True)
				Weapon HarpoonGun = Game.GetFormFromFile(0x010B81, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(HarpoonGun, 1, True)
				Ammo Harpoon = Game.GetFormFromFile(0x010B80, "DLCCoast.esm") as Ammo
                PlayerREF.Additem(Harpoon, 9, True)
				Weapon PoleHook = Game.GetFormFromFile(0x009582, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(PoleHook, 1, True) 
            endif
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_35BTrapperMedium, 1, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Armor FishermanOutfit = Game.GetFormFromFile(0x00914E, "DLCCoast.esm") as Armor
				Armor FishermanHat = Game.GetFormFromFile(0x00914B, "DLCCoast.esm") as Armor
				PlayerREF.Additem(FishermanOutfit, 1, True)
				PlayerREF.Additem(FishermanHat, 1, True)
				PlayerREF.Equipitem(FishermanOutfit, False, True)
				PlayerREF.Equipitem(FishermanHat, False, True)
				Weapon HarpoonGun = Game.GetFormFromFile(0x010B81, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(HarpoonGun, 1, True)
				Ammo Harpoon = Game.GetFormFromFile(0x010B80, "DLCCoast.esm") as Ammo
                PlayerREF.Additem(Harpoon, 21, True)
				LeveledItem LeverRifle = Game.GetFormFromFile(0x042E71, "DLCCoast.esm") as LeveledItem
                PlayerREF.Additem(LeverRifle, 1, True)
				LeveledItem LeverRifleAmmo = Game.GetFormFromFile(0x042E72, "DLCCoast.esm") as LeveledItem
                PlayerREF.Additem(LeverRifleAmmo, 7, True)
				Weapon PoleHook = Game.GetFormFromFile(0x009582, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(PoleHook, 1, True)   
            endif
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_35CTrapperEasy, 1, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Armor FishermanOutfit = Game.GetFormFromFile(0x00914E, "DLCCoast.esm") as Armor
				Armor FishermanHat = Game.GetFormFromFile(0x00914B, "DLCCoast.esm") as Armor
				PlayerREF.Additem(FishermanOutfit, 1, True)
				PlayerREF.Additem(FishermanHat, 1, True)
				PlayerREF.Equipitem(FishermanOutfit, False, True)
				PlayerREF.Equipitem(FishermanHat, False, True)
				Weapon HarpoonGun = Game.GetFormFromFile(0x010B81, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(HarpoonGun, 1, True)
				LeveledItem LeverRifle = Game.GetFormFromFile(0x042E71, "DLCCoast.esm") as LeveledItem
                PlayerREF.Additem(LeverRifle, 1, True)
				LeveledItem LeverRifleAmmo = Game.GetFormFromFile(0x042E72, "DLCCoast.esm") as LeveledItem
                PlayerREF.Additem(LeverRifleAmmo, 15, True)
				Ammo Harpoon = Game.GetFormFromFile(0x010B80, "DLCCoast.esm") as Ammo
                PlayerREF.Additem(Harpoon, 36, True)
				Weapon PoleHook = Game.GetFormFromFile(0x009582, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(PoleHook, 1, True)     				
			endif
		Endif
			
	
	ElseIf (PlayerClass == 34)
		;Rust Devil
		pSMU_PlayerClass.SetValueInt(34)
		if PlayerDiff == 0
			PlayerREF.addItem(pArmor_Raider_Underwear, 1, True)
			PlayerREF.equipItem(pArmor_Raider_Underwear, False, True)
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_34ARustDevilHard, 1, True)
			PlayerREF.equipItem(pArmor_Raider_Underwear, False, True)
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_34BRustDevilMedium, 1, True)
			PlayerREF.equipItem(pArmor_Raider_Underwear, False, True)
			if Game.IsPluginInstalled("DLCRobot.esm")
				LeveledItem Robot1 = Game.GetFormFromFile(0x0102B6, "DLCRobot.esm") as LeveledItem
				LeveledItem Robot2 = Game.GetFormFromFile(0x0102C8, "DLCRobot.esm") as LeveledItem
				LeveledItem Robot3 = Game.GetFormFromFile(0x0102C0, "DLCRobot.esm") as LeveledItem
				PlayerREF.Additem(Robot1, 1, True)
				PlayerREF.Additem(Robot2, 1, True)
				PlayerREF.Additem(Robot3, 1, True)
			endif
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_34CRustDevilEasy, 1, True)
			PlayerREF.equipItem(pArmor_Raider_Underwear, False, True)
			if Game.IsPluginInstalled("DLCRobot.esm")
				LeveledItem Robot1 = Game.GetFormFromFile(0x0102B6, "DLCRobot.esm") as LeveledItem ;armleft
				LeveledItem Robot2 = Game.GetFormFromFile(0x0102C8, "DLCRobot.esm") as LeveledItem ;torso
				LeveledItem Robot3 = Game.GetFormFromFile(0x0102C0, "DLCRobot.esm") as LeveledItem ;leg left
				LeveledItem Robot4 = Game.GetFormFromFile(0x0102BB, "DLCRobot.esm") as LeveledItem ;armright
				LeveledItem Robot5 = Game.GetFormFromFile(0x0102C4, "DLCRobot.esm") as LeveledItem ;legright
				Armor Robot6 = Game.GetFormFromFile(0x00864C, "DLCRobot.esm") as Armor ;eyebot helmet
				PlayerREF.Additem(Robot1, 1, True)
				PlayerREF.Additem(Robot2, 1, True)
				PlayerREF.Additem(Robot3, 1, True)
				PlayerREF.Additem(Robot4, 1, True)
				PlayerREF.Additem(Robot5, 1, True)
				PlayerREF.Additem(Robot6, 1, True)
			endif
		endif
	
	ElseIf (PlayerClass == 35)
		;Trapper
		pSMU_PlayerClass.SetValueInt(35)
		if PlayerDiff == 0
			if Game.IsPluginInstalled("DLCCoast.esm")
				Armor TrapperLeathers = Game.GetFormFromFile(0x00ea36, "DLCCoast.esm") as Armor
				PlayerREF.Additem(TrapperLeathers, 1, True)
				PlayerREF.Equipitem(TrapperLeathers, False, True)
			endif
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_35ATrapperHard, 1, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Weapon HarpoonGun = Game.GetFormFromFile(0x010B81, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(HarpoonGun, 1, True)
				Ammo Harpoon = Game.GetFormFromFile(0x010B80, "DLCCoast.esm") as Ammo
                PlayerREF.Additem(Harpoon, 9, True)
				Weapon PoleHook = Game.GetFormFromFile(0x009582, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(PoleHook, 1, True) 
            endif
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_35BTrapperMedium, 1, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Weapon HarpoonGun = Game.GetFormFromFile(0x010B81, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(HarpoonGun, 1, True)
				Ammo Harpoon = Game.GetFormFromFile(0x010B80, "DLCCoast.esm") as Ammo
                PlayerREF.Additem(Harpoon, 21, True)
				LeveledItem LeverRifle = Game.GetFormFromFile(0x042E71, "DLCCoast.esm") as LeveledItem
                PlayerREF.Additem(LeverRifle, 1, True)
				LeveledItem LeverRifleAmmo = Game.GetFormFromFile(0x042E72, "DLCCoast.esm") as LeveledItem
                PlayerREF.Additem(LeverRifleAmmo, 3, True)
				Weapon PoleHook = Game.GetFormFromFile(0x009582, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(PoleHook, 1, True)   
				LeveledItem Trapper1 = Game.GetFormFromFile(0x010BA3, "DLCCoast.esm") as LeveledItem
				Armor Trapper2 = Game.GetFormFromFile(0x00ea36, "DLCCoast.esm") as Armor
				PlayerREF.Additem(Trapper1, 1, True)
				PlayerREF.Additem(Trapper2, 1, True)
				PlayerREF.Equipitem(Trapper2, False, True)
            endif
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_35CTrapperEasy, 1, True)
			if Game.IsPluginInstalled("DLCCoast.esm")
				Weapon HarpoonGun = Game.GetFormFromFile(0x010B81, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(HarpoonGun, 1, True)
				LeveledItem LeverRifle = Game.GetFormFromFile(0x042E71, "DLCCoast.esm") as LeveledItem
                PlayerREF.Additem(LeverRifle, 1, True)
				LeveledItem LeverRifleAmmo = Game.GetFormFromFile(0x042E72, "DLCCoast.esm") as LeveledItem
                PlayerREF.Additem(LeverRifleAmmo, 10, True)
				Ammo Harpoon = Game.GetFormFromFile(0x010B80, "DLCCoast.esm") as Ammo
                PlayerREF.Additem(Harpoon, 36, True)
				Weapon PoleHook = Game.GetFormFromFile(0x009582, "DLCCoast.esm") as Weapon
                PlayerREF.Additem(PoleHook, 1, True)     				
				LeveledItem Trapper1 = Game.GetFormFromFile(0x010BA3, "DLCCoast.esm") as LeveledItem
				LeveledItem Trapper2 = Game.GetFormFromFile(0x010B9E, "DLCCoast.esm") as LeveledItem
				LeveledItem Trapper3 = Game.GetFormFromFile(0x010B99, "DLCCoast.esm") as LeveledItem
				LeveledItem Trapper4 = Game.GetFormFromFile(0x010B94, "DLCCoast.esm") as LeveledItem
				LeveledItem Trapper5 = Game.GetFormFromFile(0x010B8F, "DLCCoast.esm") as LeveledItem
				Armor Trapper6 = Game.GetFormFromFile(0x00ea36, "DLCCoast.esm") as Armor ;underwear
				Armor Trapper7 = Game.GetFormFromFile(0x04fa89, "DLCCoast.esm") as Armor ;lobster trap helmet
				PlayerREF.Additem(Trapper1, 1, True)
				PlayerREF.Additem(Trapper2, 1, True)
				PlayerREF.Additem(Trapper3, 1, True)
				PlayerREF.Additem(Trapper4, 1, True)
				PlayerREF.Additem(Trapper5, 1, True)
				PlayerREF.Additem(Trapper6, 1, True)
				PlayerREF.Additem(Trapper7, 1, True)
				PlayerREF.Equipitem(Trapper6, False, True)
            endif
		endif
		
	
	ElseIf (PlayerClass == 36)
		;Pack
		pSMU_PlayerClass.SetValueInt(36)
		if Game.IsPluginInstalled("DLCNukaWorld.esm")
			Armor FurryUnders = Game.GetFormFromFile(0x027423, "DLCNukaWorld.esm") as Armor
			PlayerREF.Additem(FurryUnders, 1, True)
			PlayerREF.Equipitem(FurryUnders, False, True)
		endif
		if PlayerDiff == 0
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor PackBeanie = Game.GetFormFromFile(0x02770d, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(PackBeanie, 1, True)
				PlayerREF.Equipitem(PackBeanie, False, True)
			endif
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_36APackHard, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor PackBeanie = Game.GetFormFromFile(0x02770d, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(PackBeanie, 1, True)
				PlayerREF.Equipitem(PackBeanie, False, True)
				LeveledItem PackBat = Game.GetFormFromFile(0x044E9B, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(PackBat, 1, True)
				LeveledItem HandRifle = Game.GetFormFromFile(0x04D95F, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifle, 1, True)
				LeveledItem HandRifleAmmo = Game.GetFormFromFile(0x037896, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifleAmmo, 3, True)
			endif
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_36BPackMedium, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor PackBeanie = Game.GetFormFromFile(0x02770d, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(PackBeanie, 1, True)
				PlayerREF.Equipitem(PackBeanie, False, True)
				LeveledItem PackBat = Game.GetFormFromFile(0x044E9B, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(PackBat, 1, True)
				LeveledItem HandRifle = Game.GetFormFromFile(0x04D95F, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifle, 1, True)
				LeveledItem HandRifleAmmo = Game.GetFormFromFile(0x037896, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifleAmmo, 10, True)
				LeveledItem Pack1 = Game.GetFormFromFile(0x027467, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(Pack1, 1, True)
			endif
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_36CPackEasy, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				LeveledItem HandRifle = Game.GetFormFromFile(0x04D95F, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifle, 1, True)
				LeveledItem HandRifleAmmo = Game.GetFormFromFile(0x037896, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifleAmmo, 20, True)
				LeveledItem PackBat = Game.GetFormFromFile(0x044E9B, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(PackBat, 1, True)
				LeveledItem Pack1 = Game.GetFormFromFile(0x027467, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Pack2 = Game.GetFormFromFile(0x02744D, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Pack3 = Game.GetFormFromFile(0x027453, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Pack4 = Game.GetFormFromFile(0x02745B, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Pack5 = Game.GetFormFromFile(0x027461, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Pack6 = Game.GetFormFromFile(0x027459, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(Pack1, 1, True)
				PlayerREF.Additem(Pack2, 1, True)
				PlayerREF.Additem(Pack3, 1, True)
				PlayerREF.Additem(Pack4, 1, True)
				PlayerREF.Additem(Pack5, 1, True)
				PlayerREF.Additem(Pack6, 1, True)
			endif
		endif
	
	ElseIf (PlayerClass == 37)
		;Operators
		pSMU_PlayerClass.SetValueInt(37)
		if Game.IsPluginInstalled("DLCNukaWorld.esm")
			Armor FancySuit = Game.GetFormFromFile(0x028746, "DLCNukaWorld.esm") as Armor
			PlayerREF.Additem(FancySuit, 1, True)
			PlayerREF.Equipitem(FancySuit, False, True)
		endif
		if PlayerDiff == 0
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor OpGlasses = Game.GetFormFromFile(0x02873e, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(OpGlasses, 1, True)
				PlayerREF.Equipitem(OpGlasses, False, True)
			endif
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_37AOperatorsHard, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor OpGlasses = Game.GetFormFromFile(0x02873e, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(OpGlasses, 1, True)
				PlayerREF.Equipitem(OpGlasses, False, True)
				PlayerREF.additem(pKnife, 1, True)
				LeveledItem HandRifle = Game.GetFormFromFile(0x04D95E, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifle, 1, True)
				LeveledItem HandRifleAmmo = Game.GetFormFromFile(0x037896, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifleAmmo, 3, True)
			endif
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_37BOperatorsMedium, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor OpGlasses = Game.GetFormFromFile(0x02873e, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(OpGlasses, 1, True)
				PlayerREF.Equipitem(OpGlasses, False, True)
				PlayerREF.additem(pKnife, 1, True)
				LeveledItem HandRifle = Game.GetFormFromFile(0x04D95E, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifle, 1, True)
				LeveledItem HandRifleAmmo = Game.GetFormFromFile(0x037896, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifleAmmo, 10, True)
				LeveledItem Operator1 = Game.GetFormFromFile(0x0287C8, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(Operator1, 1, True)
			endif
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_37COperatorsEasy, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				LeveledItem HandRifle = Game.GetFormFromFile(0x04D95E, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifle, 1, True)
				LeveledItem HandRifleAmmo = Game.GetFormFromFile(0x037896, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifleAmmo, 20, True)
				PlayerREF.additem(pKnife, 1, True)
				LeveledItem Operator1 = Game.GetFormFromFile(0x0287AE, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Operator2 = Game.GetFormFromFile(0x0287B4, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Operator3 = Game.GetFormFromFile(0x0287BA, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Operator4 = Game.GetFormFromFile(0x0287BC, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Operator5 = Game.GetFormFromFile(0x0287C2, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Operator6 = Game.GetFormFromFile(0x0287C8, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(Operator1, 1, True)
				PlayerREF.Additem(Operator2, 1, True)
				PlayerREF.Additem(Operator3, 1, True)
				PlayerREF.Additem(Operator4, 1, True)
				PlayerREF.Additem(Operator5, 1, True)
				PlayerREF.Additem(Operator6, 1, True)
			endif
		endif
	
	ElseIf (PlayerClass == 38)
		;Disciples
		pSMU_PlayerClass.SetValueInt(38)
		if Game.IsPluginInstalled("DLCNukaWorld.esm")
			Armor TornShirt = Game.GetFormFromFile(0x026ba9, "DLCNukaWorld.esm") as Armor
			PlayerREF.Additem(TornShirt, 1, True)
			PlayerREF.Equipitem(TornShirt, False, True)
		endif
		if PlayerDiff == 0
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor DiscCowl = Game.GetFormFromFile(0x026bb0, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(DiscCowl, 1, True)
				PlayerREF.Equipitem(DiscCowl, False, True)
			endif
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_38ADisciplesHard, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor DiscCowl = Game.GetFormFromFile(0x026bb0, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(DiscCowl, 1, True)
				PlayerREF.Equipitem(DiscCowl, False, True)
				LeveledItem HandRifle = Game.GetFormFromFile(0x04D95D, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifle, 1, True)
				LeveledItem HandRifleAmmo = Game.GetFormFromFile(0x037896, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifleAmmo, 3, True)
				LeveledItem DiscBlade = Game.GetFormFromFile(0x02B0B8, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(DiscBlade, 1, True)
			endif
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_38BDisciplesMedium, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor DiscCowl = Game.GetFormFromFile(0x026bb0, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(DiscCowl, 1, True)
				PlayerREF.Equipitem(DiscCowl, False, True)
				LeveledItem HandRifle = Game.GetFormFromFile(0x04D95D, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifle, 1, True)
				LeveledItem HandRifleAmmo = Game.GetFormFromFile(0x037896, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifleAmmo, 10, True)
				LeveledItem DiscBlade = Game.GetFormFromFile(0x02B0B8, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(DiscBlade, 1, True)
				LeveledItem Disciple1 = Game.GetFormFromFile(0x026B69, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(Disciple1, 1, True)
			endif
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_38CDisciplesEasy, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				LeveledItem HandRifle = Game.GetFormFromFile(0x04D95D, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifle, 1, True)
				LeveledItem HandRifleAmmo = Game.GetFormFromFile(0x037896, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(HandRifleAmmo, 20, True)
				LeveledItem DiscBlade = Game.GetFormFromFile(0x02B0B8, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(DiscBlade, 1, True)
				LeveledItem Disciple1 = Game.GetFormFromFile(0x026B69, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Disciple2 = Game.GetFormFromFile(0x026B6F, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Disciple3 = Game.GetFormFromFile(0x026B75, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Disciple4 = Game.GetFormFromFile(0x026B77, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Disciple5 = Game.GetFormFromFile(0x026B7D, "DLCNukaWorld.esm") as LeveledItem
				LeveledItem Disciple6 = Game.GetFormFromFile(0x026B83, "DLCNukaWorld.esm") as LeveledItem
				PlayerREF.Additem(Disciple1, 1, True)
				PlayerREF.Additem(Disciple2, 1, True)
				PlayerREF.Additem(Disciple3, 1, True)
				PlayerREF.Additem(Disciple4, 1, True)
				PlayerREF.Additem(Disciple5, 1, True)
				PlayerREF.Additem(Disciple6, 1, True)
			endif
		endif
	ElseIf (PlayerClass == 39)
		;Nuka Cola Collector
		pSMU_PlayerClass.SetValueInt(39)
		if PlayerDiff == 0
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor CappyJacket = Game.GetFormFromFile(0x044DA8, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(CappyJacket, 1, True)
				PlayerREF.Equipitem(CappyJacket, False, True)
			endif
		elseif PlayerDiff == 1	
			PlayerREF.additem(pSMU_Gear_39ANukaColaHard, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor CappyJacket = Game.GetFormFromFile(0x044DA8, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(CappyJacket, 1, True)
				PlayerREF.Equipitem(CappyJacket, False, True)
				Potion ColaDark = Game.GetFormFromFile(0x024536, "DLCNukaWorld.esm") as Potion
				Potion ColaGrape = Game.GetFormFromFile(0x024534, "DLCNukaWorld.esm") as Potion
				Potion ColaOrange = Game.GetFormFromFile(0x02453A, "DLCNukaWorld.esm") as Potion
				Potion ColaQuartz = Game.GetFormFromFile(0x024538, "DLCNukaWorld.esm") as Potion
				Potion ColaVictory = Game.GetFormFromFile(0x024544, "DLCNukaWorld.esm") as Potion
				Potion ColaWild = Game.GetFormFromFile(0x02453D, "DLCNukaWorld.esm") as Potion
				PlayerREF.Additem(ColaDark, 1, True)
				PlayerREF.Additem(ColaGrape, 1, True)
				PlayerREF.Additem(ColaOrange, 1, True)
				PlayerREF.Additem(ColaQuartz, 1, True)
				PlayerREF.Additem(ColaVictory, 1, True)
				PlayerREF.Additem(ColaWild, 1, True)
				Weapon ThirstZapper = Game.GetFormFromFile(0x01EF41, "StartMeUp.esp") as Weapon
				PlayerREF.Additem (ThirstZapper, 1, True)
			endif
		elseif PlayerDiff == 2	
			PlayerREF.additem(pSMU_Gear_39BNukaColaMedium, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor CappyJacket = Game.GetFormFromFile(0x044DA8, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(CappyJacket, 1, True)
				PlayerREF.Equipitem(CappyJacket, False, True)
				Potion ColaDark = Game.GetFormFromFile(0x024536, "DLCNukaWorld.esm") as Potion
				Potion ColaGrape = Game.GetFormFromFile(0x024534, "DLCNukaWorld.esm") as Potion
				Potion ColaOrange = Game.GetFormFromFile(0x02453A, "DLCNukaWorld.esm") as Potion
				Potion ColaQuartz = Game.GetFormFromFile(0x024538, "DLCNukaWorld.esm") as Potion
				Potion ColaVictory = Game.GetFormFromFile(0x024544, "DLCNukaWorld.esm") as Potion
				Potion ColaWild = Game.GetFormFromFile(0x02453D, "DLCNukaWorld.esm") as Potion
				PlayerREF.Additem(ColaDark, 2, True)
				PlayerREF.Additem(ColaGrape, 2, True)
				PlayerREF.Additem(ColaOrange, 2, True)
				PlayerREF.Additem(ColaQuartz, 2, True)
				PlayerREF.Additem(ColaVictory, 2, True)
				PlayerREF.Additem(ColaWild, 2, True)
				Weapon ThirstZapper = Game.GetFormFromFile(0x01EF41, "StartMeUp.esp") as Weapon
				Ammo ColaAmmo = Game.GetFormFromFile(0x02BDC2, "DLCNukaWorld.esm") as Ammo
				MiscObject ColaGunMod = Game.GetFormFromFile(0x02C682, "DLCNukaWorld.esm") as MiscObject
				PlayerREF.Additem (ColaGunMod, 1, True)
				PlayerREF.Additem (ColaAmmo, 8, True)
				PlayerREF.Additem (ThirstZapper, 1, True)
			endif
		elseif PlayerDiff == 3	
			PlayerREF.additem(pSMU_Gear_39CNukaColaEasy, 1, True)
			if Game.IsPluginInstalled("DLCNukaWorld.esm")
				Armor CappyJacket = Game.GetFormFromFile(0x044DA8, "DLCNukaWorld.esm") as Armor
				PlayerREF.Additem(CappyJacket, 1, True)
				PlayerREF.Equipitem(CappyJacket, False, True)
				Potion ColaDark = Game.GetFormFromFile(0x024536, "DLCNukaWorld.esm") as Potion
				Potion ColaGrape = Game.GetFormFromFile(0x024534, "DLCNukaWorld.esm") as Potion
				Potion ColaOrange = Game.GetFormFromFile(0x02453A, "DLCNukaWorld.esm") as Potion
				Potion ColaQuartz = Game.GetFormFromFile(0x024538, "DLCNukaWorld.esm") as Potion
				Potion ColaVictory = Game.GetFormFromFile(0x024544, "DLCNukaWorld.esm") as Potion
				Potion ColaWild = Game.GetFormFromFile(0x02453D, "DLCNukaWorld.esm") as Potion
				PlayerREF.Additem(ColaDark, 3, True)
				PlayerREF.Additem(ColaGrape, 3, True)
				PlayerREF.Additem(ColaOrange, 3, True)
				PlayerREF.Additem(ColaQuartz, 3, True)
				PlayerREF.Additem(ColaVictory, 3, True)
				PlayerREF.Additem(ColaWild, 3, True)
				Weapon ThirstZapper = Game.GetFormFromFile(0x01EF41, "StartMeUp.esp") as Weapon
				Ammo ColaAmmo = Game.GetFormFromFile(0x02BDC2, "DLCNukaWorld.esm") as Ammo
				Ammo ColaCherryAmmo = Game.GetFormFromFile(0x02BDC2, "DLCNukaWorld.esm") as Ammo
				Ammo ColaQuantumAmmo = Game.GetFormFromFile(0x02BDC2, "DLCNukaWorld.esm") as Ammo
				MiscObject ColaGunMod = Game.GetFormFromFile(0x02C682, "DLCNukaWorld.esm") as MiscObject
				MiscObject ColaCherryGunMod = Game.GetFormFromFile(0x02C688, "DLCNukaWorld.esm") as MiscObject
				MiscObject ColaQuantumGunMod = Game.GetFormFromFile(0x02C685, "DLCNukaWorld.esm") as MiscObject
				PlayerREF.Additem (ColaGunMod, 1, True)
				PlayerREF.Additem (ColaCherryGunMod, 1, True)
				PlayerREF.Additem (ColaQuantumGunMod, 1, True)
				PlayerREF.Additem (ColaAmmo, 10, True)
				PlayerREF.Additem (ColaCherryAmmo, 5, True)
				PlayerREF.Additem (ColaQuantumAmmo, 2, True)
				PlayerREF.Additem (ThirstZapper, 1, True)
			endif
		endif
	EndIf

EndFunction

;===============================================================================================================================
;===============================================================================================================================
;===============================================================================================================================
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
	If (OldGifted == true)
		PlayerREF.addperk(pSMU_PerkGiftedDebuffOnly, false)
		pSMU_OldGifted.SetValueInt(1) ;set the global so we can safely remove the trait later if needed
		PlayerREF.SetValue(Strength, PlayerREF.GetBaseValue(Strength) + 2 as float)
		PlayerREF.SetValue(Perception, PlayerREF.GetBaseValue(Perception) + 2 as float)
		PlayerREF.SetValue(Endurance, PlayerREF.GetBaseValue(Endurance) + 2 as float)
		PlayerREF.SetValue(Charisma, PlayerREF.GetBaseValue(Charisma) + 2 as float)
		PlayerREF.SetValue(Intelligence, PlayerREF.GetBaseValue(Intelligence) + 2 as float)
		PlayerREF.SetValue(Agility, PlayerREF.GetBaseValue(Agility) + 2 as float)
		PlayerREF.SetValue(Luck, PlayerREF.GetBaseValue(Luck) + 2 as float)
	EndIf
	If (OldSmallFrame == true)
		PlayerREF.addperk(pSMU_PerkSmallFrameDebuffOnly, false)
		pSMU_OldSmallFrame.SetValueInt(1) ;set the global so we can safely remove the trait later if needed
		PlayerREF.SetValue(Agility, PlayerREF.GetBaseValue(Agility) + 2 as float)
	EndIf
	
EndFunction

;===============================================================================================================================
;===============================================================================================================================
;===============================================================================================================================
function SMUlevelup()
	Actor PlayerREF = Game.GetPlayer()
	Int DesiredLevel = pSMU_StartLevel.GetValueInt()
	if DesiredLevel == 1
		;do nothing
	else
		Float XPtoSet = 37.5 * DesiredLevel * DesiredLevel + 87.5 * DesiredLevel - 124
		PlayerREF.SetValue(Experience, XPtoSet)
	endif
EndFunction

;===============================================================================================================================
;===============================================================================================================================
;===============================================================================================================================
function SMUrandomcharacter()
	;special
	if pSMU_RandomSpecial.GetValueInt() == 1
		SMUrandomspecialpoints()
	endif
	;traits
	if pSMU_RandomTraits.GetValueInt() == 1
		SMUrandomtraits()
	endif
	;class
	if pSMU_RandomClass.GetValueInt() == 1
		SMUrandomclass()
	endif
	;location
	if pSMU_RandomLocation.GetValueInt() == 1
		PlayerLocation = Utility.RandomInt(0, 37)
	endif
	;gear quantity
	if pSMU_RandomGear.GetValueInt() == 1
		PlayerDiff = Utility.RandomInt(0, 3)
	endif
	;level
	if pSMU_RandomLevel.GetValueInt() == 1
		pSMU_StartLevel.SetValueInt(Utility.RandomInt(1, 25))
	endif

endfunction

;===============================================================================================================================
;===============================================================================================================================
;===============================================================================================================================
function SMUrandomspecialpoints()
		Actor PlayerREF = Game.GetPlayer()
		;create array of random SPECIAL points
		Specials = new int[7]
		Specials[0] = Utility.RandomInt(1,10)
		Specials[1] = Utility.RandomInt(1,10)
		Specials[2] = Utility.RandomInt(1,10)
		Specials[3] = Utility.RandomInt(1,10)
		Specials[4] = Utility.RandomInt(1,10)
		Specials[5] = Utility.RandomInt(1,10)
		Specials[6] = Utility.RandomInt(1,10)
		;get total point sum
		int Sum = Specials[0] + Specials[1] + Specials[2] + Specials[3] + Specials[4] + Specials[5] + Specials[6]
		int diff = 0
		int which = 0
		;adjust it if needed
		if Sum < 28 
			;figure out how many points we need to add
			diff = 28 - Sum
			which = Utility.RandomInt(0, 6) ;pick a random special stat to increase
			while diff > 0
				if Specials[which] < 10
					Specials[which] = Specials[which] + 1  ;increase the random special stat by one
					diff -= 1 ;reduce the diff counter as we approach 28
				endif
				which = Utility.RandomInt(0, 6) ;select a new random special stat
			endwhile
		elseif Sum > 28
			;figure out how many points we need to subtract
			diff = Sum - 28
			which = Utility.RandomInt(0, 6) ;pick a random special stat to increase
			while diff > 0
				if Specials[which] > 1
					Specials[which] = Specials[which] - 1  ;reduce the random special stat by one
					diff -= 1 ;reduce the diff counter as we approach 28
				endif
				which = Utility.RandomInt(0, 6) ;select a new random special stat
			endwhile
		elseif Sum == 28
			;do nothing! player has right amount of special points
		endif
			
		;apply your SPECIAL points
		PlayerREF.SetValue(Strength, Specials[0] as float)
		PlayerREF.SetValue(Perception, Specials[1] as float)
		PlayerREF.SetValue(Endurance, Specials[2] as float)
		PlayerREF.SetValue(Charisma, Specials[3] as float)
		PlayerREF.SetValue(Intelligence, Specials[4] as float)
		PlayerREF.SetValue(Agility, Specials[5] as float)
		PlayerREF.SetValue(Luck, Specials[6] as float)

endfunction

;===============================================================================================================================
;===============================================================================================================================
;===============================================================================================================================
function SMUrandomclass()
	;create an array of classes
	Classes = new Int[38]
	Classes[0] = 1
	Classes[1] = 2
	Classes[2] = 3
	Classes[3] = 4
	Classes[4] = 5
	Classes[5] = 6
	Classes[6] = 7
	Classes[7] = 8
	Classes[8] = 9
	Classes[9] = 10
	Classes[10] = 11
	Classes[11] = 12
	Classes[12] = 13
	Classes[13] = 14
	Classes[14] = 15
	Classes[15] = 16
	Classes[16] = 17
	Classes[17] = 18
	Classes[18] = 19
	Classes[19] = 20
	Classes[20] = 21
	Classes[21] = 22
	Classes[22] = 23
	Classes[23] = 24
	Classes[24] = 25
	Classes[25] = 26
	Classes[26] = 27
	Classes[27] = 28
	Classes[28] = 29
	Classes[29] = 30
	Classes[30] = 31
	Classes[31] = 32
	;only fill out the rest of the array if the plugins are installed
	if Game.IsPluginInstalled("DLCRobot.esm") == true
		Classes[33] = 34
	else
		Classes[33] = 0
	endif		
	if Game.IsPluginInstalled("DLCCoast.esm") == true
		Classes[32] = 33
		Classes[34] = 35
	else
		Classes[32] = 0
		Classes[34] = 0
	endif
	if Game.IsPluginInstalled("DLCNukaWorld.esm") == true
		Classes[35] = 36
		Classes[36] = 37
		Classes[37] = 38
		Classes[38] = 39
	else
		Classes[35] = 0
		Classes[36] = 0
		Classes[37] = 0
		Classes[38] = 0
	endif
	;pick a random number for the array but only if it's non-zero
	int randNum = 0
	PlayerClass = 0
	while PlayerClass == 0
		randNum = Utility.RandomInt(0, 37)
		PlayerClass = Classes[randNum]
	endwhile

endfunction

;===============================================================================================================================
;===============================================================================================================================
;===============================================================================================================================	
function SMUrandomtraits()
	;set two random numbers representing the 20 traits
	int randOne = Utility.RandomInt(1, 20)
	int randTwo = Utility.RandomInt(1, 20) 
	;make sure the second number is different from the first
	while randTwo == randOne
		randTwo = Utility.RandomInt(1, 20)
	endwhile
	;check for doubling up of gifted and small frame
	while randTwo == 9 && randOne == 19
		randTwo = Utility.RandomInt(1, 20)
	endwhile
	while randTwo == 19 && randOne == 9
		randTwo = Utility.RandomInt(1, 20)
	endwhile
	while randTwo == 16 && randOne == 20
		randTwo = Utility.RandomInt(1, 20)
	endwhile
	while randTwo == 20 && randOne == 16
		randTwo = Utility.RandomInt(1, 20)
	endwhile
	;check the random numbers and assign the traits to them
	if randOne == 1 || randTwo == 1
		PlayerTrait01 = true
	endif
	if randOne == 2 || randTwo == 2
		PlayerTrait02 = true
	endif
	if randOne == 3 || randTwo == 3
		PlayerTrait03 = true
	endif
	if randOne == 4 || randTwo == 4
		PlayerTrait04 = true
	endif
	if randOne == 5 || randTwo == 5
		PlayerTrait05 = true
	endif
	if randOne == 6 || randTwo == 6
		PlayerTrait06 = true
	endif
	if randOne == 7 || randTwo == 7
		PlayerTrait07 = true
	endif
	if randOne == 8 || randTwo == 8
		PlayerTrait08 = true
	endif
	if randOne == 9 || randTwo == 9
		PlayerTrait09 = true
	endif
	if randOne == 10 || randTwo == 10
		PlayerTrait10 = true
	endif
	if randOne == 11 || randTwo == 11
		PlayerTrait11 = true
	endif
	if randOne == 12 || randTwo == 12
		PlayerTrait12 = true
	endif
	if randOne == 13 || randTwo == 13
		PlayerTrait13 = true
	endif
	if randOne == 14 || randTwo == 14
		PlayerTrait14 = true
	endif
	if randOne == 15 || randTwo == 15
		PlayerTrait15 = true
	endif
	if randOne == 16 || randTwo == 16
		PlayerTrait16 = true
	endif
	if randOne == 17 || randTwo == 17
		PlayerTrait17 = true
	endif
	if randOne == 18 || randTwo == 18
		PlayerTrait18 = true
	endif
	if randOne == 19 || randTwo == 19
		OldGifted = true
	endif
	if randOne == 20 || randTwo == 20
		OldSmallFrame = true
	endif	
endfunction

