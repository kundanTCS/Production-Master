trigger EmailTrigger on EmailMessage (before delete) 
{
	if(Trigger.isBefore) {
		if (Trigger.isDelete) {
		// In a before delete trigger, the trigger accesses the records that will be
		// deleted with the Trigger.old list.
			for (EmailMessage a : Trigger.old) {
					a.addError('You can\'t delete this record!');
			}
		}
	}
}