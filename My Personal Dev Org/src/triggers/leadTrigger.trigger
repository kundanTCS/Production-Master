trigger leadTrigger on Lead (before insert) 
{

    for(Lead l: Trigger.new)
    {
             
        Lead [] ll = [Select Id, Email from lead ];    

        for( Lead le : ll)
        {
           if(le.email == l.email)
           {
             l.adderror('Please use other Email ID...Lead already exist');
             
           }  
        }
                
    }

}