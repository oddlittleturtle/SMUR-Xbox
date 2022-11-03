Scriptname StartMeUp:StartMeUpManagerScript extends Quest
{Holds all main functions for Start Me Up. Combines functions from SMU_BathroomScript and SMU_SpawnTriggerScript}

Group ShaunREFS
	GlobalVariable Property SMU_FollowedVanillaPath Auto Const Mandatory ;0=altstart, 1=quick, 2=vanilla
	GlobalVariable Property SMU_VaultStart Auto Const Mandatory ;0=started outside of vault, 1=started in vault111
	GlobalVariable Property SMU_PlayerChoice_Shaun Auto Const Mandatory
	{Player chose to update Shaun from holotape}
	
	ReferenceAlias Property Alias_Shaun Auto Const Mandatory
	ReferenceAlias Property Alias_ShaunChild Auto Const Mandatory
	ReferenceAlias Property Alias_ShaunChildHologram  Auto Const Mandatory
	ReferenceAlias Property Alias_MQ203memoryH_Shaun Auto Const Mandatory
	
	Keyword Property isPlayerChild Auto Const Mandatory
EndGroup

Group SMU_Properties
	GlobalVariable Property pSMU_FollowedVanillaPath Auto ;0=altstart, 1=quick, 2=vanilla
	GlobalVariable Property pSMU_VaultStart Auto ;0=started outside of vault, 1=started in vault111
	GlobalVariable Property pSMU_CanTalkToNick Auto ;0=player has not found the holotape yet 1=player has learned of the abduction

	ObjectReference Property SMU_BathroomTriggerREF Auto Const Mandatory
	{bathroom trigger player steps through to trigger some of the functions here}
	ObjectReference Property pSMU_SpawnTriggerREF Auto Const
	
	;StartMeUp:SMU_BathroomDoorScript property BathroomTriggerRef auto
	;StartMeUp:SMU_SpawnTriggerScript property SpawnTriggerRef auto
	
	Quest Property pMQ101Radio Auto Const Mandatory
	{radio playing}
	Quest Property MQ102 Auto Const Mandatory
	{for the vault gear door}
	Scene Property pMQ101_001_MirrorScene Auto Const mandatory
	{for closing down the mirror scene}
	
	ReferenceAlias Property pCryoDoorAlias Auto Const Mandatory

	ObjectReference Property pSMU_CryopodExitTriggerREF Auto Const Mandatory
EndGroup

Group Quests_Properties
	GlobalVariable Property pTimeScale Auto Const mandatory ;20=default starting timescale
	GlobalVariable Property pGameHour Auto Const ;9=default starting gamehour

	Quest Property pTutorial Auto Const mandatory
	Quest Property pRadioDiamondCity Auto Const Mandatory
	Quest Property pRadioInstituteQuest Auto Const Mandatory
	Quest Property pBoSM01 Auto Const Mandatory
	Quest Property pMQ101 Auto Const mandatory
	Quest Property pDialogueVault111 Auto Const Mandatory
	Quest Property pMQ103 Auto Const Mandatory
	mq101questscript Property pMQ101questscript Auto Const Mandatory
	Quest Property pDialogueBunkerHill Auto Const Mandatory
EndGroup

Group Vault111
	
	Sound Property AMBrIntVault111CreaksA Auto Const Mandatory
	SoundCategorySnapshot Property CSMQ101PlayerHouseInt Auto Const Mandatory
	
	Actor Property pSMU_PlayerSpouseMaleVaultREF Auto Const Mandatory
	Actor Property pSMU_PlayerSpouseFemaleVaultREF Auto Const Mandatory
	Actor Property pMQ101PlayerSpouseMale Auto Const mandatory
	Actor Property pMQ101PlayerSpouseFemale Auto Const mandatory

	ObjectReference Property pMQ101HillSoldiersEnableMarker Auto Const Mandatory
	
	ObjectReference Property pSMUVault111CryoDoor Auto Const Mandatory
	ObjectReference Property pSMU_V111ElevatorDownTriggerREF Auto Const Mandatory
	
	Vault111ElevatorHandlerScript Property pVault111ElevatorHandler Auto Const Mandatory
	ObjectReference Property pSMU_V111ExteriorElevatorTriggerREF Auto Const
	ObjectReference Property pV111ElevatorCollisionPlatformEnableMarker Auto Const Mandatory
	ObjectReference Property pVault111AlwaysEnableControlsTriggerREF Auto Const Mandatory
	ObjectReference Property pRespecTriggerREF Auto Const Mandatory
	ObjectReference Property pV111EnableRaiseElevatorTriggerEnableMarker Auto Const Mandatory
	ObjectReference Property pVault111PipboySkeletonREF Auto Const Mandatory
	ObjectReference Property pMQ102PipboyTakeFurnitureREF Auto Const Mandatory
	ObjectReference Property pMQ102GearDoorConsoleREF Auto Const Mandatory
	ObjectReference Property pVault111GearDoorREF Auto Const mandatory
	ObjectReference Property pVault111_OverseerDoor Auto Const Mandatory
	
	;exit stage left
	ObjectReference Property pVault111ExitDoorREF01 Auto Const mandatory
	ObjectReference Property pVault111ExitDoorREF02 Auto Const mandatory
	ObjectReference Property pMQ101Vault111PostWarMagicDoor Auto Const mandatory
	ObjectReference Property pMQ203Vault111MagicDoorToPostWar Auto Const mandatory
	ObjectReference Property pMQ203Vault111MagicDoorToPreWar Auto Const mandatory
	ObjectReference Property pPrewarVault111MagicDoor Auto Const mandatory
	
	;trigger things for Vault111
	ObjectReference Property pMQ102SetStage0Trigger Auto Const Mandatory
	ObjectReference Property pVault111SetStage70TriggerREF Auto Const Mandatory
	ObjectReference Property pVault111SetStage72TriggerREF Auto Const Mandatory
	ObjectReference Property pVault111SetStage74TriggerREF Auto Const Mandatory
	ObjectReference Property pVault111SetStage78TriggerREF Auto Const mandatory
	ObjectReference Property pVault111SetStage80TriggerREF Auto Const Mandatory
	ObjectReference Property pTutorialSetStage100Trigger Auto Const Mandatory
	ObjectReference Property pTutorialSetStage200Trigger Auto Const Mandatory
	ObjectReference Property pTutorialSetStage850Trigger Auto Const Mandatory
	ObjectReference Property pDialogueVault111SetStage97Trigger Auto Const Mandatory
	
	ObjectReference Property pMQPlayerCryopodREF Auto Const Mandatory
	ObjectReference Property pVault111BlockedDoorEnableParent Auto Const Mandatory
	
	ObjectReference Property pVault111RoachEnableParent Auto Const mandatory
	
