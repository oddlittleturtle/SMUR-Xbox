ScriptName StartMeUp:SMU_SpawnTriggerScript extends ObjectReference
{Script attached to trigger that moves to place where player will spawn.}

Group StartMeUp_Properties
	GlobalVariable Property pSMU_FollowedVanillaPath Auto
	GlobalVariable Property pSMU_VaultStart Auto
	GlobalVariable Property pSMU_Triggered Auto
	GlobalVariable Property pSMU_StartLevel Auto
	Quest Property pSMUQuest Auto Const
	StartMeUp:StartMeUpManagerScript property SMU_Manager auto const
	
	GlobalVariable Property pSMU_StartPoint Auto
	Quest Property pSMU_Tenpines Auto Const
	Quest Property pSMU_RangerCabin Auto Const
	Quest Property pSMU_Quincy Auto Const
	Quest Property pSMU_Raiders Auto Const
	Quest Property pSMU_Raiders2 Auto Const
EndGroup


Group Quest_Properties
	Keyword Property pAnimArchetypePlayer Auto Const mandatory
	GlobalVariable Property pTimeScale Auto Const mandatory ;20=default starting timescale
	GlobalVariable Property pGameHour Auto Const ;9=default starting gamehour
	mq101questscript Property pMQ101questscript Auto Const
	Quest Property pRadioDiamondCity Auto Const
	Quest Property pRadioInstituteQuest Auto Const
	Quest Property pMQ102 Auto Const
	Quest Property pBoSM01 Auto Const
	Quest Property pMQ101 Auto mandatory
	Quest Property pDialogueVault111 Auto Const
EndGroup

Group Triggers_and_markers
	ObjectReference Property pVault111MapMarker Auto Const
	
	ObjectReference Property pMQ101HillSoldiersEnableMarker Auto Const
	soundcategorysnapshot Property CSMQ101PlayerHouseInt Auto Const
	
	ObjectReference Property pV111ElevatorCollisionPlatformEnableMarker Auto Const
	
	vault111elevatorhandlerscript Property pVault111ElevatorHandler Auto Const
	
	ObjectReference Property pVault111AlwaysEnableControlsTriggerREF Auto Const
	ObjectReference Property pRespecTriggerREF Auto Const
	ObjectReference Property pV111EnableRaiseElevatorTriggerEnableMarker Auto Const
	ObjectReference Property pMQ102PipboyTakeFurnitureREF Auto Const
	ObjectReference Property Vault111_OverseerDoor Auto Const
	ObjectReference Property MQPlayerCryopodREF Auto Const
	ObjectReference Property pVault111BlockedDoorEnableParent Auto Const
	
	ReferenceAlias Property pAlias_Vault111QT00 Auto Const
	;ObjectReference Property MQ102SetStage0Trigger Auto Const
	;ObjectReference Property pVault111SetStage70TriggerREF Auto Const
	;ObjectReference Property pVault111SetStage72TriggerREF Auto Const
	;ObjectReference Property pVault111SetStage74TriggerREF Auto Const
	;ObjectReference Property pVault111SetStage80TriggerREF Auto Const
	;ObjectReference Property pTutorialSetStage100Trigger Auto Const
	;ObjectReference Property pTutorialSetStage200Trigger Auto Const
	;ObjectReference Property pTutorialSetStage850Trigger Auto Const
	;ObjectReference Property pDialogueVault111SetStage97Trigger Auto Const
	;ObjectReference Property pMQ102GearDoorConsoleREF Auto Const
	;ObjectReference Property pVault111PipboySkeletonREF Auto Const
EndGroup

Group Abernathy_Properties
	GlobalVariable Property pPlayerKnowsBrahmin Auto Const
	GlobalVariable Property pPlayerKnowsCaps Auto Const
	GlobalVariable Property pPlayerKnowsRaiders Auto Const
	GlobalVariable Property pPlayerKnowsTatos Auto Const
	dialogueabernathyfarmlucy Property pDialogueAbernathyFarmLucy Auto Const
