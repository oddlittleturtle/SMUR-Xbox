Scriptname StartMeUp:SMU_Vault111ExtVaultDoorTriggerScript extends ObjectReference 


Event onTriggerEnter(ObjectReference akActionRef)

	ObjectReference Link = Self.GetLinkedRef()

	if akActionRef == Game.GetPlayer() && SMU_FollowedVanillaPath.GetValueInt() == 0 && SMU_VaultStart.GetValueInt() == 0

		Link.PlayAnimation("stage5")

		Utility.Wait(10.0)
		
		SMU_Quest.SetObjectiveCompleted(10, 1)
		SMU_Quest.SetObjectiveDisplayed(20, 1)
		
		Self.Disable()

	elseif akActionRef == Game.GetPlayer() && SMU_FollowedVanillaPath.GetValueInt() > 0 && SMU_VaultStart.GetValueInt() > 0
	
		Self.Disable()
		
	endif
	
EndEvent




GlobalVariable Property SMU_VaultStart Auto

GlobalVariable Property SMU_FollowedVanillaPath Auto

Quest Property SMU_Quest Auto Const