EndGroup

Group GearLists
	FormList Property pSMU_FourEyesGear Auto
	{built at runtime}
	FormList Property pSMU_UnsightlyGear Auto
	{built at runtime}
	
	;other gear
	Armor Property pCharGenPlayerClothes Auto Const mandatory
	Armor Property pClothesPrewarWomensCasual Auto Const mandatory
	Armor Property pClothesPrewarTshirtSlacks Auto Const mandatory
	Armor Property pArmor_Vault111_Underwear Auto Const mandatory
	Armor Property pArmor_Vault111Clean_Underwear Auto Const mandatory
	Armor Property pArmor_Vault111_Underwear_NoLoot Auto Const mandatory
	Armor Property pPipboy Auto Const mandatory
	Armor Property pPipboyDusty Auto Const mandatory
	Armor Property pArmor_WeddingRing Auto Const mandatory
	Armor Property pClothesEyeGlasses Auto Const mandatory
	
EndGroup


Group DLC_Tracking CollapsedOnRef
	InstalledPlugins[] Property PluginArray Auto
	{array that holds the plugins, built at runtime}
	
	;AUTOFILL
	GlobalVariable property SMU_isNukaWorld 	const auto mandatory
	GlobalVariable property SMU_isRobot 		const auto mandatory
	GlobalVariable property SMU_isCoast 		const auto mandatory
	GlobalVariable property SMU_isCCPrey 		const auto mandatory
	GlobalVariable property SMU_isCCCapMerc 	const auto mandatory
	GlobalVariable property SMU_isCCX02 		const auto mandatory
	GlobalVariable property SMU_isCCPAGunMM 	const auto mandatory
	GlobalVariable property SMU_isCCslocum 		const auto mandatory
	GlobalVariable property SMU_isCCDovah 		const auto mandatory
	GlobalVariable property SMU_isCCPint 		const auto mandatory
	GlobalVariable property SMU_isCCHoliday 	const auto mandatory
	GlobalVariable property SMU_isCCShirts 		const auto mandatory
	GlobalVariable property SMU_isCCBFG 		const auto mandatory
	GlobalVariable property SMU_isCCHellPA 		const auto mandatory
	GlobalVariable property SMU_isCCNuka 		const auto mandatory
	GlobalVariable property SMU_isCC050 		const auto mandatory
	GlobalVariable property SMU_isCC051 		const auto mandatory
	GlobalVariable property SMU_isCC052 		const auto mandatory
	GlobalVariable property SMU_isCC053 		const auto mandatory
	GlobalVariable property SMU_isCC054 		const auto mandatory
	GlobalVariable property SMU_isCC055 		const auto mandatory
	GlobalVariable property SMU_isCC056 		const auto mandatory
	GlobalVariable property SMU_isCC057 		const auto mandatory
	GlobalVariable property SMU_isCC058 		const auto mandatory
	GlobalVariable property SMU_isCC059 		const auto mandatory
	GlobalVariable property SMU_isCC060 		const auto mandatory
	GlobalVariable property SMU_isCC061 		const auto mandatory
EndGroup

