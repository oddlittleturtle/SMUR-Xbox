ScriptName StartMeUp:SMU_SMUQuestScript extends Quest
{Started life as Start Me Up 6.0 Beta by Tiny Manticore. Has taken a life of its own by oddlittleturtle.}
;This script used to live on "Rumor of a Vault" Quest. "Rumor of a Vault" is updated and this script has moved to the master quest that holds several functions for Xbox Start Me Up Redux.

Group SMU_Properties
	ObjectReference Property SMU_BathroomTriggerREF Auto Const
	Quest Property pMQ101Radio Auto Const
	Quest Property MQ102 Auto Const
EndGroup

Group GearLists
	FormList Property pSMU_FourEyesGear Auto
	{built at runtime}
	FormList Property pSMU_UnsightlyGear Auto
	{built at runtime}
EndGroup

Group DLC_Tracking CollapsedOnRef
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

Group ShaunREFS
	GlobalVariable Property SMU_FollowedVanillaPath Auto Const Mandatory
	GlobalVariable Property SMU_VaultStart Auto Const Mandatory
	GlobalVariable Property SMU_PlayerChoice_Shaun Auto Const Mandatory
	{Player chose to update Shaun from holotape}
	
	ReferenceAlias Property Alias_Shaun Auto Const
	ReferenceAlias Property Alias_ShaunChild Auto Const
	ReferenceAlias Property Alias_ShaunChildHologram  Auto Const
	ReferenceAlias Property Alias_MQ203memoryH_Shaun Auto Const
	
	Keyword Property isPlayerChild Auto Const Mandatory
EndGroup


;-- Variables ---------------------------------------
; we're storing a lot of variables
; we've got a lot of plugins to check for

; "enums" for IsGlobalTrue
int iGlobalTrue 			= 1 const
int iGlobalFalse 			= 0 const




;**************************************************************************************************
;----------START ME UP-------------
; for initializing
Actor Player
bool bInitialized = false
bool bShutDown = false

Event OnQuestInit()
	Trace(self, "OnQuestInit()")
	
	;store the player 
	Player = Game.GetPlayer()
		
	StartMeUp()

EndEvent


Event Actor.OnPlayerLoadGame(Actor akActorRef)
	 Trace(self, ": Save game loaded; run checks for additional content.")
	AddItemsToFormlists()
EndEvent

Function StartMeUp()
	 Trace(self, ": StartMeUp()")
	; run this once
	if bInitialized
		return
	endif
	
	if !bInitialized
			
		; for fixing everything up after getting our hair did...
		;RegisterForMenuOpenCloseEvent("LooksMenu")
		RegisterForRemoteEvent(Player, "OnPlayerLoadGame")
		
		;for checking we landed where we were supposed to land.
		RegisterForRemoteEvent(Player, "OnLocationChange")
		

		;move the trigger box into the pre-war house so the player gets the menu when they are finished with character creation
		SMU_BathroomTriggerREF.MoveTo(Game.GetFormFromFile(0x0484CF, "Fallout4.ESM") as objectreference)
		SMU_BathroomTriggerREF.SetPosition(-80483.2422, 90962.3672, 7917.3750)
		SMU_BathroomTriggerREF.SetAngle(0, 0, 0)

		;disable radio in prewar house
		pMQ101Radio.SetStage(100)
		
		;update trait formlists for any DLC gear
		AddItemsToFormlists()

		 Trace(self, "Start Me Up: Redux Xbox  is running.")
	else
		 Trace(self, "Start Me Up: Redux Xbox  is already running.")
	endif
	bInitialized = true
EndFunction

Function RemoveKeywordFromShaun()
	Alias_Shaun.GetActorRef().RemoveKeyword(isPlayerChild)
	Alias_ShaunChild.GetActorRef().RemoveKeyword(isPlayerChild)
	Alias_MQ203memoryH_Shaun.GetActorRef().RemoveKeyword(isPlayerChild)
	Alias_ShaunChildHologram.GetActorRef().RemoveKeyword(isPlayerChild)
EndFunction

Function AddKeywordToShaun()
	if SMU_PlayerChoice_Shaun.GetValueInt() == 1
		if !Alias_Shaun.GetActorRef().HasKeyword(isPlayerChild)
			Alias_Shaun.GetActorRef().AddKeyword(isPlayerChild)
		endif
		if !Alias_ShaunChild.GetActorRef().HasKeyword(isPlayerChild)
			Alias_ShaunChild.GetActorRef().AddKeyword(isPlayerChild)
		endif
		if !Alias_MQ203memoryH_Shaun.GetActorRef().HasKeyword(isPlayerChild)
			Alias_MQ203memoryH_Shaun.GetActorRef().AddKeyword(isPlayerChild)
		endif
		if !Alias_ShaunChildHologram.GetActorRef().HasKeyword(isPlayerChild)
			Alias_ShaunChildHologram.GetActorRef().RemoveKeyword(isPlayerChild)
		endif
	else
		  ; do nothing
	endif
