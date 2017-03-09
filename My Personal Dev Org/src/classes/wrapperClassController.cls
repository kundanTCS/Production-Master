public class wrapperClassController {

    public PageReference SaveContactData() {
        return null;
    }

 
    Contact Contact = new Contact();
//    cContact wrap = new cContact();
    
//    public list<Contact> listContact{ get; set; }
    public List<cContact> contactList {get; set;}
    
    public String pin {get;set;}
    
    public wrapperClassController ()
    {
//        listContact=new list<Contact>();
//        listContact.add(Contact);
        
        contactList= new List<cContact>();
        contactList.add(new cContact(new Contact(), pin));
    }
    
    Public void addContact()
    {
        cContact con = new cContact(new Contact(), pin);
        contactList.add(con);
    }
    
    public PageReference saveContact() 
    {
 
        system.debug('contactList after Save.......'+contactList);
        List<Contact> cList = new List<Contact>();
        for(integer i=0; i<contactList.size(); i++ )
        {
            Contact c = new Contact();
            c.firstName = contactList[i].con.firstname;
            c.LastName = contactList[i].con.Lastname;
            c.phone= contactList[i].con.phone;
            c.Title = contactList[i].pinCode;
            cList.add(c);
        }
        insert cList;
        //insert listContact;

        return null;
    }

    public class cContact 
    {
        public Contact con {get; set;}
        public String pinCode {get; set;}
    
        //This is the contructor method. When we create a new cContact object we pass a Contact that is set to the con property. We also set the selected value to false
        public cContact(Contact c, String pCode) 
        {
            this.con = c;
            this.pinCode = pCode;
        }
    }

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
    
    @RemoteAction
    public static PageReference  saveContactData(String conData)
    {
        String dataStr = conData;
        system.debug('===========================================dataStr ==========='+dataStr );
        List<Contact> conList = New List<Contact>(); 
        String[] conDataArr   =dataStr.split('#');
         system.debug('===========================================conDataArr   ==========='+conDataArr   );
        for(Integer i =0;i<conDataArr.size();i++)
        {
            String str = conDataArr[i];
            String[] s  =  str.split(',');
            
                Contact c = New Contact();
                c.FirstName =  s[0];
                c.LastName =  s[1];
                c.Phone=  s[2];
                c.SmartCharts__Pincode__c =  s[3];
                conList.add(c);
              
           
        }   
         system.debug('===========================================conList==========='+conList); 
        insert conList;
        
        return null;
    }
}