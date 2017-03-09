global class wrapperClassCtrlExt{

/* **************************************************
    Method Name: searchPinData
    Input Parameters: String
    Return Type: NA
    Method Description: Method to Search Pincode using Smart Search
    ****************************************************** */ 
    @RemoteAction
    public static List<SmartCharts__Pincode__c> searchPinData(String pinsearch)
    {
       List<SmartCharts__Pincode__c> pin =  Database.query('SELECT id,Name,SmartCharts__City__c,SmartCharts__State__c, SmartCharts__Country__c FROM SmartCharts__Pincode__c where Name  like \'%' + String.escapeSingleQuotes(pinsearch) + '%\'');
       return pin;
    }

}