public class testMethod_dbMarketing
{
    static testmethod void dbmark()
    {
              
        PageReference pageRef = Page.dbMarketing;
        Test.setCurrentPage(pageRef);      
        dbMarketing db = new dbMarketing();
        
       db.getList();
       User u=[select Id,u.UserRole.Name, u.UserRoleId, u.Profile.Name, u.ProfileId From User u where u.Profile.Name='System Administrator' and u.UserRole.Name='Data Administrator' and isActive=true limit 1]; 
    
       system.runAs(u)
       {  
          Marketing_Review__c mark1 = new Marketing_Review__c(Name='kundan1',Group_Branch__c='ATL');
          insert mark1;
          db.listValue='Open';
          List<Marketing_Review__c> MR=db.getRevObjects();
          db.listValue='Closed';
          List<Marketing_Review__c> MR1=db.getRevObjects();
          Boolean flag=db.getNew();
          
          Attachment attach=[Select Id from Attachment limit 1];   
          delete attach;
          Note note=[select Id from Note limit 1];
          delete note;
        }
        
     
       
       User u1=[select Id,u.UserRole.Name, u.UserRoleId, u.Profile.Name, u.ProfileId From User u where u.Profile.Name='Branch Management Team' and u.UserRole.Name='Atlanta Branch Management Team' and isActive=true limit 1]; 
       system.runAs(u1)
       {
          db.listValue='Open';
          List<Marketing_Review__c> MR=db.getRevObjects();
          db.listValue='Closed';
          List<Marketing_Review__c> MR1=db.getRevObjects();
          Boolean flag=db.getNew();
          Marketing_Review__c mark4 = new Marketing_Review__c(Name='kundan1',Group_Branch__c='ATL',Creator_Of_Document__c=u1.id,Product_Type__c='Other',Other_Product_Type__c='Test');
          insert mark4;      
       }     
       
    
       
       User u2=[select Id,u.UserRole.Name, u.UserRoleId, u.Profile.Name, u.ProfileId From User u where u.Profile.Name='Investment Representative' and u.UserRole.Name='Atlanta Investment Representative' and isActive=true limit 1]; 
       system.runAs(u2)
       {
          db.listValue='Open';          
          Marketing_Review__c mark = new Marketing_Review__c(Name='kundan1',Group_Branch__c='ATL',Creator_Of_Document__c=u2.id);
          insert mark;
          mark.Rejected__c=true;
          update mark;
          Task t=new Task(OwnerId=u2.Id,subject='call',status='Not Started',priority='Normal',whatId=mark.Id);
          insert t;
          List<Marketing_Review__c> MR=db.getRevObjects();
          db.listValue='Closed';
          List<Marketing_Review__c> MR1=db.getRevObjects();
          Boolean flag=db.getNew();
       }        
   
     
        User u3=[select Id,u.UserRole.Name, u.UserRoleId, u.Profile.Name, u.ProfileId From User u where u.Profile.Name='Branch Management Team' and u.UserRole.Name='Marketing Material Reviewer' and isActive=true limit 1]; 
       system.runAs(u3)
       {
          db.listValue='Open';
          
          Marketing_Review__c mark = new Marketing_Review__c(Name='kundan1',Group_Branch__c='ATL',Creator_Of_Document__c=u3.id);
          insert mark;
          Task t=new Task(whatId=mark.Id,OwnerId=u3.Id,subject='call',status='Not Started',priority='Normal');
          insert t;
          update t;
          List<Marketing_Review__c> MR=db.getRevObjects();
          db.listValue='Closed';
          List<Marketing_Review__c> MR1=db.getRevObjects();
          Boolean flag=db.getNew();
          Integer PageNumber=db.getPageNumber();
          List<Marketing_Review__c> Accountss =db.getAccounts(); 
          Integer PageSize=db.getPageSize();
          Boolean Prev=db.getPreviousButtonEnabled();
          Boolean Next=db.getNextButtonDisabled();
          Integer TotalPageNumber=db.getTotalPageNumber();
          PageReference ViewData=db.ViewData();
          PageReference nextClick=db.nextBtnClick();
          PageReference prevClick=db.previousBtnClick();
          PageReference newB=db.newButton(); 
            
       }     
       Marketing_Review__c marks = new Marketing_Review__c(Name='kundan1',Group_Branch__c='ATL');
       insert marks;
       Marketing_Review__c mark4 = new Marketing_Review__c(Name='kundan1',Group_Branch__c='ATL',Creator_Of_Document__c=u3.id,Product_Type__c='Other',Other_Product_Type__c='Test');
       insert mark4;  
     
       User u4=[select Id,u.UserRole.Name, u.UserRoleId, u.Profile.Name, u.ProfileId From User u where u.Profile.Name='MRG' and u.UserRole.Name='MRG' and isActive=true limit 1]; 
       system.runAs(u4)
       {
          db.listValue='Open';
          
        //  Marketing_Review__c mark1 = new Marketing_Review__c(Name='kundan1',Group_Branch__c='ATL',Creator_Of_Document__c=u3.id);
         // insert mark1;
          update marks;
         //  Marketing_Review__c mark2 = new Marketing_Review__c(Name='kundan1',Group_Branch__c='ATL',Creator_Of_Document__c=u3.id);
          //insert mark2;
          //Marketing_Review__c mark3 = new Marketing_Review__c(Name='kundan1',Group_Branch__c='ATL',Creator_Of_Document__c=u3.id);
          //insert mark3;
         // Marketing_Review__c mark4 = new Marketing_Review__c(Name='kundan1',Group_Branch__c='ATL',Creator_Of_Document__c=u3.id,Product_Type__c='Other',Other_Product_Type__c='Test');
         // insert mark4;        
          marks.Approved__c=true;
          update marks;
     
      
       }     


    }
 }