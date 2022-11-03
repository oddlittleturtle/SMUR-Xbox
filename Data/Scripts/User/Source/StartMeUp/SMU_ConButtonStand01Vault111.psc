;/ Decompiled by Champollion V1.0.6
PEX format v3.9 GameID: 2
Source   : D:\Steam\steamapps\common\Fallout 4\Data\Scripts\Source\User\StartMeUp\SMU_ConButtonStand01Vault111.psc
Modified : 2017-10-25 10:03:09
Compiled : 2017-10-25 10:03:18
User     : Haswell
Computer : HASWELL-PC
/;
ScriptName StartMeUp:SMU_ConButtonStand01Vault111 extends ObjectReference

;-- Properties --------------------------------------
Group Required_Properties
	string Property Anim = "open" Auto Const
	{ Anim to play when this is activated. }
EndGroup

Quest Property pSMUQuest Auto Const
GlobalVariable Property pSMU_VaultStart Auto Const
ObjectReference Property pSMU_V111ElevatorDownTriggerREF Auto Const
Actor Property pSMU_PlayerSpouseMaleVaultREF Auto Const
Actor Property pSMU_PlayerSpouseFemaleVaultREF Auto Const
Actor Property pSMU_PlayerSpouseFemaleREF Auto Const
Actor Property pSMU_PlayerSpouseMaleREF Auto Const
ObjectReference Property pVault111ExitDoorREF02 Auto Const
ObjectReference Property pVault111ExitDoorREF01 Auto Const
ObjectReference Property pVault111BlockedDoorREF Auto Const
ReferenceAlias Property pSMU_PlayerSpouseFemaleAlias Auto Const
ReferenceAlias Property pSMU_PlayerSpouseMaleAlias Auto Const

;-- Variables ---------------------------------------

;-- State -------------------------------------------
State normalstate

	Event OnActivate(ObjectReference akActionRef)
		Self.playAnimation(Anim)
	EndEvent
EndState

;-- State -------------------------------------------
Auto State checkfornonvaultstart

	Event OnActivate(ObjectReference akActionRef)
		If (pSMU_VaultStart.GetValueInt() == 0)
			Self.playAnimation(Anim)
			pSMUQuest.SetObjectiveCompleted(20, 1 as bool)
			pSMUQuest.SetObjectiveDisplayed(25, 1 as bool, False)
			ObjectReference VaultDoor = Game.GetFormFromFile(209091, "Fallout4.ESM") as ObjectReference
			pSMU_V111ElevatorDownTriggerREF.SetLinkedRef(VaultDoor, None)
			pSMU_V111ElevatorDownTriggerREF.MoveTo(Game.GetFormFromFile(148715, "Fallout4.ESM") as ObjectReference, 0, 0, 0, True)
			pSMU_V111ElevatorDownTriggerREF.SetPosition(-5482.69, -329.424, 1612.54)
			pSMU_V111ElevatorDownTriggerREF.SetAngle(0 as float, 0 as float, 0 as float)
			(Game.GetFormFromFile(0x0AB6AF, "Fallout4.ESM") as ObjectReference).SetDestroyed(True);Vault111PipboySkeletonREF destroyed
			(Game.GetFormFromFile(0x091A49, "Fallout4.ESM") as ObjectReference).SetDestroyed(True);MQ102GearDoorConsoleREF destroyed
			(Game.GetFormFromFile(0x01ED87, "Fallout4.ESM") as ObjectReference).DisableNoWait(False);MQ102SetStage0Trigger
			(Game.GetFormFromFile(0x07B2A4, "Fallout4.ESM") as ObjectReference).DisableNoWait(False);Vault111SetStage70TriggerREF
			(Game.GetFormFromFile(0x07B2A5, "Fallout4.ESM") as ObjectReference).DisableNoWait(False);Vault111SetStage72TriggerREF
			(Game.GetFormFromFile(0x07B2A6, "Fallout4.ESM") as ObjectReference).DisableNoWait(False);Vault111SetStage74TriggerREF
			(Game.GetFormFromFile(0x02B553, "Fallout4.ESM") as ObjectReference).DisableNoWait(False);Vault111SetStage80TriggerREF
			(Game.GetFormFromFile(0x20C2C7, "Fallout4.ESM") as ObjectReference).DisableNoWait(False);TutorialSetStage100Trigger
			(Game.GetFormFromFile(0x20C2C9, "Fallout4.ESM") as ObjectReference).DisableNoWait(False);TutorialSetStage200Trigger
			(Game.GetFormFromFile(0x20C2CA, "Fallout4.ESM") as ObjectReference).DisableNoWait(False);TutorialSetStage850Trigger
			(Game.GetFormFromFile(0x01D7DB, "Fallout4.ESM") as ObjectReference).DisableNoWait(False);DialogueVault111SetStage97Trigger
			(Game.GetFormFromFile(0x01EE87, "Fallout4.ESM") as ObjectReference).DisableNoWait(False);MQ102SetStage3TriggerREF
			pVault111ExitDoorREF02.Lock(True, False)
			pVault111ExitDoorREF02.SetLockLevel(253)
			pVault111ExitDoorREF01.Lock(False, False);Unlock entrace
			pVault111ExitDoorREF01.SetOpen()
			pVault111BlockedDoorREF.BlockActivation(False, False)
			pVault111BlockedDoorREF.Lock(False, False)
			pVault111BlockedDoorREF.Setopen()
			If ((Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1)
			(Game.GetFormFromFile(0x06FA2F, "Fallout4.ESM") as ObjectReference).Enable()
			Else
			(Game.GetFormFromFile(0x06FA30, "Fallout4.ESM") as ObjectReference).Enable()
			EndIf
			If ((Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1)
			pSMU_PlayerSpouseFemaleREF.MoveTo(Game.GetFormFromFile(148715, "Fallout4.ESM") as ObjectReference, 0, 0, 0, True)
			pSMU_PlayerSpouseFemaleREF.SetPosition(-1334.8864, 1989.4142, -175.9571)
			pSMU_PlayerSpouseFemaleREF.SetAngle(0, 0, 90)
			pSMU_PlayerSpouseFemaleREF.Enable(False)
			Else
			pSMU_PlayerSpouseMaleREF.MoveTo(Game.GetFormFromFile(148715, "Fallout4.ESM") as ObjectReference, 0, 0, 0, True)
			pSMU_PlayerSpouseMaleREF.SetPosition(-1334.8864, 1989.4142, -175.9571)
			pSMU_PlayerSpouseMaleREF.SetAngle(0, 0, 90)
			pSMU_PlayerSpouseMaleREF.Enable(False)
			EndIf
			If ((Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1)
			pSMU_PlayerSpouseFemaleAlias.ForceRefTo(pSMU_PlayerSpouseFemaleREF as ObjectReference)
			Else
			pSMU_PlayerSpouseMaleAlias.ForceRefTo(pSMU_PlayerSpouseMaleREF as ObjectReference)
			EndIf
			Self.gotostate("normalstate")
		Else
			Self.playAnimation(Anim)
			Self.gotostate("normalstate")
		EndIf
	EndEvent
EndState