EndFunction

;*******************************************************************************************************


;-- Variables ---------------------------------------
bool isNukaWorld
bool isRobot
bool isCoast

bool isCCPrey
bool isCCCapMerc
bool isCCX02
bool isCCPAGunMM
bool isCCslocum
bool isCCDovah
bool isCCPint
bool isCCHoliday

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



;-- Functions ---------------------------------------

Function AddItemsToFormlists()
	isRobot = Game.IsPluginInstalled("DLCRobot.esm")
	isCoast = Game.IsPluginInstalled("DLCCoast.esm")
	isNukaWorld = Game.IsPluginInstalled("DLCNukaWorld.esm")
	isCCCapMerc 	= Game.IsPluginInstalled("ccbgsfo4117-capmerc.esl")
	isCCX02 		= Game.IsPluginInstalled("ccbgsfo4115-x02.esl")
	isCCPAGunMM 	= Game.IsPluginInstalled("ccgcafo4025-pagunmm.esl")
	isCCPrey		= Game.IsPluginInstalled("ccbgsfo4016-prey.esl")
	isCCDovah		= Game.IsPluginInstalled("ccbgsfo4048-dovah.esl")
	isCCslocum 		= Game.IsPluginInstalled("ccfsvfo4003-slocum.esl")
	isCCPint		= Game.IsPluginInstalled("ccbgsfo4035-pint.esl")
	isCCHoliday 	= Game.IsPluginInstalled("ccjvdfo4001-holiday.esl")
	If (isRobot)
		Self.RobotGearFourEyes()
		Self.RobotGearUnsightly()
	EndIf
	If (isCoast)
		Self.CoastGearFourEyes()
		Self.CoastGearUnsightly()
	EndIf
	If (isNukaWorld)
		Self.NukaGearFourEyes()
		Self.NukaGearUnsightly()
	EndIf
	
	if isCCCapMerc
	CapitalGearFourEyes()
	CapitalGearUnsightly()
	endif
	if isCCX02
		X02GearFourEyes()
		X02GearUnsightly()
	endif
	if isCCPAGunMM
		PAGunMMFourEyes()
		PAGunMMUnsightly()
	endif
	if isCCPrey
		PreyUnsightly()
	endif
	if isCCDovah
		DovahUnsightly()
	endif
	if isCCslocum
		SlocumUnsightly()
	endif
	if isCCPint
		PintFourEyes()
		PintUnsightly()
	endif
	if isCCHoliday
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
		Self.AddUnsightlyItems("DLCRobot.esm", UnsightlyR[I])
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
		Self.AddUnsightlyItems("DLCNukaWorld.esm", UnsightlyN[I])
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
		Self.AddUnsightlyItems("DLCCoast.esm", UnsightlyC[I])
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
		Self.AddFourEyesItems("DLCNukaWorld.esm", FourEyesN[I])
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
		Self.AddFourEyesItems("DLCCoast.esm", FourEyesC[I])
		I += 1
	EndWhile
EndFunction

