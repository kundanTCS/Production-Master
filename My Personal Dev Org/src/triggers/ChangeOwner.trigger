/*This Trigger is used to Assign New Marketing Review Record to MRG Queue and
Set Value of Status as New*/

trigger ChangeOwner on Marketing_Review__c (before insert)
{
   Marketing_Review__c[] newMR = trigger.new;
   String manager_role;
    
    try
    {   
      UserRole manager=[select Id,ParentRoleId from UserRole where Id=:userinfo.getUserRoleId()];
      if(manager.ParentRoleId!=null)
      {
       manager_role=[select Id,Name from UserRole where Id=:manager.ParentRoleId].Name;
      }
      
      String queue_id=[Select q.Queue.Name, q.QueueId From QueueSobject q where q.Queue.Name='Marketing Review Group'].QueueId;   
      if(manager_role=='Deutsche Bank PCS'|| manager_role=='Compliance Officer' || manager.ParentRoleId==null )
      {     	
      newMR[0].OwnerId=queue_id;
      newMR[0].Status__c='New';
      newMR[0].Status_Check__c='Open';
      }
      
    }
    catch(Exception e)
    {
        System.debug('Following exception occurred : ' + e );
    }
}