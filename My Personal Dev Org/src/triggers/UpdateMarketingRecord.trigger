/*This Trigger updates the Last Modified Date and Time of Marketing Review Record on updating a Task*/
trigger UpdateMarketingRecord on Task (after update)
{
    Task[] newTask = trigger.new;
    Task[] oldTask = trigger.old;
    
    try
    {
       
       Marketing_Review__c MR=[select Id from Marketing_Review__c where Id=:newTask[0].WhatId];
       update MR;   
    }
    catch(Exception e)
    {
        System.debug('Following exception occurred : ' + e );
    }
}