EndGroup

Group CharItems
	Armor Property pArmor_WeddingRing Auto Const
	Armor Property pArmor_SpouseWeddingRing Auto Const
	Armor Property pClothesPrewarWomensCasual Auto Const
	Armor Property pChargenPlayerClothes Auto Const
EndGroup


auto STATE waitingForPlayer
Event onTriggerEnter(ObjectReference akActionRef)
	akActionRef = Player as Actor
	
	;only run once
	gotostate("hasbeentriggered")
	
	If (pSMU_FollowedVanillaPath.GetValueInt() == 0 && pSMU_VaultStart.GetValueInt() == 0 ;/ && pSMU_Triggered.GetValueInt() == 0/;)
		;start the appropriate quest to clean up the site where the player started, using the global we set in the bathroom door script
		if pSMU_StartPoint.GetValueInt() == 1 ;rangercabin
			pSMU_RangerCabin.Start() 
		elseif pSMU_StartPoint.GetValueInt() == 2 ;tenpines
			pSMU_Tenpines.Start() 
		elseif pSMU_StartPoint.GetValueInt() == 3 ;quincy
			pSMU_Quincy.Start() 
		elseif pSMU_StartPoint.GetValueInt() == 4 ;raiders
			pSMU_Raiders.Start()
			;/ - this starts on the quest now
			(Game.GetFormFromFile(2387218, "Fallout4.ESM") as Actor).StopCombat()
			(Game.GetFormFromFile(2387216, "Fallout4.ESM") as Actor).StopCombat()
			(Game.GetFormFromFile(2387215, "Fallout4.ESM") as Actor).StopCombat()
			(Game.GetFormFromFile(2387217, "Fallout4.ESM") as Actor).StopCombat()
			(Game.GetFormFromFile(2387219, "Fallout4.ESM") as Actor).StopCombat()
			/;
		elseif pSMU_StartPoint.GetValueInt() == 5 ;raiders2 - Roadside Motel
			; ----- Roadside Pines Motel ------
			pSMU_Raiders2.Start()
			
			;/
			SMUR Xbox 1.0.0 Bug #31
			This is now done on the SMU_Raiders2 quest
			this way does not register the Raiders properly
			
			(Game.GetFormFromFile(321843, "Fallout4.ESM") as Actor).StopCombat()
			(Game.GetFormFromFile(1887160, "Fallout4.ESM") as Actor).StopCombat()
			(Game.GetFormFromFile(1887221, "Fallout4.ESM") as Actor).StopCombat()
			(Game.GetFormFromFile(1887224, "Fallout4.ESM") as Actor).StopCombat()
			/;
		EndIf
		
		;SMUR Xbox 1.0 BUG #6 MQ101 is not shutting down properly
		SMU_Manager.SMUstartOutsideVault(Player)
		
		
		;/ replaced this:
		pPlayerKnowsBrahmin.SetValueInt(1)
		pPlayerKnowsCaps.SetValueInt(1)
		pDialogueAbernathyFarmLucy.LucyCapsBranch = 2
		pPlayerKnowsRaiders.SetValueInt(1)
		pPlayerKnowsTatos.SetValueInt(1)
		
		with this: /;
		SMU_Manager.SetWastelanderDialogue()
		
		;old leftover global, better leave it in
		;SMUR Xbox 1.0 Bug #6 - unnecessary global to check
		;pSMU_Triggered.SetValueInt(1)
		
		;start the radios
		pRadioDiamondCity.Start()
		pRadioInstituteQuest.Start()
		pBoSM01.Start()
		

		;start the mod's main quest that gets you connected to the game's main quest
		;SMUR Xbox 1.0 Bug #14 - Removing this line:
		;pSMUQuest.SetStage(10)
		; SMUQuest_ObjectiveHandler will pop up objectives to connect to game's main quest after player speaks to people in Diamond City,
		; Vault 81, entering Vault 111 location, or a random encounter about a vault.
		
		;SMUR Xbox 1.0 BUG #8 MQ102 is not shutting down properly
		; This should be part of a function that runs from a separate quest while the controls are still locked and the game is faded out.
		
		;disable v111 map marker, player can see it but not fast travel, gotta do it twice
		pVault111MapMarker.EnableFastTravel(false)
		pVault111MapMarker.EnableFastTravel(false)
				
		Utility.Wait(20.0)
		pMQ102.SetStage(10)
		
		;save the game
		Game.RequestSave()
		
			
    Else
		gotostate("hasbeentriggered")
	EndIf
	EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered
