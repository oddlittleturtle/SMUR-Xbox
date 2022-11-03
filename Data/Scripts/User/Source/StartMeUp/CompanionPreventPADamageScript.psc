Scriptname StartMeUp:CompanionPreventPADamageScript extends Actor Const
{CompanionPowerArmorKeywordScript but with additional keyword to prevent damage}

Group Companion_Keywords
	Keyword Property PowerArmorPreventArmorDamageKeyword Auto Const Mandatory
	{prevents power armor damage}
	Keyword Property pAttachPassenger Auto Const
	Keyword Property pAttachSlot2 Auto Const
	Keyword Property isPowerArmorFrame Auto Const
EndGroup

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)

	debug.trace("Putting on power armor")

	if akBaseObject.HasKeyword(isPowerArmorFrame) == 1
		debug.trace("Swapping vertibird seat keywords")		
		RemoveKeyword(pAttachPassenger)
		AddKeyword(pAttachSlot2)
		debug.trace("Swapping Power Armor Damage keywords")
		AddKeyword(PowerArmorPreventArmorDamageKeyword)
	endif

endEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)

	if akBaseObject.HasKeyword(isPowerArmorFrame) == 1
		debug.trace("Swapping vertibird seat keywords back")		
		RemoveKeyword(pAttachSlot2)
		AddKeyword(pAttachPassenger)
		debug.trace("Swapping Power Armor Damage Keyword")
		RemoveKeyword(PowerArmorPreventArmorDamageKeyword)
	endif

endEvent
