public class SalesSupportCustom
{
    Task sample;
     public Task getSample() {
        return sample;
    }
    
    public void setSample(Task  sample ){
      this.sample  = sample ; 
    }
     public SalesSupportCustom(){
         sample = [select id, subject from Task  where id = :ApexPages.currentPage().getParameters().get('id')];
     }
}