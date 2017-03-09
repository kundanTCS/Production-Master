global class MyWebService 
{
   //Define an object in apex that is exposed in apex web service
   global class accWrap
   {
      webservice String name;
      webservice String AccNo;
   }

   webservice static Id createAccount(accWrap acc) 
   {
       Account acct = new Account();
       acct.Name = acc.name;
       acct.SmartCharts__Acc_NO__c = acc.AccNo;
       insert acct;
       return acct.Id;
  }
}