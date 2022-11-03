Scriptname StartMeUp:SMU_InitQuestScript extends Quest
{Holds main functions for Start Me Up}

CustomEvent StartMeUp

Function SendStartMeUpEvent()
	SendCustomEvent("StartMeUp")
EndFunction


bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) global debugOnly
	;we are sending callingObject so we can in the future route traces to different logs based on who is calling the function
	string SMULog = "StartMeUp"
	debug.OpenUserLog(SMULog) 
	RETURN debug.TraceUser(SMULog, CallingObject + ": " + asTextToPrint, aiSeverity)
EndFunction