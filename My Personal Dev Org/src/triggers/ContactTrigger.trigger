Trigger ContactTrigger on Contact (Before insert,before update)
{
    for(contact c:trigger.new)
    {
    c.duedate__c=c.createddate+2;
    }
}