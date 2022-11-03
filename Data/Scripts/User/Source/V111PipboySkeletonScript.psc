Scriptname V111PipboySkeletonScript extends ObjectReference

auto STATE waitingForPlayer
	Event OnInit()
		if ((Game.GetFormFromFile(0x0001F779, "StartMeUp.esp") as GlobalVariable).GetValueInt()) > 0
			;in-vault start, do nothing
		Else
			gotostate("hasbeentriggered")
			SetDestroyed() ;destroy it if this is a non-vault start
		EndIf
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			If Game.GetPlayer().IsInCombat()
				;do nothing if the player is in combat 
			Elseif ((Game.GetFormFromFile(0x0001F779, "StartMeUp.esp") as GlobalVariable).GetValueInt()) > 0
				gotostate("hasbeentriggered")
				GetLinkedRef().Activate(game.Getplayer()) ;have the player activate the linkedref furniture
				SetDestroyed() ; you cannot activate this again
			Else
				;do nothing if this is a non-vault start
				gotostate("hasbeentriggered")
				SetDestroyed() ; you cannot activate this again
			EndIf
		EndIf
	EndEvent

	Event OnGrab()
			If Game.GetPlayer().IsInCombat()
				;do nothing if the player is in combat 
			Elseif ((Game.GetFormFromFile(0x0001F779, "StartMeUp.esp") as GlobalVariable).GetValueInt()) > 0
				gotostate("hasbeentriggered")
				GetLinkedRef().Activate(game.Getplayer()) ;have the player activate the linkedref furniture
				SetDestroyed() ; you cannot activate this again
			Else
				;do nothing if this is a non-vault start
				gotostate("hasbeentriggered")
				SetDestroyed() ; you cannot activate this again
			EndIf
	EndEvent
EndState

STATE hasbeentriggered
	;empty State state
EndState

