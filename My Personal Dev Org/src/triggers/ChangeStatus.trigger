/*This Trigger changes Status value to Active when a new Task is created*/

trigger ChangeStatus on Task (after insert)
{
    Task[] newTask = trigger.new;
    Task[] oldTask = trigger.old;
    
    try
    {
       
       Marketing_Review__c[] mrg=[select Id,Status__c from Marketing_Review__c where Id=:newTask[0].WhatId];
       
           if(mrg.size()>0)
           {
              mrg[0].Status__c= 'Active';
              mrg[0].Status_Check__c='Open';
           }
       
           update mrg;
      
    }  
    catch(Exception e)
    {
        System.debug('Following exception occurred : ' + e );
    }
}