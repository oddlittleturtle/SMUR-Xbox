Scriptname StartMeUp:SMU_PlayerOnLoadScript extends ReferenceAlias

SMU_SMUQuestScript Property QuestScript Auto

event OnPlayerLoadGame() 
	QuestScript.AddItemsToFormlists()
endEvent
