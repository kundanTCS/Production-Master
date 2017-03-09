trigger isPrimaryTrigger on opportunity (before insert) 
{
    Opportunity[] opps = Trigger.New;
    for(Opportunity opp:opps)
    {
      if(opp.isPrimary__c == 'Yes')
      {
     
      if(opp.AccountId!= null)
      {
     
        Opportunity[] ops = [select id, isPrimary__c from Opportunity where id!=: opp.id AND AccountId =: opp.AccountId ];
         
         for(Opportunity o:ops)
          {
             o.isPrimary__c = 'No';
             Update o; 
          }
      }
     }
       
    }
}