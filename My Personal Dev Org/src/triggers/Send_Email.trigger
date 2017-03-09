/*This Trigger is used to send mail to Task Owner once the task is created*/

trigger Send_Email on Task (after insert) {

   Task[] newTask = trigger.new;
   
   for(integer i=0;i<newTask.size();i++)
   {
	   	if(newTask[i].Send_Email__c==true)
	   
	   {
	   	system.debug('entered Task Send Email');
	   	Id user_id=newTask[i].OwnerId;
	   	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	   	String user_email=[select Email from User where Id=:user_id].Email;
	   	String[] toAddresses=new String[]{user_email};
	    Task t1=[select t.What.Name, t.WhatId, t.Id,t.createdById,t.createdBy.Name,t.createdDate,t.ActivityDate From Task t where t.Id=:newTask[i].Id]; 
  	    
	    if(t1.WhatId!=null )
	   {
	   	Marketing_Review__c[] rec=[select Id,name from Marketing_Review__c where Id=:t1.WhatId];
	   	if(rec.size()>0)
	   	{
	    String case_owner=[select m.Owner.Name, m.OwnerId From Marketing_Review__c m where m.Id=:t1.WhatId].owner.Name; 
	    String case_number=[Select m.Document_Number__c From Marketing_Review__c m where m.Id=:t1.WhatId].Document_Number__c;
	    String document_name=t1.What.Name;
	    String createdby=t1.createdBy.Name;
	    DateTime createddate=t1.createddate;
	    Date duedate=t1.activitydate;
	    String mail_body;
	    
	    if(duedate==null)
	    { 
	     mail_body='This email has been automatically generated by the DBForce system.  Please do not reply.\n\n'+
	    'You have been assigned a Marketing Review task by '+createdby+' as of '+createddate+'\n\n'+
	    'Please access PCS DBForce tasks to view the details and complete the task.\n\n'+
	    'If you have any questions you should contact '+case_owner+' of the Marketing Review Group.';
	    }
	    
	    else
	    {
	    mail_body='This email has been automatically generated by the DBForce system.  Please do not reply.\n\n'+
	    'You have been assigned a Marketing Review task by '+createdby+' as of '+createddate+'\n\n'+
	    'The task is due by: '+duedate+ '\n'+
	    'Please access PCS DBForce tasks to view the details and complete the task.\n\n'+
	    'If you have any questions you should contact '+case_owner+' of the Marketing Review Group.';	
	    
	    }	
	    
	   	mail.setToAddresses(toAddresses);
	    system.debug('To:'+toAddresses[0]);

	    mail.setSubject('Marketing Review Task -Case No: '+case_number+' Document Name: '+document_name+' -Task Name: '+newTask[0].Subject);
	   
	    mail.setPlainTextBody(mail_body);
	    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	    
	   }   	
	   }	
	  }
	   
   }

}