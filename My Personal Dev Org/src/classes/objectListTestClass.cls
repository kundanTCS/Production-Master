public class objectListTestClass 
{
	static testMethod void validateobjectList() 
	{
    string str1 = '13-dec-2008';
    string str2 = '2008-12-13';
    String objectName;
    
    pagereference r;
   
    
    List<String> MyList1 = new List<String>();
    List<String> MyList2 = new List<String>();
    List<String> FieldnameList = new List<String>();
    List<SelectOption> fieldname = new List<SelectOption>(); 
    
    MyList1.add('aad');
    MyList1.add('aac');
    MyList1.add('aab');    
    MyList1.add('aaa');    
    
    MyList2.add('aaa');
    MyList2.add('aab');
    MyList2.add('aac');    
    MyList2.add('aad');    
        
    objectList obj = new objectList();
    obj.objectName='Account';
    obj.fieldName='Rating';
    obj.mapSize='Pie Chart 2-D';
    obj.dateValue='CreatedDate';
    obj.qryParam='13-dec-2008';
    obj.qryParam1='15-dec-2008';
    
    
    System.assertEquals(obj.extractDate(str1), str2);
    
    System.assertEquals(obj.sortList(MyList1),MyList2);
    System.assertEquals(obj.sortList2(MyList1,MyList1),MyList2);
    
    MetaInfo m = new MetaInfo();
    
/*    objectList.ChartDataItem c = new objectList.ChartDataItem();
    c.ItemValue='23';
    c.Label='Hello';
    
    List<objectList.ChartDataItem> c1 = new List<objectList.ChartDataItem>();
    c1.add(c);
    
    String result = objectList.getChartData(c1);
*/
    obj.getItems();
    obj.getMap();
    obj.getdateList();
    

 	FieldnameList = m.getStringFieldsNameList('Account');
 
 	List<Schema.PicklistEntry> P = m.getPickList('Account','Name');
 	   fieldname = obj.getFields();
 	   r=obj.googleMap();
 /*   
    m.getObjectNameList();
    m.getObjectNameListLabel();
    m.getStringFieldsNameList('Account');
    m.getStringFieldsNameListLabel('Account');
 */     
    }
}