Group Dialogue_Tracking
	DialogueAbernathyFarmLucy Property pDialogueAbernathyFarmLucy Auto Const Mandatory
	GlobalVariable Property pPlayerKnowsBoS Auto Const 
	GlobalVariable Property pPlayerKnowsChildrenOfAtom Auto Const
	GlobalVariable Property pPlayerKnowsGunners Auto Const
	GlobalVariable Property pPlayerKnowsInstitute Auto Const
	GlobalVariable Property pPlayerKnowsSynths Auto Const
	GlobalVariable Property pPlayerKnowsBrahmin Auto Const Mandatory
	GlobalVariable Property pPlayerKnowsCaps Auto Const Mandatory
	GlobalVariable Property pPlayerKnowsRaiders Auto Const Mandatory
EndGroup


;-- Variables ---------------------------------------
; we're storing a lot of variables
; we've got a lot of plugins to check for

;player
Actor Player

; "enums" for IsGlobalTrue
int iGlobalTrue 			= 1 const
int iGlobalFalse 			= 0 const

;timers
float SMU_Time

;	### Base DLC ###
String isNukaWorld 	= "DLCNukaWorld.esm" const
String isRobot 		= "DLCRobot.esm" const
String isCoast 		= "DLCCoast.esm" const

;1
;	### Morgan's Suit ###
String isCCPrey = "ccbgsfo4016.esl" const
bool bCCC01Ready

;3
;	### Hellfire Power Armor ###
String isCCHellPA = "ccbgsfo4044-hellfirepowerarmor.esl" const
bool bCCC03Ready

;7
;	### Slocum Joe's Coffee and Donuts Pack ###
String isCCslocum = "ccfsvfo4003-slocum.esl" const
bool bCCC07Ready

;28
;	### X02 Power Armor ###
String isCCX02 = "ccBGSFO4115-x02.esl" const
bool bCCC28Ready

;29
;	### Pint Sized Slasher ###
String isCCPint = "ccbgsfo4035-pint.esl" const
bool bCCC29Ready

;30
;	### Holiday workshop ###
String isCCHoliday = "ccjvdfo4001-holiday.esl" const
bool bCCC30Ready

;36
;	### Capital Wasteland Mercs ###
String isCCCapMerc = "ccBGSFO4117-capmerc.esl" const
bool bCCC36Ready

;37
;	### Fantasy gear ###
String isCCDovah = "ccbgsfo4048-dovah.esl" const
bool bCCC37Ready

;38
;	### PA Gunners vs MM ###
String isCCPAGunMM = "ccgcafo4025-pagunmm.esl" const
bool bCCC38Ready

int i
int[] FourEyesR ;robot
int[] FourEyesC ;coast
int[] FourEyesN ;nukaworld
int[] UnsightlyR ;robot
int[] UnsightlyC ;coast
int[] UnsightlyN ;nukaworld

int[] FourEyesCCCap 	;capital wasteland mercenaries
int[] FourEyesCCX2		;X02
int[] FourEyesCCPAGun	;PA Gunner vs Minutemen
int[] FourEyesCCPint	; Pint Sized Slasher

int[] UnslightlyCCPrey	; Morgan's space suit
int[] UnsightlyCCCap 	; capital wasteland mercenaries
int[] UnsightlyCCX2		; X02
int[] UnsightlyCCPAGun 	; PA Gunner vs Minutemen
int[] UnsightlyCCDovah  ; Fantasy Items (Dovah)
int[] UnsightlyCCSlocum ; Slocum's Joe
int[] UnsightlyCCPint	; pint sized slasher
int[] UnsightlyCCHoliday	; Holiday pack

;*****************************************************

Event OnQuestInit()
	;store off the player
	Player = Game.GetPlayer()

	RegisterForCustomEvent(StartMeUp:StartMeUpManagerScript.GetScript(), "StartMeUp")
	;RegisterForCustomEvent(BathroomTriggerRef, "StartMeUp")
	;RegisterForCustomEvent(SpawnTriggerRef, "StartMeUp")
	RegisterForRemoteEvent(Player, "OnPlayerLoadGame")
	RegisterForRemoteEvent(Player, "OnDifficultyChanged") ; to check for survival mode when requesting saves.
	
	;Update Shaun's face
	UnsetShaunsFace()
	
	;always move in the big trigger box for entering v111
	pSMU_V111ExteriorElevatorTriggerREF.MoveTo(Game.GetFormFromFile(0x0973E2, "Fallout4.ESM") as objectreference)
	pSMU_V111ExteriorElevatorTriggerREF.SetPosition(-88456.21875, 91542.28125, 7001.701172)
	pSMU_V111ExteriorElevatorTriggerREF.SetAngle(0, 0, 0)
EndEvent

Event Quest.OnStageSet(Quest akSource, int auiStageID, int auiItemID)
	Trace(self, "OnStageSet: " + auiStageID + " item " + auiItemID)
	if (akSource == MQ102 && auiStageID == 15)
		UnregisterForRemoteEvent(MQ102, "OnStageSet")
		CheckForAndProcessMQ102Stage15("OnStageSet")
	endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if (akSource == pVault111GearDoorREF) && (asEventName == "stage3")
		Trace(self, "Stage 6: unregistering for gear door event")
		UnregisterForAnimationEvent(pVault111GearDoorREF, "stage3")
		
		;if the time is bonkers, fix it
		if (pTimeScale.GetValueInt() == 0)
			pTimeScale.SetValueInt(20)
		endif
	endif
