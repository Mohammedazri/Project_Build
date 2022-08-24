trigger OuvrierTrigger on Contact (after Insert,after update) {

	if(Trigger.isAfter )
	{
		if(Trigger.isUpdate) {
			AP01_Ouvrier.envoyerEmail(trigger.new, trigger.oldMap);
		}

		if(Trigger.isInsert) {
			AP01_Ouvrier.envoyerEmail(trigger.new,trigger.oldMap);
		}

	}


}