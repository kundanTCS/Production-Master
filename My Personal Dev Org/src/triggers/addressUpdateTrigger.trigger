trigger addressUpdateTrigger on Account (before insert, before update) 
{
    Set<ID> acc = new Set<ID>();
    
    for(Account a : Trigger.new)
    {
            acc.add(a.ID);
    }


    for(Account accs :Trigger.new)
    {

            Contact[] con = [select Id, MailingCity, MailingState, MailingCountry from contact where accountid in :acc];
       
            for(contact c : con)
            {
              c.MailingCity = accs.BillingCity ; 
              c.MailingState = accs.BillingState;
              c.MailingCountry = accs.BillingCountry;
            }
            update con;

    }
    }