Scriptname StartMeUp:SMU_RaiderHandlerScript extends Quest
{Holds Raider information. Re-written from SMU_RaidersScript and SMU_Raiders2Script}


Group StartMeUp_Manager
	StartMeUp:StartMeUpManagerScript property SMU_Manager auto const mandatory
	{Managing Script}
EndGroup

Group Misc_Properties
	RefCollectionAlias property Raiders auto const mandatory
	{Raider Collection Alias}

	GlobalVariable property SMU_StartPoint Auto Const mandatory
	{Roadside pines: 5, other raider group: 4, Set by player in menu}
EndGroup

Group Faction_Properties
	Faction Property RaiderFaction Auto Const mandatory
	{faction they're already a part of}

	Faction Property SMU_RaiderFaction Auto Const mandatory
	{temporary faction}

	Faction Property PlayerFaction Auto Const mandatory
	{player}
EndGroup

Function UpdateRaiders()
	Actor Player = Game.GetPlayer() as Actor
	;add player to temporary faction
	Player.AddToFaction(SMU_RaiderFaction)

	;make sure they're allies
	SMU_RaiderFaction.SetAlly(SMU_RaiderFaction)
	SMU_RaiderFaction.SetAlly(RaiderFaction)

	Actor Raider
	int i = 0
	while (i < Raiders.GetCount())
		Raider = Raiders.GetAt(i) as Actor
		if (Raider != None) 
			if (!Raider.IsDead())
			
				; stop any combat behavior
				; make them passive
				Raider.SetValue(Game.GetAggressionAV(),0)
				Raider.StopCombatAlarm()
				Raider.StopCombat()
				
				;add them to the temporary faction
				Raider.AddToFaction(SMU_RaiderFaction)
				
				; give 'em a push
				Raider.EvaluatePackage()
				
				;/ -- boo-booed
				;register for any hits
				; uses same script, we're just double-checking which start the player has chosen
				if SMU_StartPoint.GetValueInt(4)
					; Raider Group, location: 3, val 4
					debug.trace("Player started at Location 3")
					(Raiders as StartMeUp:SMU_RoughRaidersScript).RegisterForHitEvents(Raider)
				elseif SMU_StartPoint.GetValueInt(5)
					;roadside pines motel, location 24, val 5
					debug.trace("Player started at Roadside Pines Motel")
					(Raiders as StartMeUp:SMU_RoughRaidersScript).RegisterForHitEvents(Raider)
				endif
				/;
			endif
		endif
	i += 1
	endwhile
EndFunction

Function CleanUpFactions()
	Actor Raider
	Actor Player = Game.GetPlayer() as Actor
	;remove from the temporary faction
	Player.RemoveFromFaction(SMU_RaiderFaction)

	int i = 0
	while (i < Raiders.GetCount())
		Raider = Raiders.GetAt(i) as Actor
		if (Raider != None)
			if (!Raider.IsDead())
			
				;take them out of the temporary faction
				Raider.RemoveFromFaction(SMU_RaiderFaction)

				;i challenge thee, good sir!
				Raider.SetValue(Game.GetAggressionAV(), 2)
				
				;'tis a flesh wound!
				Raider.EvaluatePackage()
				
				;unregistering is handled on Stage 20 and Stage 40 depending on if the Boss is hit or if just a lvl raider is hit
			endif
		endif
		i += 1
	endwhile

	;reset faction hostilities
	SMU_RaiderFaction.SetEnemy(RaiderFaction)
EndFunction


bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) debugOnly
	RETURN SMU_Manager.Trace(CallingObject, asTextToPrint, aiSeverity) 
EndFunction
