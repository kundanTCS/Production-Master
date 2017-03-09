public class Questionnaire
{
	public List<Sections__c> sec = new List<Sections__c>();
	public List<Question_Bank__c> que = new List<Question_Bank__c>();
	public Map<id, Sections__c> secMap = new Map<id, Sections__c>();
	public Set <id> s = new Set<id>();
	
	//constructor method    
    public Questionnaire(ApexPages.StandardController controller) 
    {
    	secMap = new Map<id, Sections__c>([select id, name, in_use__c, active__c, Questionnaire__c from Sections__c where Questionnaire__c =: 'a0980000008S0n7']);
    	s = secMap.keyset();
    	que = [select id, name, Alignment__c, inUse__c, Question__c, Select_Options__c, Type__c from Question_Bank__c where id in :s];
    	
    	system.debug('Kundan--------Section--------'+secMap);
    	system.debug('Kundan--------que--------'+que);
    	
    }
        	
	
}