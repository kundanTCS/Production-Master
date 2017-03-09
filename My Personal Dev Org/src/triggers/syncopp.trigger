trigger syncopp on opportunity (before insert) 
{
    Set<ID> oppID = new Set<ID>();
    for(opportunity opp : Trigger.new)
    {
            oppID.add(opp.AccountID);
    }
    
    If(oppID != NULL)
    {
        Map<Id, Account> accountMap = new Map<Id, Account>([select Id,Reported_to_country__C from Account where Id in: oppID]);                            
        for(opportunity opp : Trigger.new)
        {
            opp.Reported_to_country__C = accountMap.get(opp.AccountID).Reported_to_country__C;
            
            if((accountMap.get(opp.AccountID).Reported_to_country__C == 'India') || (accountMap.get(opp.AccountID).Reported_to_country__C == 'Japan'))
                        opp.Domain__C = 'Asia';
                             
        }
         
   }           
}