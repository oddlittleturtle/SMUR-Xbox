Scriptname StartMeUp:SMU_Vault111CryoDoorScript extends ReferenceAlias

Scene Property p007_PlayerDoorTerminal Auto Const
GlobalVariable Property pSMU_VaultStart Auto Const
GlobalVariable Property pSMU_FollowedVanillaPath Auto Const

auto STATE dothisonce

Event OnLoad()
;only lock the door if we're doing a vault-based alt-start or quick-start, to force the player to go to the terminal
	if pSMU_VaultStart.GetValueInt() > 0 && pSMU_FollowedVanillaPath.GetValueInt() < 2 ;0=alt start, 1=quick start, 2=vanilla start
		Self.GetRef().Lock()
		Self.GetRef().SetLockLevel(253)
		gotoState("normaloperation")
	endif 
EndEvent

Event OnAliasInit() ;we'll do it on init too just in case
;only lock the door if we're doing a vault-based alt-start or quick-start, to force the player to go to the terminal
	if pSMU_VaultStart.GetValueInt() > 0 && pSMU_FollowedVanillaPath.GetValueInt() < 2 ;0=alt start, 1=quick start, 2=vanilla start
		Self.GetRef().Lock()
		Self.GetRef().SetLockLevel(253)
		gotoState("normaloperation")
	endif 
EndEvent

EndSTATE

STATE normaloperation

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		If Self.GetRef().IsLocked() == True && p007_PlayerDoorTerminal.IsPlaying() == False
			p007_PlayerDoorTerminal.Start()
		EndIf
	EndIf
EndEvent

EndSTATE
