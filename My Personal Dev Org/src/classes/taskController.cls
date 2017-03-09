public class taskController 
{
    public List<Task> t {get; set;}
    public taskController(ApexPages.StandardController controller) 
    {
        t = new List<task>();        
        t = [select id, subject from Task where whatid =:'a0F8000000I2juJ'];    
    }

}