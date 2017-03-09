public class testMethodClass 
{
	public static boolean isRed(string color)
	{
		if(color == 'Red'){
			return true;
		}
		else{
			return false;
		}
		
	} 

@isTest
private static void myTestMethod()
{
	System.assertEquals(isRed('blue'),false);
	System.assertEquals(isRed('red'),true);
} 
	
}