EndEvent

;*****************************************************

CustomEvent StartMeUp
CustomEvent StartMeUpDone
CustomEvent StartMeUpFactionKickOut

Function SendStartMeUpEvent(bool VaultStart)
	SendCustomEvent("StartMeUp")
EndFunction

Function SetVaultStart()
	;Player has chosen to start in Vault 111
	;set the globals so we know player is doing the ALT start and a VAULT start
	pSMU_FollowedVanillaPath.SetValueInt(0)	
	pSMU_VaultStart.SetValueInt(1)
	pSMU_CanTalkToNick.SetValueInt(1)
EndFunction



Function SetNateAndNora()
	;SET UP Nate & Nora 
	If (Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1 ;if female
		;pSMU_PlayerSpouseFemaleVaultREF.EnableNoWait ()
		pSMU_PlayerSpouseFemaleVaultREF.SetLinkedRef(Game.GetFormFromFile(0x001934, "Fallout4.ESM") as objectreference)
		pSMU_PlayerSpouseFemaleVaultREF.MoveTo(Game.GetFormFromFile(0x04A011, "Fallout4.ESM") as objectreference)
		pSMU_PlayerSpouseFemaleVaultREF.SetPosition(-48.43, -446.30, -50.20)
		pSMU_PlayerSpouseFemaleVaultREF.SetAngle(0, 0, 190.04)
		pSMU_PlayerSpouseFemaleVaultREF.Enable()
		pSMU_PlayerSpouseFemaleVaultREF.EvaluatePackage()
	Else
		;pSMU_PlayerSpouseMaleVaultREF.EnableNoWait()
		pSMU_PlayerSpouseMaleVaultREF.SetLinkedRef(Game.GetFormFromFile(0x001934, "Fallout4.ESM") as objectreference)
		pSMU_PlayerSpouseMaleVaultREF.MoveTo(Game.GetFormFromFile(0x04A011, "Fallout4.ESM") as objectreference)
		pSMU_PlayerSpouseMaleVaultREF.SetPosition(50.05, -425.08, -50.17)
		pSMU_PlayerSpouseMaleVaultREF.SetAngle(0, 0, 2.86)
		pSMU_PlayerSpouseMaleVaultREF.Enable()
		pSMU_PlayerSpouseMaleVaultREF.EvaluatePackage()
	EndIf
EndFunction

;moved and updated from SMU_SpawnTriggerScript
Function SMUStartOutsideVault(ObjectReference akActionRef)

	akActionRef = Player as Actor
	
	;give the player full anims
	Player.ChangeAnimArchetype(None)
	Player.ChangeAnimArchetype(pAnimArchetypePlayer)
	
	;stuff from the Vault111 start debug of mq101/mq102
	if pGameHour.GetValueInt() < 9
		pGameHour.SetValueInt(9)
	endif
	if pTimeScale.GetValueInt() < 20
		pTimeScale.SetValueInt(20)
	endif
	pMQ101questscript.MQ101EnableLayer = inputenablelayer.Create()
	
	;enable all player controls
	pMQ101questscript.MQ101EnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
	;stage 230?
	pMQ101HillSoldiersEnableMarker.Disable(False)
	;enable that vertibird sound
	CSMQ101PlayerHouseInt.Remove()
	
	;disable the outermost trigger OUTSIDE THE VAULT that simply sets a quest stage, runs once
	(Game.GetFormFromFile(0x01D15D, "Fallout4.ESM") as objectreference).DisableNoWait()
	;LET"S MOVE THESE TO SMU CELL AS WELL AS DISABLE THEM!.
	(Game.GetFormFromFile(0x01D15D, "Fallout4.ESM") as objectreference).MoveTo(Game.GetFormFromFile(0x041525, "StartMeUp.esp") as objectreference)
	
	;==================================================
	; NEED TO CREATE ALISASES FOR THESE TWO BOXES
	;==================================================
	
	;second trigger in, applies Vault111AlwaysEnableControlsScript, runs once
	pVault111AlwaysEnableControlsTriggerREF.Disable() ;disable the trigger, it is renabled when you Ascend Again
	pV111ElevatorCollisionPlatformEnableMarker.Disable() ;obj ref, disable the platform you appear on when you first exit the vault, it is renabled when you Ascend Again
	pVault111ElevatorHandler.EnableControlsForElevator() ;enables player controls at the top, probably unnecessary
	
	;third trigger in, applies vaultExitCommonWealthSCRIPT, runs once, does the blinding light, force weather stuff
	(Game.GetFormFromFile(0x051877, "Fallout4.ESM") as objectreference).DisableNoWait()
	;LET"S MOVE THESE TO SMU CELL AS WELL AS DISABLE THEM!
	(Game.GetFormFromFile(0x051877, "Fallout4.ESM") as objectreference).MoveTo(Game.GetFormFromFile(0x041525, "StartMeUp.esp") as objectreference)
	
	;disable the trigger to respec your character when you leave the vault
	pRespecTriggerREF.Disable()
	
	;turn on a trigger that's used to allow the player to use the elevator again, once they exit the vault - from vaultExitElevatorSCRIPT
	pV111EnableRaiseElevatorTriggerEnableMarker.Enable()
	
	;clean up the inside of the vault
	pVault111RoachEnableParent.Disable(False)
	pMQ102PipboyTakeFurnitureREF.Disable(False)
	
	;open overseer door
	;Vault111_OverseerDoor.Lock(false) ;unlock the door
	;Vault111_OverseerDoor.SetOpen(true) ;open the door


	;ok to leave as is, doesn't create a cell record
	pMQPlayerCryopodREF.BlockActivation(True, True)
	
	;Gear door
	pMQ102GearDoorConsoleREF.Enable(False)
	pVault111GearDoorREF.Enable(False)
	pMQ102GearDoorConsoleREF.Activate(Player, False)
	pMQ102GearDoorConsoleREF.BlockActivation(True, True)
	RegisterForAnimationEvent(pVault111GearDoorREF, "stage3")

	;from mq102 stage 3
	pVault111BlockedDoorEnableParent.Disable()
	pAlias_Vault111QT00.GetRef().Lock(False)
	pAlias_Vault111QT00.GetRef().SetOpen()

	;set any quest stages
	pMQ101.SetStage(900)
	pMQ101.SetStage(1000)
	pCommonwealthClear.ForceActive(False)
	pMQ102.SetObjectiveDisplayed(1, True, False)
	pMQ102.SetObjectiveCompleted(1, True)
	
	pDialogueVault111Script.CancelTimer(10)
	p006_PlayerLoop.Stop()
	pDialogueVault111.CompleteAllObjectives()
	pDialogueVault111.CompleteQuest()
	pDialogueVault111.SetStage(100)
	pDialogueVault111.SetStage(110)
	Game.SetCharGenHUDMode(0)
	Game.SetInCharGen(False, False, False)
	
	;remove items
	Player.removeItem(pArmor_WeddingRing, 1, True)
	Player.removeItem(pArmor_SpouseWeddingRing, 1, True)
	Player.removeItem(pClothesPrewarWomensCasual, 1, True)
	Player.removeItem(pChargenPlayerClothes, 1, True)
		
	
	SendStartMeUpEvent(true)
	
EndFunction

Function SetWastelanderDialogue()
	trace(self, "Wastelander Dialogue - Abernathy farm.")

	;set up dialogue for abernathy farm so you don't sound like an idiot
	pPlayerKnowsBrahmin.SetValueInt(1)
	;pDialogueAbernathyFarmLucy.LucyFarmBranch = 1
	pPlayerKnowsCaps.SetValueInt(1) 
	pDialogueAbernathyFarmLucy.LucyCapsBranch = 2
	pPlayerKnowsRaiders.SetValueInt(1) ;safe
	pPlayerKnowsTatos.SetValueInt(1) ;safe
EndFunction

Function CustomRequestSave()
	trace(self, "Requesting Save")
	
	if (Game.GetDifficulty() == 6)
		trace(self, "Player is in survival mode. Requesting autosave.")
		Game.RequestAutoSave()
	else
		trace(self, "Player is in not in survival mode. Requesting normal save.")
		Game.RequestSave()
	endif
EndFunction

;*****************************************************

Struct InstalledPlugins
	GlobalVariable isInstalled
	String PluginName
EndStruct

Function CheckForPlugins()
	 Trace( self + ": Player has loaded a game. Checking for new plugins.")
	
	; now check for the Creation Club so we can take control of the quests, delay their starts, and take over their quests
	; need this in case player installs after installing this one
	String currentPlugin = ""
	Bool pluginInstalled = false

	int PluginCount = 0
	while (PluginCount < PluginArray.length)
		if currentPlugin != PluginArray[PluginCount].PluginName
			currentPlugin = PluginArray[PluginCount].PluginName
			pluginInstalled = Game.IsPluginInstalled(currentPlugin)
			 Trace( self + ": pluginInstalled: " + pluginInstalled)
			if pluginInstalled
				PluginArray[PluginCount].IsInstalled.SetValue(1)
			else
				PluginArray[PluginCount].IsInstalled.SetValue(0)
			endif
		endif
		PluginCount += 1
	endwhile
EndFunction

Function AddItemsToFormlists()
	Trace( self + ": Adding Items to Formlists")
	
	If IsGlobalTrue(SMU_isRobot)
		RobotGearFourEyes()
		RobotGearUnsightly()
	EndIf
	If IsGlobalTrue(SMU_isCoast)
		CoastGearFourEyes()
		CoastGearUnsightly()
	EndIf
	If IsGlobalTrue(SMU_isNukaWorld)
		NukaGearFourEyes()
		NukaGearUnsightly()
	EndIf
	
	if IsGlobalTrue(SMU_isCCCapMerc)
		CapitalGearFourEyes()
		CapitalGearUnsightly()
	endif
	if IsGlobalTrue(SMU_isCCX02)
		X02GearFourEyes()
		X02GearUnsightly()
	endif
	if IsGlobalTrue(SMU_isCCPAGunMM)
		PAGunMMFourEyes()
		PAGunMMUnsightly()
	endif
	if IsGlobalTrue(SMU_isCCPrey)
		PreyUnsightly()
	endif
	if IsGlobalTrue(SMU_isCCDovah)
		DovahUnsightly()
	endif
	if IsGlobalTrue(SMU_isCCslocum)
		SlocumUnsightly()
	endif
	if IsGlobalTrue(SMU_isCCPint)
		PintFourEyes()
		PintUnsightly()
	endif
	if IsGlobalTrue(SMU_isCCHoliday)
		HolidayUnsightly()
	endif
EndFunction

Function RobotGearUnsightly()
	UnsightlyR = new int[4] ; Reset Array for new Items.
	UnsightlyR[0] = 0x00864A ; assaultron helmet
	UnsightlyR[1] = 0x00864C ; eyebot helmet
	UnsightlyR[2] = 0x008BC3 ; mechanist helmet
	UnsightlyR[3] = 0x00864E ; sentry bot helmet
	I = 0
	While (I < UnsightlyR.length)
		AddUnsightlyItems(isRobot, UnsightlyR[I]) ; step through the array
		I += 1
	EndWhile
EndFunction

Function NukaGearUnsightly()
	UnsightlyN = new int[17] ; Reset Array for new Items.
	UnsightlyN[0] = 0x026BB7 ; disciples banded helmet
	UnsightlyN[1] = 0x026BB0 ; disciples cowl
	UnsightlyN[2] = 0x026BBD ; disciples head covering
	UnsightlyN[3] = 0x03B557 ; disciples hood
	UnsightlyN[4] = 0x026BB6 ; disciples spiked helmet
	UnsightlyN[5] = 0x011515 ; nuke t51 helmet
	UnsightlyN[6] = 0x00DC29 ; overboss helm
	UnsightlyN[7] = 0x02770B ; beanie and crow mask
	UnsightlyN[8] = 0x027707 ; buffalo helmet
	UnsightlyN[9] = 0x02770A ; crow mask
	UnsightlyN[10] = 0x027708 ; deer mask
	UnsightlyN[11] = 0x027705 ; elephant helmet
	UnsightlyN[12] = 0x027706 ; jaguar helmet
	UnsightlyN[13] = 0x02770C ; masked helm
	UnsightlyN[14] = 0x02740F ; moose helmet
	UnsightlyN[15] = 0x040CFC ; X01 helmet
	UnsightlyN[16] = 0x0296B8 ; spacesuit costume
	I = 0
	While (I < UnsightlyN.length)
		AddUnsightlyItems(isNukaWorld, UnsightlyN[I]) ; step through the array
		I += 1
	EndWhile
EndFunction

Function CoastGearUnsightly()
	UnsightlyC = new int[5] ; Reset Array for new Items.
	UnsightlyC[0] = 0x0247C5 ; inquisitor's cowl
	UnsightlyC[1] = 0x04FA89 ; lobster trap helmet
	UnsightlyC[2] = 0x056F7D ; marine armor helmet
	UnsightlyC[3] = 0x03A557 ; marine tactical helmet
	UnsightlyC[4] = 0x04885A ; rescue diver suit
	I = 0
	While (I < UnsightlyC.length)
		AddUnsightlyItems(isCoast, UnsightlyC[I]) ; step through the array
		I += 1
	EndWhile
EndFunction

Function NukaGearFourEyes()
	FourEyesN = new int[6] ; Reset Array for new Items.
	FourEyesN[0] = 0x0424A1 ; bottlecap sunglasses
	FourEyesN[1] = 0x013A47 ; cappy glasses
	FourEyesN[2] = 0x02873E ; operator glasses
	FourEyesN[3] = 0x02873D ; operator goggles
	FourEyesN[4] = 0x011515 ; nuke t51 helmet
	FourEyesN[5] = 0x040CFC ; X01 helmet
	I = 0
	While (I < FourEyesN.length)
		AddFourEyesItems(isNukaWorld, FourEyesN[I]) ; step through the array
		I += 1
	EndWhile
EndFunction

Function CoastGearFourEyes()
	FourEyesC = new int[3] ; Reset Array for new Items.
	FourEyesC[0] = 0x0247C5 ; inquisitor's cowl
	FourEyesC[1] = 0x056F7D ; marine armor helmet
	FourEyesC[2] = 0x03A557 ; marine tactical helmet
	I = 0
	While (I < FourEyesC.length)
		AddFourEyesItems(isCoast, FourEyesC[I]) ; step through the array
		I += 1
	EndWhile
EndFunction

Function RobotGearFourEyes()
	FourEyesR = new int[1] ; Reset Array for new Items.
	FourEyesR[0] = 0x008BC3 ; mechanist helmet
	i = 0 ; set i back to zero to begin.
	While (I < FourEyesR.length) 
		AddFourEyesItems(isRobot, FourEyesR[I]) ; step through the array
		I += 1
	EndWhile
EndFunction

Function CapitalGearFourEyes()
	FourEyesCCCap = new int[3] 		; Reset array for new items
	FourEyesCCCap[0] = 0x011A6C		; Caged Mercenary Veteran Goggles
	FourEyesCCCap[1] = 0x01175C		; Mercenary Adventure Goggles
	FourEyesCCCap[2] = 0x011A69		; Mercenary Veteran Goggles
	i = 0 ; set back to zero to begin
	while i < FourEyesCCCap.Length
		AddFourEyesItems(isCCCCapMerc, FourEyesCCCap[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function CapitalGearUnsightly()
	UnsightlyCCCap = new int[4]		; Reset array for new items
	UnsightlyCCCap[0] = 0x01175E		; Mercenary Charmer Dress Helmet
	UnsightlyCCCap[1] = 0x01175F		; Mercenary Charmer Suit Helmet
	UnsightlyCCCap[2] = 0x011766		; Mercenary Troublemaker Hat
	UnsightlyCCCap[3] = 0x0117DE		; Talon Company Helmet
	i = 0 ; set back to zero to begin
	while i < UnsightlyCCCap.Length
		AddUnsightlyItems(isCCCCapMerc, UnsightlyCCCap[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function X02GearFourEyes()
	FourEyesCCX2 = new int[1]			; reset array for new items
	FourEyesCCX2[0] = 0x00F806			; X-02 Helm
	i = 0 ; set back to zero to begin
	while i < FourEyesCCX2.Length
		AddFourEyesItems(isCCX02, FourEyesCCX2[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function X02GearUnsightly()
	UnsightlyCCX2 = new int[1]			; reset array for new items
	UnsightlyCCX2[0] = 0x00F806			; X-02 Helm
	i = 0 ; set back to zero to begin
	while i < UnsightlyCCX2.Length
		AddUnsightlyItems(isCCX02, UnsightlyCCX2[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function PAGunMMFourEyes()
	FourEyesCCPAGun = new int[3]		;reset array for new items
	FourEyesCCPAGun[0] = 0x01200D		;T-45 Helm
	FourEyesCCPAGun[1] = 0x012828		;T-51 Helm
	FourEyesCCPAGun[2] = 0x01287B		;T-60 Helm
	i = 0 ; set back to zero to begin
	while i < FourEyesCCPAGun.Length
		AddFourEyesItems(isCCPAGunMM, FourEyesCCPAGun[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function PAGunMMUnsightly()
	UnsightlyCCPAGun = new int[3]		;reset array for new items
	UnsightlyCCPAGun[0] = 0x01200D		;T-45 Helm
	UnsightlyCCPAGun[1] = 0x012828		;T-51 Helm
	UnsightlyCCPAGun[2] = 0x01287B		;T-60 Helm
	i = 0 ; set back to zero to begin
	while i < UnsightlyCCPAGun.Length
		AddUnsightlyItems(isCCPAGunMM, UnsightlyCCPAGun[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function PreyUnsightly()
	UnslightlyCCPrey = new int[1]		;reset array for new items
	UnslightlyCCPrey[0] = 0x000f99		; Morgan's spacesuit
	i = 0 ; set back to zero to begin
	while i < UnslightlyCCPrey.Length
		AddUnsightlyItems(isCCPrey, UnslightlyCCPrey[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function DovahUnsightly()
	UnsightlyCCDovah = new int[1]		;reset array for new items
	UnsightlyCCDovah[0] = 0x008f99		;Iron Helmet
	i = 0 ; set i back to zero to begin.
	while i < UnsightlyCCDovah.Length
		AddUnsightlyItems(isCCDovah, UnsightlyCCDovah[i]) ; Step through the Array.
		i += 1
	endwhile
	
EndFunction

Function SlocumUnsightly()
	UnsightlyCCSlocum = new int[1]		;reset array for new items
	UnsightlyCCSlocum[0] = 0x003806		; Slocum's Joe Visor
	while i < UnsightlyCCSlocum.Length
		AddUnsightlyItems(isCCslocum, UnsightlyCCSlocum[i]) ; Step through the Array.
		i += 1
	endwhile
EndFunction

Function PintFourEyes()
	FourEyesCCPint = new int[1] 		; Reset Array for new Items.
	FourEyesCCPint[0] = 0x00a801 		; Pint-sized slasher costume
	i = 0 ; set i back to zero to begin.
	while i < FourEyesCCPint.Length
		AddFourEyesItems(isCCPint, FourEyesCCPint[i]) ; Step through the Array.
		i += 1
	endwhile
EndFunction

Function PintUnsightly()
	UnsightlyCCPint = new int[1]			; reset array for new items
	UnsightlyCCPint[0] = 0x00a801			; Pint-sized slasher costume
	i = 0 ; set back to zero to begin
	while i < UnsightlyCCPint.Length
		AddUnsightlyItems(isCCPint, UnsightlyCCPint[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function HolidayUnsightly()
	UnsightlyCCHoliday = new int[2]			; reset array for new items
	UnsightlyCCHoliday[0] = 0x00B8CB		; sexy santa hat
	UnsightlyCCHoliday[1] = 0x00B8E0		; santa hat
	i = 0 ; set back to zero to begin
	while i < UnsightlyCCHoliday.Length
		AddUnsightlyItems(isCCHoliday, UnsightlyCCHoliday[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function AddUnsightlyItems(string Filetocall, int arg)
	If (!pSMU_UnsightlyGear.HasForm(Game.GetFormFromFile(arg, Filetocall)))
		pSMU_UnsightlyGear.AddForm(Game.GetFormFromFile(arg, Filetocall))
		Trace( self + ": filetocall" + filetocall + "arg" +arg)
	EndIf
EndFunction

Function AddFourEyesItems(string Filetocall, int arg)
	If (!pSMU_FourEyesGear.HasForm(Game.GetFormFromFile(arg, Filetocall)))
		pSMU_FourEyesGear.AddForm(Game.GetFormFromFile(arg, Filetocall))
		Trace( self + ": filetocall" + filetocall + "arg" +arg)
	EndIf
EndFunction

;*****************************************************
	

Function SetShaunsFace()
	Alias_Shaun.GetActorReference().AddKeyword(isPlayerChild)
	Alias_ShaunChild.GetActorReference().AddKeyword(isPlayerChild)
	Alias_ShaunChildHologram.GetActorReference().AddKeyword(isPlayerChild)
	Alias_MQ203memoryH_Shaun.GetActorReference().AddKeyword(isPlayerChild)
EndFunction

Function UnsetShaunsFace()
	trace(self, "Updating Shaun. Removing isPlayerChild Keyword.")
	Alias_Shaun.GetActorReference().RemoveKeyword(isPlayerChild)
	Alias_ShaunChild.GetActorReference().RemoveKeyword(isPlayerChild)
	Alias_ShaunChildHologram.GetActorReference().RemoveKeyword(isPlayerChild)
	Alias_MQ203memoryH_Shaun.GetActorReference().RemoveKeyword(isPlayerChild)
EndFunction

;*****************************************************

Function BlockPlayerControls(ObjectReference akActionRef)
	akActionRef = myActor as Actor
	myActor.SetGhost(true)
	ControlInputLayer = InputEnableLayer.Create()
	ControlInputLayer.DisablePlayerControls(False, False, False, True, False, False, True, False, False, False, False)
EndFunction

Function UnblockPlayerControls(ObjectReference akActionRef)
	akActionRef = myActor as Actor
	myActor.SetGhost(false)
	ControlInputLayer.Delete()
	ControlInputLayer = None
EndFunction

Function FadeIn()
	; Fade in.
	HoldAtBlackImod.PopTo(FadefromBlackImod, 1.0)
	;wait for fade out
	Utility.Wait(1)
	;failsafe. remove the Imods
	HoldAtBlackImod.Remove()
	FadefromBlackImod.Remove()
EndFunction

Function RegisterLocationChange(ObjectReference akActionRef)
	RegisterForRemoteEvent(akActionRef, "OnLocationChange")
EndFunction

Function AddPipboyToPlayer(Actor akActionRef)
	akActionRef.AddItem(pPipboy)
EndFunction

Function RemovePipboyFromPlayer(Actor akActionRef)
	akActionRef.RemoveItem(pPipboy)
EndFunction

;-- Convenience & Utility Functions -----------------

bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) debugOnly
	;we are sending callingObject so we can in the future route traces to different logs based on who is calling the function
	string SMULog = "StartMeUp"
	debug.OpenUserLog(SMULog) 
	RETURN debug.TraceUser(SMULog, CallingObject + ": " + asTextToPrint, aiSeverity)
EndFunction

StartMeUp:StartMeUpManagerScript Function GetScript() global
	return Game.GetFormFromFile(0x0009C8D3, "StartMeUp.esp") as StartMeUp:StartMeUpManagerScript
EndFunction

;convenience function, also helps enforce the values
;borrowed from HC_Manager because convenient (also lazy turtle is lazy)
bool function IsGlobalTrue(globalvariable GlobalToCheck)
	bool val = GlobalToCheck.GetValue() 
	if val == iGlobalTrue
		RETURN true
	elseif  val == iGlobalFalse
		RETURN false
	else
		;ERROR
		Game.Warning(self + "IsGlobalTrue() found unrecognized value in " + GlobalToCheck + ": " + GlobalToCheck.GetValue())
		RETURN false
	endif
EndFunction

Function UpdateQuest(Quest theQuest, Quest newQuestProperty, int newWatcherStage)
	ScriptObject update = theQuest.CastAs("CreationClub:StartAfterCharGenScript")
	update.SetPropertyValue("MQ102", newQuestProperty)
	update.SetPropertyValue("CharGenStageToWatch", newWatcherStage)
EndFunction

;/
Function CustomUnregister(Quest theQuest)
	 Trace(self, ": Unregister MQ102 on the quest:" + theQuest)
	ScriptObject update = theQuest.CastAs("CreationClub:StartAfterCharGenScript")

	bool MQStage10Done = MQ102.IsStageDone(10)
	bool MQStage15Done = MQ102.IsStageDone(15)

	if !MQStage10Done && !MQStage15Done
		UnregisterForRemoteEvent(MQ102, "OnStageSet")
	endif
EndFunction

/;