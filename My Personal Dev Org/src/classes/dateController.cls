public class dateController 
{

    public String qryParam { get {return qryParam ;} set{ qryParam = value ;} }        
    public String qryParam1 { get {return qryParam1 ;} set{ qryParam1 = value ;} }        
    
    public PageReference query() {
              
     
      String qryString  = 'Select Id, CreatedDate from Account where CreatedDate > '+ qryParam + 'T00:00:00.000Z and CreatedDate < '+ qryParam1 + 'T00:00:00.000Z' ;  
    
      List<sObject> li = Database.query(qryString) ;   
      
             
      for(integer i=0; i<li.size(); i++)
      {
          system.debug('Kundan.............'+li[i]);  
      }
         
        return null;
    } 


}