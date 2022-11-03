;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname StartMeUp:Fragments:Quests:QF_SMU_Raiders_080468D4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE StartMeUp:SMU_RaiderHandlerScript
Quest __temp = self as Quest
StartMeUp:SMU_RaiderHandlerScript kmyQuest = __temp as StartMeUp:SMU_RaiderHandlerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.trace(self, "SMU_Raiders started...")

;add the Raiders to the RefCollection so we can control them on the quest script for shutdown
Alias_Raiders.AddRef((Game.GetFormFromFile(0x246D12, "Fallout4.ESM") as Actor))
Alias_Raiders.AddRef((Game.GetFormFromFile(0x246D10, "Fallout4.ESM") as Actor))
Alias_Raiders.AddRef((Game.GetFormFromFile(0x246D0F, "Fallout4.ESM") as Actor))
Alias_Raiders.AddRef((Game.GetFormFromFile(0x246D11, "Fallout4.ESM") as Actor))
Alias_Raiders.AddRef((Game.GetFormFromFile(0x246D13, "Fallout4.ESM") as Actor))

;update the factions
kmyQuest.UpdateRaiders()

;give it a second to cycle through before registering
Utility.Wait(1.0)

;Register for hit events
(Alias_Raiders as StartMeUp:SMU_RoughRaidersScript).RegisterRaidersForHitEvents()

kmyQuest.trace(self, "SMU_Raiders set up. Raiders aliases done. Moving player.")

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
kmyQuest.trace(self, "SMU_Raiders:  Moving player into place...")
;moved from SMU_BathroomTriggerScript

;let any other scripts get caught up
Utility.Wait(1.0)

Actor PlayerRef = Game.GetPlayer()

pSMU_SpawnTriggerREF.MoveTo(Game.GetFormFromFile(0x0973E2, "Fallout4.ESM") as objectreference)
pSMU_SpawnTriggerREF.SetPosition(-94041.50781, 77626.14844, 8854.283203)
pSMU_SpawnTriggerREF.SetAngle(0, 0, 0)

;give it a second
Utility.Wait(1.0)

;now move the player
PlayerRef.Moveto(pSMU_SpawnTriggerREF)

kmyQuest.trace(self, "Player has moved to Raiders Spawn Point northwest of Sanctuary...")
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

kmyQuest.Trace(self, "Factions cleaned up")

(Alias_Raiders as StartMeUp:SMU_RoughRaidersScript).UnregisterRaidersForHitEvents()

kmyQuest.Trace(self, "raiders unregistered...")

utility.wait(10)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
; no boss for this quest
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
kmyQuest.trace(self, "SMU_Raiders turned hostile by player. Shut down and lock any associated quests.")

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_Raiders Auto Const Mandatory

ObjectReference Property pSMU_SpawnTriggerREF Auto Const Mandatory
