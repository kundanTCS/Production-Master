Public class BulkDownload
{

   public List<innerClass> innerList  {get;  set;}
   
   public BulkDownload()
   { 
       innerList = new List<innerClass>();
       
       List<Account> accList = [Select name, type, phone from account limit 3];
       List<String> fieldSetList = new List<String> {'Id','Name','Type','Phone'};
       
       for(Account acc: accList)
       {
           List<string> s = new List<string>();
           
           for(integer i=0;i<fieldSetList.size();i++)
           {
               string st = '"'+ (String)acc.get(fieldSetList[i]) + '"';
               s.add(st);
               //s.add((String)acc.get(fieldSetList[i]));
               
           }
           innerList.add(new innerClass(s));
       }
       
       /*
       for(Integer i=0;i<3;i++)
       {
           List<string> s = new List<string>();
           s.add('a');
           s.add('b');
           s.add('c');
           innerList.add(new innerClass(s));
        }
        */           
   }
     
   
   
   
   public class innerClass
   {
       public List<string> sList {get;set;}
       
       public innerClass(List<string> sl)
       {
           sList = sl;
       }
   
   }  
       
       
       public String COMMA {
               get {
                    return String.fromCharArray(new List<Integer>{44});
                   }
                 }


        public String CRLF {
                get {
                        return '\r';
                    }
                            }


     public String QUOTES {
               get {
                    return String.fromCharArray(new List<Integer>{34});
                   }
                 }
        
}