;do nothing
;/ SMUR Xbox 1.0.0 Quests stop themselves now. No need to have this here now.
	Event OnBeginState(string asOldState)
		If (pSMU_StartPoint.GetValueInt() == 1)
			pSMU_RangerCabin.Stop()
		ElseIf (pSMU_StartPoint.GetValueInt() == 2)
			pSMU_Tenpines.Stop()
		ElseIf (pSMU_StartPoint.GetValueInt() == 3)
			pSMU_Quincy.Stop()
		EndIf
	EndEvent
/;
EndState


;/ -- moved to StartMeUp:StartMeUpManager to keep up with all the necessary properties for MQ101 and MQ102
Function SMUstartOutsideVault()
	Actor PlayerREF = Game.GetPlayer()
	PlayerREF.ChangeAnimArchetype(None)
	PlayerREF.ChangeAnimArchetype(pAnimArchetypePlayer)
	pGameHour.SetValueInt(9)
	pTimeScale.SetValueInt(20)
	pMQ101questscript.MQ101EnableLayer = inputenablelayer.Create()
	pMQ101questscript.MQ101EnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
	pMQ101HillSoldiersEnableMarker.Disable(False)
	CSMQ101PlayerHouseInt.Remove()
	(Game.GetFormFromFile(119133, "Fallout4.ESM") as ObjectReference).DisableNoWait(False)
	(Game.GetFormFromFile(119133, "Fallout4.ESM") as ObjectReference).MoveTo(Game.GetFormFromFile(267557, "StartMeUp.esp") as ObjectReference, 0, 0, 0, True)
	pVault111AlwaysEnableControlsTriggerREF.Disable(False)
	pV111ElevatorCollisionPlatformEnableMarker.Disable(False)
	pVault111ElevatorHandler.EnableControlsForElevator()
	(Game.GetFormFromFile(333943, "Fallout4.ESM") as ObjectReference).DisableNoWait(False)
	(Game.GetFormFromFile(333943, "Fallout4.ESM") as ObjectReference).MoveTo(Game.GetFormFromFile(267557, "StartMeUp.esp") as ObjectReference, 0, 0, 0, True)
	pRespecTriggerREF.Disable(False)
	pV111EnableRaiseElevatorTriggerEnableMarker.Enable(False)
	pMQ102PipboyTakeFurnitureREF.SetDestroyed(True)
	MQPlayerCryopodREF.SetDestroyed(True)
	pVault111BlockedDoorEnableParent.Disable(False)
	pAlias_Vault111QT00.GetRef().Lock(False, False)
	pAlias_Vault111QT00.GetRef().SetOpen(True)
	pMQ101.CompleteAllObjectives()
	pMQ101.CompleteQuest()
	pMQ101.Stop()
	pDialogueVault111.CompleteAllObjectives()
	pDialogueVault111.CompleteQuest()
	pDialogueVault111.SetStage(100)
	pDialogueVault111.SetStage(110)
	Game.SetCharGenHUDMode(0)
	Game.SetInCharGen(False, False, False)
	PlayerREF.removeItem(pArmor_WeddingRing as Form, 1, True, None)
	PlayerREF.removeItem(pArmor_SpouseWeddingRing as Form, 1, True, None)
	PlayerREF.removeItem(pClothesPrewarWomensCasual as Form, 1, True, None)
	PlayerREF.removeItem(pChargenPlayerClothes as Form, 1, True, None)
EndFunction
/;

