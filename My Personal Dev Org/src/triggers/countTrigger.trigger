trigger countTrigger on Contact(after insert) 
{
    Set<ID> AccID = new Set<ID>();
    for(Contact c : Trigger.new)
    {
        AccID.add(c.AccountID);
    }
    Account[] acc = [select Id,No_of_Contacts__c from Account where Id in: AccID];
    if(acc!=null)
    {
        for(Integer i=0;i<acc.size();i++)
        {
             acc[i].No_of_Contacts__c = acc[i].No_of_Contacts__c + 1;
        }
        try
        {
            update acc;
        }
        catch(DmlException ex)
        {
            system.debug(ex.getMessage());
        }
    }

}