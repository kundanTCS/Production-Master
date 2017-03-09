/*This class is associated with DbMarketing Page*/

public class dbMarketing
{
    private List<Marketing_Review__c> accounts;
    private List<Marketing_Review__c> pageAccounts;
    private Integer pageNumber;
    private Integer pageSize;
    private Integer totalPageNumber;
    public String listValue { get {return listValue;} set{ listValue = value ;} }        
   
   /*  DB Marketing Constructor to initialize values*/ 
    public dbMarketing() 
        {
            listValue='Open';
            pageNumber = 0;
            totalPageNumber = 0;
            pageSize = 10;
            ViewData();
        }
        
        List<Marketing_Review__c> revlist;
        List<Marketing_Review__c> revlist1;
        List<Marketing_Review__c> revlist2;
        
 
 /* This method populates List values for View */       
        public List<SelectOption> getList()
        {    
            system.debug('Entered getList');
            List<SelectOption> rev= new List<SelectOption>();
    
            rev.add(new SelectOption('Open','All Open Reviews'));
            rev.add(new SelectOption('Closed','All Closed Reviews'));
            system.debug('ListValue:'+rev);                        
            return rev;
        }

/*This method returns List of Marketing Review Records */
        public List<Marketing_Review__c> getRevobjects() 
        {   
                User user_id=[select Id from User where Id=:userinfo.getUserId() limit 1 ];
                system.debug('Entered Revobjects............................................'+listValue);
          
        
                if(listValue == 'Open')
                { 
                      system.debug('Entered RevObject Open'); 
                      UserRole manager=[select Id,Name,ParentRoleId from UserRole where Id=:userinfo.getUserRoleId()];
              
          
                      if(manager.Name=='Data Administrator')
                      {
                            revlist = [select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where createdById=:user_id.Id and (status__c='New' OR status__c='Active') order by LastModifiedDate desc];
                      }
     
                      else 
                      { 
                          String manager_role=[select Id,Name from UserRole where Id=:manager.ParentRoleId].Name;
                          if(manager_role=='Compliance Officer')  
                          {  
                               revlist = [select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where createdById=:user_id.Id and (status__c='New' OR status__c='Active') order by LastModifiedDate desc];
          					   List<ID> createdMR=new List<ID>();	
          					    for(integer i=0;i<revlist.size();i++)
                               {
                                   createdMR.add(revlist.get(i).id);
                               }
                               revlist2= [select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where (Creator_Of_Document__c=:user_id.Id or Owner_Of_Document__c=:user_id.Id) and (status__c='New' OR status__c='Active') and Id not in:createdMR order by LastModifiedDate desc];
                               revlist.addAll(revlist2);
                               createdMR.clear();
                                for(integer i=0;i<revlist.size();i++)
                               {
                                   createdMR.add(revlist.get(i).id);
                               }
                               
                               Task[] t=[Select t.WhatId, t.OwnerId From Task t where t.OwnerId=:user_id.Id];
                               List<ID> what_ids= new List<ID>();
                                for(integer i=0;i<t.size();i++)
                                {
                                    what_ids.add(t[i].WhatId);
                                }
                               revlist1=[select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where Id in : what_ids and Id not in:createdMR and (status__c='New' OR status__c='Active') order by LastModifiedDate desc]; 
                               revlist.addAll(revlist1);
                               revlist = sortList(revlist);
                                
                                              
                          }
          
                           else if(manager.Name=='Marketing Material Reviewer' || manager.Name=='Marketing Material Publisher')
                          {
                                Task[] t=[Select t.WhatId, t.OwnerId From Task t where t.OwnerId=:user_id.Id];
                                List<ID> what_ids= new List<ID>();
                                for(integer i=0;i<t.size();i++)
                                {
                                    what_ids.add(t[i].WhatId);
                                }
                                revlist=[select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where Id in : what_ids and (status__c='New' OR status__c='Active') order by LastModifiedDate desc];
                          }
                          else
                          {
                                revlist = [select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where (Creator_Of_Document__c=:user_id.Id or Owner_Of_Document__c=:user_id.Id) and (status__c='New' OR status__c='Active') order by LastModifiedDate desc];
                                Task[] t=[Select t.WhatId, t.OwnerId From Task t where t.OwnerId=:user_id.Id];
                                List<ID> what_ids= new List<ID>();
                                 List<ID> MRIds= new List<ID>();
        
                                for(integer i=0;i<t.size();i++)
                                {
                                    what_ids.add(t[i].WhatId);
                                }
                                 for(integer i=0;i<revlist.size();i++)
                               {
                                   MRIds.add(revlist.get(i).id);
                               }
                                revlist1=[select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where Id in : what_ids and Id not in:MRIds and (status__c='New' OR status__c='Active') order by LastModifiedDate desc]; 
                                revlist.addAll(revlist1);
                                revlist = sortList(revlist);
                            }
          
                       }
        
                }
                else if(listValue == 'Closed')
                {
                    system.debug('Entered RevObject Closed');
                    UserRole manager=[select Id,Name,ParentRoleId from UserRole where Id=:userinfo.getUserRoleId()];
          
                    if(manager.Name=='Data Administrator')
                    {
                         revlist = [select id,Document_Number__c, Name, Status__C,CreatedById,LastModifiedById,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where createdById=:user_id.Id and status__c='Closed' order by LastModifiedDate desc];
        
                    }
         
                    else 
                    { 
                          String manager_role=[select Id,Name from UserRole where Id=:manager.ParentRoleId].Name;
                          if(manager_role=='Compliance Officer')  
                          {  
                              revlist = [select id, Name,Document_Number__c, Status__C,CreatedById,LastModifiedById,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where createdById=:user_id.Id and status__c='Closed' order by LastModifiedDate desc];
     						   List<ID> createdMR=new List<ID>();	
          					    for(integer i=0;i<revlist.size();i++)
                               {
                                   createdMR.add(revlist.get(i).id);
                               }
                               revlist2= [select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where (Creator_Of_Document__c=:user_id.Id or Owner_Of_Document__c=:user_id.Id) and status__c='Closed' and Id not in:createdMR order by LastModifiedDate desc];
                               revlist.addAll(revlist2);
                               createdMR.clear();
                                for(integer i=0;i<revlist.size();i++)
                               {
                                   createdMR.add(revlist.get(i).id);
                               }
                               
                               Task[] t=[Select t.WhatId, t.OwnerId From Task t where t.OwnerId=:user_id.Id];
                               List<ID> what_ids= new List<ID>();
                                for(integer i=0;i<t.size();i++)
                                {
                                    what_ids.add(t[i].WhatId);
                                }
                               revlist1=[select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where Id in : what_ids and Id not in:createdMR and status__c='Closed' order by LastModifiedDate desc]; 
                               revlist.addAll(revlist1);
                               revlist = sortList(revlist);	
                               
                          }
          
                         else  if(manager.Name=='Marketing Material Reviewer'|| manager.Name=='Marketing Material Publisher')
                          {
                                Task[] t=[Select t.WhatId, t.OwnerId From Task t where t.OwnerId=:user_id.Id];
                                List<ID> what_ids= new List<ID>();
                                for(integer i=0;i<t.size();i++)
                                {
                                    what_ids.add(t[i].WhatId);
                                }
            
                                revlist=[select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where Id in : what_ids and status__c='Closed' order by LastModifiedDate desc];
                
                         }
          
                         else
                         {
                               revlist = [select id, Name,Document_Number__c, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where (Creator_Of_Document__c=:user_id.Id or Owner_Of_Document__c=:user_id.Id) and status__c='Closed' order by LastModifiedDate desc];
                               Task[] t=[Select t.WhatId, t.OwnerId From Task t where t.OwnerId=:user_id.Id];
                               List<ID> what_ids= new List<ID>();
                               List<ID> MRIds= new List<ID>();
                               for(integer i=0;i<t.size();i++)
                               {
                                   what_ids.add(t[i].WhatId);
                               }
                               for(integer i=0;i<revlist.size();i++)
                               {
                                   MRIds.add(revlist.get(i).id);
                               }
                               
                               revlist1=[select id,Document_Number__c, Name, Status__C, CreatedById, LastModifiedById ,CreatedBy.Name, LastModifiedBy.Name, Approval_status__c, LastModifiedDate,Owner_Of_Document__c, Owner_Of_Document__r.Name ,OwnerId,Owner.LastName from Marketing_Review__c where Id in : what_ids and Id not in:MRIds and (status__c='Closed') order by LastModifiedDate desc]; 
                               revlist.addAll(revlist1);
                               revlist = sortList(revlist);
                         
                         }
          
                    }
                }
                return revlist;
        }

/*This method sorts the List on basis of Lastmodified date*/
        public List<Marketing_Review__c> sortList( List<Marketing_Review__c> listname)
        {
        
            integer len = listname.size() - 1;
            Marketing_Review__c temp;

            for(integer a=0; a<len; ++a)
            {
                for(integer b=0; b<len; ++b)
                {
                    if(listname[b].LastModifiedDate < listname[b+1].LastModifiedDate)
                    {
                        temp = listname[b];
                        listname[b] = listname[b+1];
                        listname[b+1] = temp;                   
                    }
                }
            }
        
            return listname;
         }

