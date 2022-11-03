Scriptname StartMeUp:SMU_RoughRaidersScript extends RefCollectionAlias Hidden Const
{Script on Raiders at Roadside Pines Motel and Northwest of Sanctuary. This script handles the combat behavior of the Raiders there. They are unaggressive and ignore combat unless the player attacks them.}

ActorValue property Aggression Auto Const Mandatory
{The Aggression AV.}

StartMeUp:SMU_RaiderHandlerScript property SMU_Raiders Auto Const Mandatory
{Script that holds the quest functions}

Function RegisterRaidersForHitEvents()
	int i = 0
	while (i < Self.GetCount())
		RegisterForHitEvent(Self.GetAt(i))
		i += 1
	endwhile
EndFunction

Function UnregisterRaidersForHitEvents()
	int i = 0
	while (i < self.GetCount())
		(self.GetAt(i)).UnregisterForAllHitEvents()
		i += 1
	endwhile
EndFunction

Function RegisterForHitEvents(ObjectReference akSenderRef)
	;Register for hit events if not unconscious and not already aggressive.
	Actor Raider = akSenderRef as Actor
	StartMeUp:StartMeUpManagerScript SMU_Manager = StartMeUp:StartMeUpManagerScript.GetScript()
	if ((Raider.GetValue(Aggression) == 0) && (!Raider.IsDead()))
		SMU_Manager.Trace(self, "Start Me Up: " + Raider + " registered for Hit")
		Raider.UnregisterForAllHitEvents()
		Raider.RegisterForHitEvent(Raider)
	endif
EndFunction

;/handled elsewhere
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Actor Raider = akTarget as Actor
	Actor Player = Game.GetPlayer()
	if ((akAggressor == Player) && (Raider != None))
		  UnregisterRaidersForHitEvents()
	else
		; haven't been hit yet, re-register
		RegisterForHitEvents(Raider)
	endif
EndEvent

Event OnDeath(ObjectReference akSenderRef, Actor akKiller)
	; for oneshot kills - aggro everyone
	Actor Player = Game.GetPlayer()
	if (akKiller == Player)
		;UnregisterRaidersForHitEvents()
	endif
EndEvent
/;

Event OnUnload(ObjectReference akSender)
    RemoveRef(akSender)
	akSender.disable()
    akSender.delete()
	GetOwningQuest().SetStage(200)
EndEvent