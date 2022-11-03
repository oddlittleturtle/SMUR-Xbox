Scriptname StartMeUp:SMU_HolotapeScript extends ObjectReference 

Quest Property pSMUQuest Auto Const

auto STATE waitingForPlayer
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		pSMUQuest.SetObjectiveCompleted(10, 1)
		pSMUQuest.SetObjectiveCompleted(20, 1)
		pSMUQuest.SetObjectiveCompleted(25, 1)
		pSMUQuest.SetObjectiveCompleted(30, 1)
		pSMUQuest.SetObjectiveDisplayed(40, 1)
		Utility.Wait(1.0)
		gotostate("waitingToBePlayed")
	endif
EndEvent
EndState

STATE waitingToBePlayed
Event OnEquipped(Actor akActor)
  if akActor == Game.GetPlayer()
		pSMUQuest.SetObjectiveCompleted(40, 1)
		pSMUQuest.SetObjectiveDisplayed(50, 1)
		pSMUQuest.SetStage(50)
		Utility.Wait(1.0)
		gotostate("hasbeentriggered")
  endIf
EndEvent
EndState

STATE hasbeentriggered
	;do nothing
EndState

