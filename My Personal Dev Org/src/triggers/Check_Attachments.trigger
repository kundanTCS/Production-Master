/*This trigger checks only System Administrator has rights to delete Attachments*/

trigger Check_Attachments on Attachment (before update,before delete) {

Attachment[] newAttachment=Trigger.new; 
Attachment[] oldAttachment=Trigger.old; 
integer flag=0;

try
{   
    if(trigger.isDelete)
    {
        
        UserRole manager=[select Id,name,ParentRoleId from UserRole where Id=:userinfo.getUserRoleId()];
        
       if(manager.name=='Data Administrator')
       {
            flag=1;
       }    
       if(flag==0)
       {
            oldAttachment[0].addError('You dont have permission to delete this record');    
       }
    }  
        
}

catch(Exception e)
{
 System.debug('Following exception occurred : ' + e );
 
}

}