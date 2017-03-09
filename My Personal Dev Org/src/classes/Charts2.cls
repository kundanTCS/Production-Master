public class Charts2

{

    

    private Map<String, Schema.SObjectType> globalObjectMap ;





//************** Constructors *********************************************

    

    public Charts2()

    {

        globalObjectMap = Schema.getGlobalDescribe() ;

    }

    

 

 

 //************ To get list of all Object names in the system ****************

    public List<String> getObjectNameList()

    {     

        List<String> result = new List<String>{} ;

        List<Schema.SObjectType> oTokens = globalObjectMap.values() ;

     

        for( Integer i = 0; i < oTokens.size() ; i++ )

        {  

            Schema.DescribeSObjectResult t = oTokens.get(i).getDescribe() ;     

            if( t.isAccessible() && t.isSearchable())

                result.add( t.getName() ) ; 

         //system.debug('Kundan..Object......................'+t.getName());

               

        }

        return result ;

    }

    

    

    public List<String> getObjectNameListLabel()

    {     

        List<String> result = new List<String>{} ;

        List<Schema.SObjectType> oTokens = globalObjectMap.values() ;

     

        for( Integer i = 0; i < oTokens.size() ; i++ )

        {  

            Schema.DescribeSObjectResult t = oTokens.get(i).getDescribe() ;     

            if( t.isAccessible() && t.isSearchable())

               result.add( t.getLabel() ) ; 

         //  system.debug('Kundan..Object..Label....................'+t.getLabel());

        }

        return result ;

    }

    



    

//********** To get all Fieldnames for given Object*************************

    public List<String> getStringFieldsNameList( String objName )

    {

        List<String> result = new List<String>{} ;      

        Schema.SObjectType s = globalObjectMap.get(objName) ;

        Map<String, Schema.SObjectField> fMap = s.getDescribe().fields.getMap() ;

        List<Schema.SObjectField> fTokens = fMap.values() ;



        for( Integer i = 0 ; i < fTokens.size() ; i++ )

        {  

            Schema.DescribeFieldResult f = fTokens.get(i).getDescribe() ;

            if( f.isAccessible() && f.getType() == DisplayType.PICKLIST) 

            {

                

                result.add( f.getName() ) ;

            //    system.debug('Kundan..Field......................'+f.getName());

            }

        }

        return result ;

    }

    

    public List<String> getStringFieldsNameListLabel( String objName )

    {

        List<String> result = new List<String>{} ;      

        Schema.SObjectType s = globalObjectMap.get(objName) ;

        Map<String, Schema.SObjectField> fMap = s.getDescribe().fields.getMap() ;

        List<Schema.SObjectField> fTokens = fMap.values() ;



        for( Integer i = 0 ; i < fTokens.size() ; i++ )

        {  

            Schema.DescribeFieldResult f = fTokens.get(i).getDescribe() ;

            if( f.isAccessible() && f.getType() == DisplayType.PICKLIST) 

            {

                result.add( f.getLabel() ) ;

             //     system.debug('Kundan..Field....Label....................'+f.getLabel());

            }

        }

        return result ;

    }

 

 

    

 //*********** To get Picklist valuesfor Given Object and Fieldname ************

        public List<Schema.PicklistEntry> getPickList( String objName, String fieldName)

        {

          

          Schema.SObjectType s = globalObjectMap.get(objName) ;

          Map<String, Schema.SObjectField> fMap = s.getDescribe().fields.getMap() ;

          List<Schema.SObjectField> fTokens = fMap.values() ;

          for( Integer i = 0 ; i < fTokens.size() ; i++ )

          {

              Schema.DescribeFieldResult f = fTokens.get(i).getDescribe() ;

              if(f.getName()== fieldName)

               {

                  return f.getPickListValues();              

               }

          }

          return null;

      }

//***********************************************************************************   

  

}