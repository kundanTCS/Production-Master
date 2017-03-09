public class ProcessInstanceController 
{
    public String processId;
    public String leadId;
    public ProcessInstance objProcessInstance;
    public Lead objLead {get; set;}
    
    public PageReference redirectPage;
    
    public ProcessInstanceController()
    {
        processId = ApexPages.currentPage().getParameters().get('id');
        System.debug(processId);
        leadId = ApexPages.currentPage().getParameters().get('leadId');
        System.debug(leadId);
        objLead = [select Name,Owner.Name,SmartCharts__Rejection_Reason_c__c,SmartCharts__Comments__c from Lead where id =:leadId];
        redirectPage = new PageReference('/'+leadId);
    }
    
    public PageReference Approve(){
        Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
        req.setComments(objLead.Comments__c);
        req.setAction('Approve');
        req.setWorkitemId(processId);
        Approval.ProcessResult result =  Approval.process(req);
        update objLead;
        return redirectPage ;
    }
    
    public PageReference Reject(){
        Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
        req.setComments(objLead.Comments__c);
        req.setAction('Reject');
        req.setWorkitemId(processId);
        Approval.ProcessResult result =  Approval.process(req);
        update objLead;
        return redirectPage ;       
    }
    
     public PageReference Cancel(){
     return redirectPage ;
    }
   
}