    public Integer getPageNumber()
    {
        return pageNumber; 
    }


    public List<Marketing_Review__c> getAccounts()
    {
        return pageAccounts;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public Boolean getPreviousButtonEnabled()
    {
        return !(pageNumber > 1);
    }

    public Boolean getNextButtonDisabled()
    {
        if (accounts == null) return true;
        else
                return ((pageNumber * pageSize) >= accounts.size());
    }


    public Integer getTotalPageNumber()
    {
        if (totalPageNumber == 0 && accounts !=null)
        {
            totalPageNumber = accounts.size() / pageSize;
            Integer mod = accounts.size() - (totalPageNumber * pageSize);
            if (mod > 0)
                totalPageNumber++;
        }


        return totalPageNumber;
    }


    public PageReference ViewData()
    { 
        accounts = getRevobjects();
        totalPageNumber = 0;
        BindData(1);
        return null;
    }
    
    private void BindData(Integer newPageIndex)
    {
        try
        {
            pageAccounts = new List<Marketing_Review__c>();
            
            Transient Integer counter = 0;
            Transient Integer min = 0;
            Transient Integer max = 0;
    
            if (newPageIndex > pageNumber)
            {
                min = pageNumber * pageSize;
                max = newPageIndex * pageSize;
            }
            else
            {
                max = newPageIndex * pageSize;
                min = max - pageSize;
             
            }
    
            for(Marketing_Review__c a : accounts)
            {
                counter++;
                if (counter > min && counter <= max) 
                        pageAccounts.add(a);
            }
    
            pageNumber = newPageIndex;
    
            if (pageAccounts == null || pageAccounts.size() <= 0)
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Data not available for this view.'));
    
        }
        catch(Exception ex)
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,ex.getMessage()));
        }
    
    }


    public PageReference nextBtnClick() 
    {
        BindData(pageNumber + 1);
        return null;
    }
    
    public PageReference previousBtnClick() 
    {
        BindData(pageNumber - 1);
        return null;
    }

  /*This method returns Page Reference of New Marketing Review Record*/      
        public PageReference newButton() 
        {
            system.debug('Entered NewButton');
            Schema.DescribeSObjectResult D = Marketing_Review__c.sObjectType.getDescribe();
			String keyvalue=D.getKeyPrefix();
            
            PageReference acctPage = new PageReference('/'+keyvalue+'/e');

            acctPage.setRedirect(true);
            return acctPage;

        }


/*This method checks the Role of logged in user to determine if he can create
New Marketing Review Record*/
        public boolean getNew()
        {
             system.debug('Entered getNew');
             UserRole manager=[select Id,Name,ParentRoleId from UserRole where Id=:userinfo.getUserRoleId()];
      
              if(manager.ParentRoleId==null)
              {
                   return true;
              }
              else 
              {
                   String manager_role=[select Id,Name from UserRole where Id=:manager.ParentRoleId].Name;
      
                   if(manager_role=='Compliance Officer')
                   {
                      return true;
                   }
      
                   else
                   {
                      return false;
                   }
    
              }     
        }

}