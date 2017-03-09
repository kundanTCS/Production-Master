trigger recordTypeTrigger on Account (before insert) 
 {
   for(Account acc:Trigger.new)
   {
        RecordType rec = [Select Id From RecordType where Name = 'Internal to TCS'];
        system.debug('Kundan  ' + rec);
        if (acc.RecordTypeId == rec.Id)
        {
            acc.Fax= '223120';
            acc.Phone='243434';
            acc.BillingState='Maharashtra';
            acc.BillingCountry='INDIA';
            acc.BillingCity='Mumbai';
        }
   }
 }