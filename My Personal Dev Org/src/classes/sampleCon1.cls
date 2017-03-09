public class sampleCon1
{
	public String s1 {get;set;}
    public PageReference test() 
    {
		//put the logic for Test Button here
        return null;
    }
	
	public List<SelectOption> getItems() 
	{
		List<SelectOption> options = new List<SelectOption>();
			options.add(new SelectOption('Red','Red'));
			options.add(new SelectOption('Blue','Blue'));
			options.add(new SelectOption('Green','Green'));
		return options;
	}  	
	
}