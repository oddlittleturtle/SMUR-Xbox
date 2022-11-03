;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname StartMeUp:Fragments:Quests:QF_SMUQuest_ObjectiveHandler_0809C8D4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
if Alias_Vault111MapMarker.GetRef().IsMapMarkerVisible() == False
 if !SMUQuest.IsRunning()
   SetObjectiveDisplayed(10,1)
   Alias_Vault111MapMarker.GetRef().AddtoMap()
   SMUQuest.SetStage(10)
 endif
else
 SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Vault111MapMarker Auto Const Mandatory

Quest Property SMUQuest Auto Const Mandatory
