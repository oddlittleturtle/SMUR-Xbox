;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_vault111CryoRoomTermi_00095704_1 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
pCryoRoomDoor.GetRef().Unlock()
pCryoRoomDoor.GetRef().SetOpen(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



ReferenceAlias Property pCryoRoomDoor Auto Const
