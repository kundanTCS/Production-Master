public class myOpportunityExtension 
{
   private final Opportunity opp;
   private  Account acc;
   private OpportunityLineItem [] product;
   private String imageurl='/servlet/servlet.FileDownload?file=01580000000dQC8';
    public myOpportunityExtension(ApexPages.StandardController stdController) 
    {
       this.opp =  (Opportunity)stdController.getRecord();
       
    }
   public Account getAcc() 
   {
     
     acc =[Select Phone, Name, Fax, BillingCountry, BillingCity From Account where Id = :opp.AccountId];

      return acc;
   }
   
   public List<OpportunityLineItem > getProduct()
   {
      product = [Select Quantity, ListPrice, Id From OpportunityLineItem where OpportunityId = :opp.ID]; 
           return product;   
   }
   
   public String getImageurl()
   {
   return imageurl;
   }
}