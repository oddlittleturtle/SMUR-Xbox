;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname StartMeUp:Fragments:Quests:QF_SMU_Raiders2_08064880 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE StartMeUp:SMU_RaiderHandlerScript
Quest __temp = self as Quest
StartMeUp:SMU_RaiderHandlerScript kmyQuest = __temp as StartMeUp:SMU_RaiderHandlerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.trace(self, "Start Me Up: Roadside Pines Motel Raiders... starting...")

;add the appropriate raiders to the refcol
Alias_Raiders.AddRef((Game.GetFormFromFile(0x04E933, "Fallout4.ESM") as Actor))
Alias_Raiders.AddRef((Game.GetFormFromFile(0x1CCBB8, "Fallout4.ESM") as Actor))
Alias_Raiders.AddRef((Game.GetFormFromFile(0x1CCBF5, "Fallout4.ESM") as Actor))
Alias_Raiders.AddRef((Game.GetFormFromFile(0x1CCBF8, "Fallout4.ESM") as Actor))

;update the factions
kmyQuest.UpdateRaiders()

;give it a second to cycle through before registering
Utility.Wait(1.0)

;Register for hit events
(Alias_Raiders as StartMeUp:SMU_RoughRaidersScript).RegisterRaidersForHitEvents()

kmyQuest.trace(self, "Start Me Up: Roadside Pines set up. Raiders aliases done. Moving player.")

;we're ready to move the player into position

;SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE StartMeUp:SMU_RaiderHandlerScript
Quest __temp = self as Quest
StartMeUp:SMU_RaiderHandlerScript kmyQuest = __temp as StartMeUp:SMU_RaiderHandlerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.trace(self, " Moving player to Roadside Pines Motel...")
;moved from SMU_BathroomTriggerScript

;let any other scripts get caught up
Utility.Wait(1.0)
kmyQuest.trace(self,"done waiting. continuing...")

Actor PlayerRef = Game.GetPlayer()

pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(0x0973E2, "Fallout4.ESM") as objectreference)
pSMU_SpawnTriggerREF.SetPosition(-89227.5234, -42622.9023, 2906.6938)
pSMU_SpawnTriggerREF.SetAngle(0, 0, -34.3774)

kmyQuest.trace(self, pSMU_SpawnTriggerREF + "added to world...")

;give it a second
Utility.Wait(1.0)

;now move the player
PlayerRef.Moveto(pSMU_SpawnTriggerREF)

kmyQuest.trace(self, "Player has moved to Roadside Pines Motel...")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE StartMeUp:SMU_RaiderHandlerScript
Quest __temp = self as Quest
StartMeUp:SMU_RaiderHandlerScript kmyQuest = __temp as StartMeUp:SMU_RaiderHandlerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CleanUpFactions()

;in case of one-shot kills
if Alias_RaiderBoss.GetActorReference().IsDead()
 (Alias_Raiders as StartMeUp:SMU_RoughRaidersScript).UnregisterRaidersForHitEvents()
endif

utility.wait(10)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE StartMeUp:SMU_RaiderHandlerScript
Quest __temp = self as Quest
StartMeUp:SMU_RaiderHandlerScript kmyQuest = __temp as StartMeUp:SMU_RaiderHandlerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CleanUpFactions()

;for oneshot kills
if Alias_RaiderBoss.GetActorReference().IsDead()
 (Alias_Raiders as StartMeUp:SMU_RoughRaidersScript).UnregisterRaidersForHitEvents()
else
 Alias_RaiderBoss.TryToEvaluatePackage()
endif

utility.wait(10)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE StartMeUp:SMU_RaiderHandlerScript
Quest __temp = self as Quest
StartMeUp:SMU_RaiderHandlerScript kmyQuest = __temp as StartMeUp:SMU_RaiderHandlerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.trace(self, "Player has turned Roadside Pines Motel hostile. Shut down and block off any possible quests.")

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


RefCollectionAlias Property Alias_Raiders Auto Const Mandatory

ReferenceAlias Property Alias_RaiderBoss Auto Const Mandatory

ObjectReference Property pSMU_SpawnTriggerREF Auto Const Mandatory