Function RobotGearFourEyes()
	FourEyesR = new int[1] ; Reset Array for new Items.
	FourEyesR[0] = 0x008BC3 ; mechanist helmet
	i = 0 ; set i back to zero to begin.
	While (I < FourEyesR.length)
		Self.AddFourEyesItems("DLCRobot.esm", FourEyesR[I])
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
		AddFourEyesItems("ccbgsfo4117-capmerc.esl", FourEyesCCCap[i]) ; step through the array
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
		AddUnsightlyItems("ccbgsfo4117-capmerc.esl", UnsightlyCCCap[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function X02GearFourEyes()
	FourEyesCCX2 = new int[1]			; reset array for new items
	FourEyesCCX2[0] = 0x00F806			; X-02 Helm
	i = 0 ; set back to zero to begin
	while i < FourEyesCCX2.Length
		AddFourEyesItems("ccbgsfo4115-x02.esl", FourEyesCCX2[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function X02GearUnsightly()
	UnsightlyCCX2 = new int[1]			; reset array for new items
	UnsightlyCCX2[0] = 0x00F806			; X-02 Helm
	i = 0 ; set back to zero to begin
	while i < UnsightlyCCX2.Length
		AddUnsightlyItems("ccbgsfo4115-x02.esl", UnsightlyCCX2[i]) ; step through the array
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
		AddFourEyesItems("ccgcafo4025-pagunmm.esl", FourEyesCCPAGun[i]) ; step through the array
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
		AddUnsightlyItems("ccgcafo4025-pagunmm.esl", UnsightlyCCPAGun[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function PreyUnsightly()
	UnslightlyCCPrey = new int[1]		;reset array for new items
	UnslightlyCCPrey[0] = 0x000f99		; Morgan's spacesuit
	i = 0 ; set back to zero to begin
	while i < UnslightlyCCPrey.Length
		AddUnsightlyItems("ccbgsfo4016-prey.esl", UnslightlyCCPrey[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function DovahUnsightly()
	UnsightlyCCDovah = new int[1]		;reset array for new items
	UnsightlyCCDovah[0] = 0x008f99		;Iron Helmet
	i = 0 ; set i back to zero to begin.
	while i < UnsightlyCCDovah.Length
		AddUnsightlyItems("ccbgsfo4048-dovah.esl", UnsightlyCCDovah[i]) ; Step through the Array.
		i += 1
	endwhile
	
EndFunction

Function SlocumUnsightly()
	UnsightlyCCSlocum = new int[1]		;reset array for new items
	UnsightlyCCSlocum[0] = 0x003806		; Slocum's Joe Visor
	while i < UnsightlyCCSlocum.Length
		AddUnsightlyItems("ccfsvfo4003-slocum.esl", UnsightlyCCSlocum[i]) ; Step through the Array.
		i += 1
	endwhile
EndFunction

Function PintFourEyes()
	FourEyesCCPint = new int[1] 		; Reset Array for new Items.
	FourEyesCCPint[0] = 0x00a801 		; Pint-sized slasher costume
	i = 0 ; set i back to zero to begin.
	while i < FourEyesCCPint.Length
		AddFourEyesItems("ccbgsfo4035-pint.esl", FourEyesCCPint[i]) ; Step through the Array.
	i += 1
	endwhile
EndFunction

Function PintUnsightly()
	UnsightlyCCPint = new int[1]			; reset array for new items
	UnsightlyCCPint[0] = 0x00a801			; Pint-sized slasher costume
	i = 0 ; set back to zero to begin
	while i < UnsightlyCCPint.Length
		AddUnsightlyItems("ccbgsfo4035-pint.esl", UnsightlyCCPint[i]) ; step through the array
		i += 1
	endwhile
EndFunction

Function HolidayUnsightly()
	UnsightlyCCHoliday = new int[2]			; reset array for new items
	UnsightlyCCHoliday[0] = 0x00B8CB		; sexy santa hat
	UnsightlyCCHoliday[1] = 0x00B8E0		; santa hat
	i = 0 ; set back to zero to begin
	while i < UnsightlyCCHoliday.Length
		AddUnsightlyItems("ccjvdfo4001-holiday.esl", UnsightlyCCHoliday[i]) ; step through the array
		i += 1
	endwhile
EndFunction


Function AddUnsightlyItems(string Filetocall, int arg)
	If (!pSMU_UnsightlyGear.HasForm(Game.GetFormFromFile(arg, Filetocall)))
		pSMU_UnsightlyGear.AddForm(Game.GetFormFromFile(arg, Filetocall))
	EndIf
EndFunction

Function AddFourEyesItems(string Filetocall, int arg)
	If (!pSMU_FourEyesGear.HasForm(Game.GetFormFromFile(arg, Filetocall)))
		pSMU_FourEyesGear.AddForm(Game.GetFormFromFile(arg, Filetocall))
	EndIf
EndFunction


;******************************************************************************************************

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

bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) global debugOnly
	;we are sending callingObject so we can in the future route traces to different logs based on who is calling the function
	string SMULog = "StartMeUp"
	debug.OpenUserLog(SMULog) 
	RETURN debug.TraceUser(SMULog, CallingObject + ": " + asTextToPrint, aiSeverity)
	
EndFunction

;******************************************************************************************************

Function UpdateQuest(Quest theQuest, Quest newQuestProperty, int newWatcherStage)
	ScriptObject update = theQuest.CastAs("CreationClub:StartAfterCharGenScript")
	update.SetPropertyValue("MQ102", newQuestProperty)
	update.SetPropertyValue("CharGenStageToWatch", newWatcherStage)
EndFunction

Function CustomUnregister(Quest theQuest)
	 Trace(self, ": Unregister MQ102 on the quest:" + theQuest)
	ScriptObject update = theQuest.CastAs("CreationClub:StartAfterCharGenScript")

	bool MQStage10Done = MQ102.IsStageDone(10)
	bool MQStage15Done = MQ102.IsStageDone(15)

	if !MQStage10Done && !MQStage15Done
		UnregisterForRemoteEvent(MQ102, "OnStageSet")
	endif
EndFunction