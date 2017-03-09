/*This Trigger populates the field Creator and Owner 
 of Document if left blank */
 
trigger CheckOwner on Marketing_Review__c (before insert,before update)
{
   Marketing_Review__c[] newMR = trigger.new;
      
    try
    {
      if(newMR[0].Creator_Of_Document__c==null)
      {
          newMR[0].Creator_Of_Document__c = userinfo.getUserId();
      }
      
      if(newMR[0].Owner_Of_Document__c==null)
      {
          newMR[0].Owner_Of_Document__c=newMR[0].Creator_Of_Document__c;
      }
      
    }
    catch(Exception e)
    {
        System.debug('Following exception occurred : ' + e );
    }
}