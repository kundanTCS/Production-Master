@isTest
private class EBCTest {

    static testMethod void testController() {
        Account a = new Account(Name='Test Account');
        insert a;
        Opportunity o = new Opportunity(AccountId=a.Id,Name='TestOpp',StageName='Prospecting',CloseDate=Date.today(),amount=1000);
        insert o;
        Contact c = new Contact(FirstName='Test',LastName='Guy', email='test@test.org');
        c.ebc_photo_url__c='http://blah.com/test.jpg';
        c.Title='My Title';
        insert c;
        
        EBC_Meeting__c ebc = new EBC_Meeting__c();
        ebc.Account__c = a.Id;
        ebc.Opportunity__c = o.Id;
        ebc.Date_of_Event__c = DateTime.now();
        ebc.Executive_Summary__c = 'Test';
        ebc.Purpose_of_EBC__c = 'test';
        insert ebc;
        
        /*Profile p = [select id from profile where name='Standard User'];
        User u = new User(alias = 'standt', email='standarduser@testorg.com',
        emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
        localesidkey='en_US', profileid = p.Id,
        timezonesidkey='America/Los_Angeles', username='testman@hackapptester.org');
        insert u;*/
        User u = [SELECT Id from User LIMIT 1];
        
        EBC_Attendee__c att = new EBC_Attendee__c();
        att.User__c = u.Id;
        att.Type__c = 'Customer';
        att.EBC_Meeting__c = ebc.Id;
        insert att;
        
        EBC_Attendee__c att2 = new EBC_Attendee__c();
        att2.Contact__c = c.Id;
        att2.Type__c = 'Partner';
        att2.EBC_Meeting__c = ebc.Id;
        insert att2;
        
        EBC_Comment__c eComment = new EBC_Comment__c();
        eComment.EBC_Attendee__c = att.Id;
        insert eComment;
        test.startTest();
        String ebclist = ebcController.getEBCList();
        //String atDetail = ebcController.getAttendeeDetail(String.valueOf(att.Id));
        //String atDetail2 = ebcController.getAttendeeDetail(String.valueOf(att2.Id));
        //String ebcInfo = ebcController.getEBCInfo(String.valueOf(ebc.Id));
        EBC_Meeting__c ebcSumm = ebcController.getEBCSummary(String.valueOf(ebc.Id));
        EBC_Meeting__c ebcInfo2 = ebcController.getEBCInfo2(String.valueOf(ebc.Id));
        String ebcSchema = ebcController.getEBCSchema();
        String ebcLabelz = ebcController.getEBCLabelz();
        EBC_Comment__c mcomment = ebcController.getAttendeeComment(String.valueOf(att.Id));
        EBC_Comment__c mcomment2 = ebcController.getAttendeeComment(String.valueOf(att2.Id));
        EBC_Comment__c mcommentFail = ebcController.getAttendeeComment(null);
        String comment = ebcController.setAttendeeComment(String.valueOf(eComment.Id),'Hey Now');
        String commentFail = ebcController.setAttendeeComment(null,'Hey Now');
        EBC_Attendee__c mAttendee = ebcController.getAttendeeDetail2(String.valueOf(att.Id));
        System.assert(comment == 'success');        
        
        
        test.stopTest();
    
    }

}