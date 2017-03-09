public with sharing class Charts1

{

    

    public String chartData; 

    public String imgURL {get; set;} 

    public Account tempacc = new  Account();

    private List<SelectOption> objectNames ;

    private List<SelectOption> fieldNames ;

     public boolean showthechart{get; set;}  

    public String objectName { get {return objectName ;} set{ objectName = value ;} }

    public String fieldName { get {return fieldName ;} set{ fieldName = value ;} }

    public String mapSize { get {return mapSize ;} set{ mapSize = value ;} }

  //  public String dateValue { get {return dateValue ;} set{ dateValue = value ;} }

    public String dateValue { get {return dateValue ;} set{ dateValue = 'CreatedDate' ;} }

    public boolean showthechartimage {get; set;}

    public String qryParam { get {return qryParam ;} set{ qryParam = value ;} }        

    public String qryParam1 { get {return qryParam1 ;} set{ qryParam1 = value ;} }  

    public List<String> lab {get; set;}    
    public List<Integer> labVal {get; set;}
    public integer len {get; set;}

    private Charts2 m;

 //   public Boolean error {get; set;}

 //   public string error_msg {get; set;}

    



//*************Constructor****************************************

    public Charts1()

    {

        m = new Charts2() ;

        objectNames  = new List<SelectOption> {} ;

        showthechart =false;

        showthechartimage = false;

        dateValue = 'CreatedDate' ;

        mapSize = '';

            List<String> names = m.getObjectNameList() ; 

            List<String> names1 = m.getObjectNameListLabel() ; 

            

            sortList2(names,names1);

            sortList(names1);

        

                  

            for(Integer i = 0 ; i < names.size() ; i++ )

            {

                objectNames.add( new SelectOption( names.get(i), names1.get(i) )) ;

            }

                

        

    }





//***************  Select Object **************************************    

    public List<SelectOption> getItems()

    {

         showthechart =false;

        system.debug('Kundan......Looooopppppp...................'+fieldName);

        return objectNames ;

    }

    

    

//***************  Select Object Fields **************************************        

 public List<SelectOption> getFields()

    {

    showthechart =false;

             showthechartimage=false;

        fieldNames = new List<SelectOption> {} ;

        

            List<String> names = m.getStringFieldsNameList(objectName) ;

            List<String> names1 = m.getStringFieldsNameListLabel(objectName) ;

       

           

            if(names.size() == 0 )

            {

                system.debug('Kundan.........................'+names.size());

                fieldNames.add( new SelectOption( 'Object has no fields','Object has no fields'  )) ;

             //   error=true;

              //  error_msg='Object has no fields';

              //  return null;



              /*   ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'List of Object Fields is Null');

                 ApexPages.addMessage(errorMsg);

                 return null;   */

            }

            else

            {

                sortList2(names,names1);

                sortList(names1);

                for(Integer i = 0 ; i < names.size() ; i++ )

                {

                    fieldNames.add( new SelectOption( names.get(i), names1.get(i) )) ;

                }

            }

      /* if(fieldNames.size()==0)

       {

        fieldNames.add( new SelectOption( 'Object has no fields','Object has no fields'  )) ;

       }  */

       return fieldNames ;    

    }





//***************  Select Map Style **************************************    

    public List<SelectOption> getMap()

    {

    showthechart =false;

         showthechartimage=false;

        List<SelectOption> maps = new List<SelectOption>();

        if(fieldName == 'Object has no fields')

        {

            maps.add(new SelectOption('Not available','Not available'));

        }

        else

        {

//            maps.add(new SelectOption('p','Pie Chart 2-D'));

            maps.add(new SelectOption('p3','Pie Chartp 3-D'));

//            maps.add(new SelectOption('bvs','Bar Chart - Vertical'));

//            maps.add(new SelectOption('bhs','Bar Chart - Horizontal'));

        }

            return maps ;

    }





    

//***************  Select Map Style **************************************    

    public List<SelectOption> getdateList()

    {

         showthechart =false;

         showthechartimage=false;

        List<SelectOption> dl = new List<SelectOption>();

            dl.add(new SelectOption('CreatedDate','Created Date'));

            dl.add(new SelectOption('LastmodifiedDate','Last modified Date'));

           

            return dl ;

    }





  

        

        public String getChartData()

        {

            return chartData;

        }

        



        

        public String getChartData(List<ChartDataItem> items)

        {

            String chd = ''; // 23,34,56

            String chl = ''; // Hello|World

            lab = new List<String>();
            labVal = new List<Integer>();

            for(ChartDataItem citem : items)

            {

                chd += citem.ItemValue + ',';

                chl += citem.Label + '|';
                
                lab.add(citem.Label);
                labVal.add(integer.valueOf(citem.ItemValue));

            }
            len = lab.size();
        	system.debug('kundanTest........len...........'+len);
        	system.debug('kundanTest........lab...........'+lab);    
            system.debug('kundanTest........labVal........'+labVal);
            		
            chd = chd.substring(0, chd.length() -1);

            chl = chl.substring(0, chl.length() -1);



            String result = '&chd=t:' + chd + '&chl=' + chl;

            return result;

        }





        public class ChartDataItem

        {

            public String ItemValue {get; set;}

            public String Label {get;set;}

        

            public ChartDataItem(String Label, String Value)

            {

                this.Label = Label;

                this.ItemValue = Value;

            }

        }

    

    

//*********************Sorting the Picklist values  ************************************



    public List<String> sortList2( List<String> listname, List<String> listname1)

    {

        

        

        

        integer len = listname1.size() - 1;

        String temp, temp1;



        for(integer a=0; a<len; ++a)

        {

            for(integer b=0; b<len; ++b)

            {

                if(listname1[b].compareTo(listname1[b+1]) > 0 )

                {

                    temp1 = listname1[b];

                    temp = listname[b];

                    listname1[b] = listname1[b+1];

                    listname[b] = listname[b+1];

                    listname1[b+1] = temp1;

                    listname[b+1] = temp;                   

                }

            }

        }

        return listname;

     }

    

    

    public List<String> sortList( List<String> listname)

    {

        

        integer len = listname.size() - 1;

        String temp;



        for(integer a=0; a<len; ++a)

        {

            for(integer b=0; b<len; ++b)

            {

                if(listname[b].compareTo(listname[b+1]) > 0 )

                {

                    temp = listname[b];

                    listname[b] = listname[b+1];

                    listname[b+1] = temp;

                }

            }

        }

        

        return listname;

     }

    

    public String extractDate(String qryParam)

    {

        String temp='';

        

        if(qryParam.substring(1,2)== '-')

        {

            qryParam = '0'+qryParam ;

        }

                

        temp += qryParam.substring(7,11);

        temp += '-';

                        

        if(qryParam.substring(3,6)== 'Jan') 

        {

            temp += '0';

            temp += '1';

        }

        if(qryParam.substring(3,6)== 'Feb') 

        {

            temp += '0';

            temp += '2';

        }

        if(qryParam.substring(3,6)== 'Mar') 

        {

            temp += '0';

            temp += '3';

        }

        if(qryParam.substring(3,6)== 'Apr') 

        {

            temp += '0';

            temp += '4';

        }

        if(qryParam.substring(3,6)== 'May') 

        {

            temp += '0';

            temp += '5';

        }

        if(qryParam.substring(3,6)== 'Jun') 

        {

            temp += '0';

            temp += '6';

        }

        if(qryParam.substring(3,6)== 'Jul') 

        {

            temp += '0';

            temp += '7';

        }

        if(qryParam.substring(3,6)== 'Aug') 

        {

            temp += '0';

            temp += '8';

        }

        if(qryParam.substring(3,6)== 'Sep') 

        {

            temp += '0';

            temp += '9';

        }

        if(qryParam.substring(3,6)== 'Oct') 

        {

            temp += '1';

            temp += '0';

        }

        if(qryParam.substring(3,6)== 'Nov') 

        {

            temp += '1';

            temp += '1';

        }

        if(qryParam.substring(3,6)== 'Dec') 

        {

            temp += '1';

            temp += '2';

        }

        temp += '-';

        temp += qryParam.substring(0,2);

         system.debug('Kundan************in Fuction***********Date1.....'+temp);

        

        return temp;    

        

    }

 

 //************************** Google Charts ************************************

    public PageReference googleMap() 

    {

      if(showthechartimage != true)

        {

           List<ChartDataItem> items = new List<ChartDataItem>();

           String text=' '; 

           String startDate; 

           String endDate; 

           Boolean flag=false;

                    system.debug('Start Time......................................'+qryParam);

                    system.debug('End Time......................................'+qryParam1);                      

                

            List<Schema.PicklistEntry> P = m.getPickList(objectName,fieldName);

            for(Schema.PicklistEntry pValue : P)

            {

                

                if(qryParam == '' )

                {

                    text = 'select count() from ';

                    text += objectName ;

                    text += ' where ' ;

                    text += fieldName;

                    text += '=\''+ pValue.getValue()+'\'' ;

                    text += ' limit 10000';

                    system.debug('Kundan................................................in qryparam Blank');

                }

                else

                {      

        

                    system.debug('Start Time1......................................'+startDate);

                    system.debug('End Time1......................................'+endDate);            

                    

                    startDate = extractDate(qryParam);

                    endDate = extractDate(qryParam1);

         

                    text = 'select count() from ';

                    text += objectName ;

                    text += ' where ' ;

                    text += fieldName;

                    text += '=\''+ pValue.getValue()+'\'' ;

                    text += ' AND ';

                    text += objectName;

                    if(dateValue == 'CreatedDate' )

                            text += '.CreatedDate > ';

                    else

                            text += '.LastModifiedDate > ';



                    text += startDate ;

                    text += 'T00:00:00.000Z AND ';

                    text += objectName;

                    if(dateValue == 'CreatedDate')

                            text += '.CreatedDate < ';

                    else

                            text += '.LastModifiedDate < ';                

    

                    text += endDate ;

                    text += 'T00:00:00.000Z' ;  

                    text += ' limit 10000';                 

                 }

                

                system.debug('Query Text..................'+text);

                            

                Integer Count = Database.countQuery(text);

            

           /*     if (Count <= 0)

                {

                    ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Selected Object and Field do not have any data in the system');

                    ApexPages.addMessage(errorMsg);

                    return null;   

                }

                else

                {

                    system.debug('Kundan...Count **********************...............'+Count);

                   items.add(new ChartDataItem(pValue.getValue()+ '-['+ Count.format() + ']' , Count.format()));

                }*/ 

               

                if (Count > 0)

                {

                    flag=true;

                    system.debug('Kundan...Count **********************...............'+Count);

//                    items.add(new ChartDataItem(pValue.getValue()+ '-['+ Count.format() + ']' , Count.format()));     
                    items.add(new ChartDataItem(pValue.getValue(), Count.format()));
                }   

             }

           

             if (flag == false)

             {

                    ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Error : Selected Object and Field do not have any data in the system');

                    ApexPages.addMessage(errorMsg);

                    

                    return null;   

             }

           



            String chartPath = 'http://chart.apis.google.com/chart?chs=600x200&cht='+ mapSize + '&chbh=10,100';



            chartData = chartPath +  getChartData(items);

            }

            showthechart=true;

    return null;   

    }

    

 //******************************************************************               

 public pageReference SeePDF()

     {

        if(showthechart!=true)

        {

           showthechartimage = true;

           List<ChartDataItem> items = new List<ChartDataItem>();

           String text=' '; 

           String startDate; 

           String endDate; 

           Boolean flag=false;

                    system.debug('Start Time......................................'+qryParam);

                    system.debug('End Time......................................'+qryParam1);                      

                

            List<Schema.PicklistEntry> P = m.getPickList(objectName,fieldName);

            for(Schema.PicklistEntry pValue : P)

            {

                

                if(qryParam == '' )

                {

                    text = 'select count() from ';

                    text += objectName ;

                    text += ' where ' ;

                    text += fieldName;

                    text += '=\''+ pValue.getValue()+'\'' ;

                    text += ' limit 10000';

                    system.debug('Kundan................................................in qryparam Blank');

                }

                else

                {      

        

                    system.debug('Start Time1......................................'+startDate);

                    system.debug('End Time1......................................'+endDate);            

                    

                    startDate = extractDate(qryParam);

                    endDate = extractDate(qryParam1);

         

                    text = 'select count() from ';

                    text += objectName ;

                    text += ' where ' ;

                    text += fieldName;

                    text += '=\''+ pValue.getValue()+'\'' ;

                    text += ' AND ';

                    text += objectName;

                    if(dateValue == 'CreatedDate' )

                            text += '.CreatedDate > ';

                    else

                            text += '.LastModifiedDate > ';



                    text += startDate ;

                    text += 'T00:00:00.000Z AND ';

                    text += objectName;

                    if(dateValue == 'CreatedDate')

                            text += '.CreatedDate < ';

                    else

                            text += '.LastModifiedDate < ';                

    

                    text += endDate ;

                    text += 'T00:00:00.000Z' ;  

                    text += ' limit 10000';                 

                 }

                

                system.debug('Kundan..................'+text);

                            

                Integer Count = Database.countQuery(text);

            

             if (Count > 0)

                {

                    flag=true;

                    system.debug('Kundan...Count **********************...............'+Count);

                    items.add(new ChartDataItem(pValue.getValue()+ '-['+ Count.format() + ']' , Count.format()));     

                }   

             }

           

             if (flag == false)

             {

                    ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Error : Selected Object and Field do not have any data in the system');

                    ApexPages.addMessage(errorMsg);

                    return null;   

             }

           

                      String chartPath = 'http://chart.apis.google.com/chart?chs=750x400&cht='+ mapSize + '&chbh=10,100';

                       chartData = chartPath +  getChartData(items);                       }

                       

                         return null;   

            

        

             

     }

 

 }