public class QueryResult 
{
  public String field1Name ;
  public String field1Value
  { 
     get {return field1Value ; } 
  
     set {field1Value = value ; } 
  }  

  public String field2Name ;
  public String field2Value 
  { 
    get {return field2Value ; } 
    set {field2Value = value ; } 
  }  

   public QueryResult( String s1, String s2, String s3, String s4) 
   {
    field1Name = s1 ; 
        field1Value = s2 ; 
        field2Name = s3 ; 
        field2Value = s4 ; 
   }
}