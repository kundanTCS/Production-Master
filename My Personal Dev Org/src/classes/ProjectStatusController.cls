public class ProjectStatusController 
{
    public string finance {get;set;}
    public string project {get;set;}
    public string schedule{get;set;}
    public string effort{get;set;}
    public string designAndArchitecture{get;set;}
    public string customerSatisfaction{get;set;}
    public string alliance{get;set;}
    public string qa{get;set;}
                    
    public List<SelectOption> getFinanceList() 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('SelectStatus','-- Select Status --'));
        options.add(new SelectOption('Green','Green'));
        options.add(new SelectOption('Yellow','Yellow'));
        options.add(new SelectOption('Red','Red'));
        return options;
    }
    
    public List<SelectOption> getProjectList () 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('SelectProject','-- Select an active Project --'));
        options.add(new SelectOption('Project1','Project1'));
        options.add(new SelectOption('Project2','Project2'));
        options.add(new SelectOption('Project3','Project3'));
        return options;
    }    
    
    public List<SelectOption> getScheduleList () 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('SelectProject','-- Select Status--'));
        options.add(new SelectOption('Green','Green'));
        options.add(new SelectOption('Yellow','Yellow'));
        options.add(new SelectOption('Red','Red'));
        return options;
    } 


    public List<SelectOption> getEffortList () 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('SelectProject','-- Select Status--'));
        options.add(new SelectOption('Green','Green'));
        options.add(new SelectOption('Yellow','Yellow'));
        options.add(new SelectOption('Red','Red'));
        return options;
    } 

    public List<SelectOption> getDesignAndArchitectureList () 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('SelectProject','-- Select Status--'));
        options.add(new SelectOption('Green','Green'));
        options.add(new SelectOption('Yellow','Yellow'));
        options.add(new SelectOption('Red','Red'));
        return options;
    } 
       
    public List<SelectOption> getCustomerSatisfactionList () 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('SelectProject','-- Select Status--'));
        options.add(new SelectOption('Green','Green'));
        options.add(new SelectOption('Yellow','Yellow'));
        options.add(new SelectOption('Red','Red'));
        return options;
    }        
       
    public List<SelectOption> getAllianceList () 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('SelectProject','-- Select Status--'));
        options.add(new SelectOption('Green','Green'));
        options.add(new SelectOption('Yellow','Yellow'));
        options.add(new SelectOption('Red','Red'));
        return options;
    }         
    
    public List<SelectOption> getQaList () 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('SelectProject','-- Select Status--'));
        options.add(new SelectOption('Green','Green'));
        options.add(new SelectOption('Yellow','Yellow'));
        options.add(new SelectOption('Red','Red'));
        return options;
    }        
            
    public PageReference save() {
        return null;
    }



}