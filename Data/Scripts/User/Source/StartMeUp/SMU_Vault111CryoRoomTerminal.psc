Scriptname StartMeUp:SMU_Vault111CryoRoomTerminal extends ObjectReference

GlobalVariable Property pSMU_FollowedVanillaPath Auto
GlobalVariable Property pSMU_VaultStart Auto

auto STATE waitingForPlayer
Event OnActivate(ObjectReference akActionRef)
	If (akActionRef == Game.GetPlayer() && pSMU_FollowedVanillaPath.GetValueInt() < 2 && pSMU_VaultStart.GetValueInt() > 0)
			;case = either the player chose the vanilla quick start, or the vault 111 alternate start
			gotostate("hasbeentriggered")
			Game.ShowSPECIALMenu()
	ElseIf (akActionRef == Game.GetPlayer())
			;case = the player chose a different start path and we don't need to show the special menu here
			gotostate("hasbeentriggered")
	Else
			;do nothing - something other than the player activated the terminal (somehow???)
	EndIf
EndEvent
EndState

STATE hasbeentriggered
	;do nothing, let the player activate the terminal normally
EndState










