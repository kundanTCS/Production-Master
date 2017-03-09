public class sampleCon
{
    String[] countries = new String[]{};
    public String s1 {get;set;} 
    public PageReference test() 
    {
    	s1 = countries[0];
        return null;
    }
    
    public List<SelectOption> getItems() 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('US','US'));
        options.add(new SelectOption('CANADA','Canada'));
        options.add(new SelectOption('MEXICO','Mexico'));
        return options;
    }
    public String[] getCountries() 
    {
        return countries;
    }
    public void setCountries(String[] countries) 
    {
        this.countries = countries;
    }
}