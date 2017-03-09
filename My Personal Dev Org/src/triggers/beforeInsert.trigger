trigger beforeInsert on Task (before insert) 
{

    Account acc = new Account();
    
    for(Integer i=0;i<15;i++)
    {
        acc = [select id, name from account where name=:'Test Jul14'];
    }

}