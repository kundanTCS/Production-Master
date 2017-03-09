/*This Trigger checks value in Other Product Type field should be filled if 
Product Type selected is Other*/

trigger Check_Product_Type on Marketing_Review__c (before insert,before update)
{
    Marketing_Review__c[] MR=trigger.new;
    Integer Flag=0;
    
    if (MR[0].Other_Product_Type__c!=NULL)
    {
                  if(MR[0].Product_Type__c!=NULL) 
                  {
                     
                    String[] s = MR[0].Product_Type__c.split(';');                   
                    for (Integer i=0;i<s.size();i++)
                    {
                        if(s[i]=='Other')
                        flag=1;
                                                                   
                    }
                  } 
                    
                    if(flag==0)
                    {
                    MR[0].addError('You can Enter value in Other Product Type only if Product Type is Other');
                    
                    }     
    }
      
}