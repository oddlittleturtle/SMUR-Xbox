Scriptname StartMeUp:SMU_CryopodExitTrigger extends ObjectReference

ReferenceAlias Property pCryoDoorAlias Auto

auto STATE waitingForPlayer

Event onTriggerEnter(ObjectReference akActionRef)
If (akActionRef == Game.GetPlayer())
;lock the cryo door
ObjectReference TheCryoDoor = Game.GetFormFromFile(0x00001977, "Fallout4.ESM") as ObjectReference
pCryoDoorAlias.ForceRefTo(TheCryoDoor)
pCryoDoorAlias.GetRef().Lock()
pCryoDoorAlias.GetRef().SetLockLevel(253)
gotostate("hasbeentriggered")
endif
EndEvent
EndState

STATE hasbeentriggered
;do nothing
EndState