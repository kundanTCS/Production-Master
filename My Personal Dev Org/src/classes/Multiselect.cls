public class Multiselect
{
	
	public String[] countries {get; set;}
	public String[] countries1 {get; set;}
	public List<String> sList {get;set;}
	public Set<String> s1List {get;set;}
	public List<String> oList {get;set;}
	public Set<String> o1List {get;set;}
	public List<String> originalList {get;set;}
	public boolean flag {get;set;}
	
	public Multiselect() 
	{
		flag = false;
		countries = new String[]{};
		countries1 = new String[]{};
		sList = new List<String>();
		s1List = new Set<String>();
		oList = new List<String>();
		o1List = new Set<String>();		
		originalList = new List<String>();
		originalList.add('US');
		originalList.add('UK');
		originalList.add('INDIA');
		originalList.add('France');
		originalList.add('Germany');
		
		for(Integer i=0; i<originalList.size();i++)
		{
			oList.add(originalList[i]);
		}			
		
	}
	
	public PageReference add() 
	{
        if(countries.size()== 0)
        {   
			flag = true;
	        ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Please select atleast one option to ADD');
	        ApexPages.addMessage(errorMsg);
	        return null;                    
        }		
		
		for(Integer i=0; i<countries.size();i++)
		{
			sList.add(countries[i]);
		}
	

		// for removing from original list
		o1List.clear(); 
		for(Integer i=0; i<countries.size();i++)
		{
			o1List.clear(); 
			for(Integer j=0;j<oList.size();j++)
			{		
					
				if(oList.get(j)!=countries[i])
				{
					if(!(o1List.contains(oList[j])))
					{
						o1List.add(oList[j]);
			    	}
				}
			}
			oList.clear();
			oList.addAll(o1List);
		}
		oList.clear();
		oList.addAll(o1List);
		return null;
	}	
	
	public PageReference remove() 
	{
		system.debug('Kundan ############## remove Error Message '+countries.size());
        if(countries1.size()== 0)
        {   
			flag = true;      	
        	ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Please select atleast one option to Remove');
			ApexPages.addMessage(errorMsg);
			return null;                    
        }		
        
		for(Integer i=0; i<countries1.size();i++)
		{
			oList.add(countries1[i]);
		}
		
		s1List.clear(); 
		for(Integer i=0; i<countries1.size();i++)
		{
			s1List.clear(); 
			for(Integer j=0;j<sList.size();j++)
			{		
				if(sList.get(j)!=countries1[i])
				{
					if(!(s1List.contains(sList[j])))
					{
						s1List.add(sList[j]);
					}	
				}
			}
			sList.clear();
			sList.addAll(s1List);	
		}
		sList.clear();
		sList.addAll(s1List);
		return null;
	}		
	
	public List<SelectOption> getItems() 
	{
		List<SelectOption> options = new List<SelectOption>();
		for(Integer i=0; i<oList.size();i++)
		{
			options.add(new SelectOption(oList[i],oList[i]));
		}
		return options;
	}  
	
	public List<SelectOption> getItems1() 
	{
		List<SelectOption> options1 = new List<SelectOption>();
		for(Integer i=0; i<sList.size();i++)
		{
			options1.add(new SelectOption(sList[i],sList[i]));
		}
		return options1;
	}  	
}