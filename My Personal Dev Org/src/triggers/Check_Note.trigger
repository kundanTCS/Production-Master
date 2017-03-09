/*This Trigger checks only System Administrator has rights to delete notes*/
trigger Check_Note on Note (before update, before delete) {

Note[] newNote=Trigger.new; 
Note[] oldNote=Trigger.old;
integer flag=0;
try
{

    
    if(trigger.isDelete)
    {
   
     UserRole manager=[select Id,name,ParentRoleId from UserRole where Id=:userinfo.getUserRoleId()];
		
       
       if( manager.name=='Data Administrator')
       {
       		flag=1;
       }	
       	if(flag==0)
       	{  	
       		oldNote[0].addError('You dont have permission to delete this note');	
        }       	
    }	 	     
}

catch(Exception e)
{
System.debug('Following exception occurred : ' + e );
	
}

}