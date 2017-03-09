trigger Approval on Marketing_Review__c (before insert, before update)
{
    Marketing_Review__c[] MR = trigger.new;
    Marketing_Review__c[] OldMR = trigger.old;
    integer flag=0;
       
    try
    {

/*Approval Status Field is used as a display columns in Views*/
     if(MR[0].Status__c == 'New')
     {
          MR[0].Approval_status__c = 'New';
     }
     if(MR[0].Status__c == 'Active')
     {
          MR[0].Approval_status__c = 'Active';
     }
     
     
/*To check Approved,Rejected and Closed Checkboxes are mutually exclusive*/     
     if(MR[0].Approved__c == true)
     {
          if((MR[0].Rejected__c == true) || (MR[0].Closed__c == true)||(MR[0].Reviewed__c == true)) 
          MR[0].adderror('You can\'t select multiple options from Approved/Rejeced/Closed/Reviewed');
          MR[0].Approval_status__c = 'S.24 Approved';
     }
     
     if(MR[0].Rejected__c == true)
     {
          if((MR[0].Approved__c == true) || (MR[0].Closed__c == true)||(MR[0].Reviewed__c==true)) 
          MR[0].adderror('You can\'t select multiple options from Approved/Rejeced/Closed/Reviewed');
          MR[0].Approval_status__c = 'Rejected';
     }
     
     if(MR[0].Closed__c == true)
     {   
          if((MR[0].Rejected__c == true) || (MR[0].Approved__c == true)|| (MR[0].Reviewed__c == true)) 
          MR[0].adderror('You can\'t select multiple options from Approved/Rejeced/Closed/Reviewed');
          MR[0].Approval_status__c = 'Closed';
     }  
     
     if(MR[0].Reviewed__c == true)
     {
          if((MR[0].Rejected__c == true) || (MR[0].Approved__c == true)|| (MR[0].Closed__c == true)) 
          MR[0].adderror('You can\'t select multiple options from Approved/Rejeced/Closed/Reviewed');
          MR[0].Approval_status__c = 'Reviewed';
     }                
    
   
 /*If Trigger is fired on Update Action*/
      if(Trigger.isUpdate)
     { 
     
        UserRole user=[select Id,Name from UserRole where Id=:userinfo.getUserRoleId()];
        
  /*If record is Approved,Rejected or Closed Status should be set to closed*/        
     if(MR[0].Approved__c == true || MR[0].Rejected__c == true || MR[0].Closed__c == true || MR[0].Reviewed__c == true)
       {
       
        MR[0].Status__c = 'Closed';
        MR[0].Status_Check__c='Closed';
        system.debug('entered update');
        MR[0].Case_Closed_Date__c = MR[0].LastModifiedDate;
        
        system.debug('Kundan...........................'+datetime.valueOf('' + '-' + ''+ '-' + '' + ' ' + '' + ':' +'' + ':' + ''));
       }
       
/*If MRG reopens the Record status is set to Active*/
       if(user.Name =='Data Administrator' || user.Name=='MRG' )
       {
              
            if((MR[0].Approved__c== false) && (MR[0].Rejected__c == false) && (MR[0].Closed__c == false)&& (MR[0].Reviewed__c == false))
           {
               MR[0].Status__c = 'Active';
               MR[0].Status_Check__c='Open';
               MR[0].Case_Closed_Date__c =null;
           }
                                
       flag=1;
       }
       
      
      if((flag==0)&&((OldMR[0].Approved__c== true) || (oldMR[0].Rejected__c == true) || (oldMR[0].Closed__c == true) || (oldMR[0].Reviewed__c ==true)))
       {       
       MR[0].adderror('You dont have permission to SAVE this Record');
       
       }
       
       
       
    } 
    
   } 
    catch(Exception e)
    {
        System.debug('Following exception occurred : ' + e );
    }
}