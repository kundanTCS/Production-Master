public class TestController
{
	public string out
	{
               Get{
                   If(out == null)   	return 'getter';
	           return out;						
                      }
	Set;
}

public TestController()
{
	out = 'constructor';
}

Public void setout(){
	out = 'action';
	}
}