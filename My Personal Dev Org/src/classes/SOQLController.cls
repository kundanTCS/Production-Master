public class SOQLController { 
   
   
    public List<SelectOption> getItems(){
        return objectNames ;
    }
    
    public List<SelectOption> getFields(){
        fieldNames = new List<SelectOption> {} ;
        List<String> names = m.getStringFieldsNameList(objectName) ;
        for(Integer i = 0 ; i < names.size() ; i++ ){
            fieldNames.add( new SelectOption( names.get(i), names.get(i) )) ;
        }
        

        return fieldNames ;
    }

    private List<SelectOption> objectNames ;
    private List<SelectOption> fieldNames ;
    public String objectName { get {return objectName ;} set{ objectName = value ;} }
    public String fieldName { get {return fieldName ;} set{ fieldName = value ;} }
    public String fieldValue { get {return fieldValue ;} set{ fieldValue = value ;} }
    public String qryParam { get {return qryParam ;} set{ qryParam = value ;} }
    public boolean renderResult  { get {return renderResult  ;} set{ renderResult  = value ;} }
    public String zipCode { get { return zipCode ;} set { zipCode=value ; } }
    public List<SObject> qryResult { get {return qryResult; }  set { qryResult = value ; } }
    public List<QueryResult> qr { get { return qr ; } set { qr = value ; } } 
    
    private MetaInfo m;
    
    public SOQLController(){
        m = new MetaInfo() ;
        objectNames  = new List<SelectOption> {} ;
        List<String> names = m.getObjectNameList() ; 
        for(Integer i = 0 ; i < names.size() ; i++ ){
            objectNames.add( new SelectOption( names.get(i), names.get(i) )) ;
        }
        
        
    }           
    
    
    public PageReference query() {
              
           
        // create a query string 
        String qryString = 'SELECT Id, ' + fieldName + ' FROM ' + objectName + ' WHERE ' + objectName + '.' + 
                            fieldName + '=' + '\'' + qryParam + '\'' ; 
        // execute the query
        qryResult = Database.query(qryString) ;   
        renderResult = true ;   
        qr = new List<QueryResult>{} ;
        
        for(SObject s : qryResult){
            QueryResult q = new QueryResult( 'Id', (String)(s.get('Id')), fieldName, (String)(s.get(fieldName)) ) ;
            qr.add(q) ;    
        }
         
        return null;
    } 
}