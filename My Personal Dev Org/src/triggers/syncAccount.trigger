trigger syncAccount on Contact (before insert) 
{
    Set<ID> ConID = new Set<ID>();
    for(Contact c : Trigger.new)
    {
            ConID.add(c.AccountID);
    }
    
    If(ConID != NULL)
    {
        Map<Id, Account> accountMap = new Map<Id, Account>([select Id,Reported_to_country__C from Account where Id in: ConID]);                            
        for(Contact c : Trigger.new)
        {
            c.Reported_to_country__C = accountMap.get(c.AccountID).Reported_to_country__C;
        }
         
   }           
   
}