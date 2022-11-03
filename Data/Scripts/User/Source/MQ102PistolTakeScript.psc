Scriptname MQ102PistolTakeScript extends ObjectReference

Quest Property MQ102 Auto
Quest Property Tutorial Auto

;when the player picks up the weapon, enable VATS
Auto State WaitingForPlayer
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
        if akNewContainer == Game.GetPlayer()
			if ((Game.GetFormFromFile(0x0001F779, "StartMeUp.esp") as GlobalVariable).GetValueInt()) > 0
				gotoState("hasBeenTriggered")
				(MQ102 as MQ03QuestScript).MQ102EnableVats()
				Tutorial.SetStage(1010)
			endif
        endif
	EndEvent
EndState

State hasBeenTriggered
	;empty State
EndState
