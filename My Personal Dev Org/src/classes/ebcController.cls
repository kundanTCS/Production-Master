public with sharing class ebcController{

    @RemoteAction
    public static string getEBCList(){
        List<EBC_Attendee__c> ebcaList = [select id, EBC_Meeting__r.name, EBC_Meeting__r.date_of_event__c, EBC_Meeting__c from EBC_Attendee__C where User__c = :UserInfo.getUserId() and EBC_Meeting__r.date_of_event__c >= :Date.today() Order By EBC_Meeting__r.date_of_event__c ASC];

        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartArray();
        for(EBC_Attendee__c ebca : ebcaList){
            gen.writeStartObject();
            gen.writeStringField('id', ebca.ebc_meeting__c);
            gen.writeStringField('name', ebca.ebc_meeting__r.name);
            gen.writeDateTimeField('dateOfEvent', ebca.ebc_meeting__r.date_of_event__c);
            gen.writeEndObject();
        }
        gen.writeEndArray();

        return gen.getAsString();
    }
    
    @RemoteAction
    public static String setAttendeeComment(String commentId,String commentString) {
        try {
            EBC_Comment__c myComment = new EBC_Comment__c();
            //myComment.EBC_Attendee__c = Id.valueOf(attendeeId);
            myComment.Id = Id.valueOf(commentId);
            myComment.Comments__c = commentString;
        
            upsert myComment;
            return 'success';
        } catch(Exception e) {
            System.debug(e.getMessage());
            return 'error';
        }
    
    }
    
    @RemoteAction
    public static EBC_Comment__c getAttendeeComment(String attendeeId) {
        EBC_Comment__c mComment = new EBC_Comment__c();
        if(attendeeId != null){
            List<EBC_Comment__c> myComment = [Select Id, Comments__c, EBC_Attendee__c, LastModifiedDate from EBC_Comment__c where CreatedByID = :UserInfo.getUserId() and EBC_Attendee__c = :Id.valueOf(attendeeId)];
            if(myComment.size() == 0){
                mComment.EBC_Attendee__c = Id.valueOf(attendeeId);
                mComment.Comments__c = '';
                upsert mComment;
            } else if(myComment.size() == 1){
                //mycomment is 1
                mComment = myComment[0];
            }    
        }
        return mComment;
    }

    
    @RemoteAction
    public static EBC_Meeting__c getEBCInfo2(string ebcID){
        EBC_Meeting__c ebc = null;
        List<Schema.FieldSetMember> attfields = SObjectType.EBC_Attendee__c.FieldSets.attFields.getFields();
        List<Schema.FieldSetMember> ebcfields = SObjectType.EBC_Meeting__c.FieldSets.ebcFields.getFields();
        try{
            String query = 'SELECT ';
            for(Schema.FieldSetMember f : ebcfields) {
                query += f.getFieldPath() + ',';
            }
            query += '(SELECT ';
            for(Schema.FieldSetMember f :attfields) {
                query += f.getFieldPath() + ',';
            }
            query = query.left(query.length()-1);
            query += ' from EBC_Attendee__r) from EBC_Meeting__c where Id = \'' + ebcId + '\'';
            System.debug(query);
            ebc = Database.query(query);
        }
        catch(DMLException e){ 
            System.debug(e.getMessage()); 
        }
        return ebc;
    }
    
    @RemoteAction
    public static string getEBCSchema(){  
        List<Schema.FieldSetMember> attfields = SObjectType.EBC_Attendee__c.FieldSets.attFields.getFields();
        List<Schema.FieldSetMember> ebcfields = SObjectType.EBC_Meeting__c.FieldSets.ebcFields.getFields();
       
        JSONGenerator gen = JSON.createGenerator(true);

        gen.writeStartObject();
        gen.writeFieldName('ebc');
        gen.writeStartArray();
        
        For(Schema.FieldSetMember f : ebcFields){
            gen.writeStartObject();
         gen.writeStringField(f.getFieldPath(), String.ValueOf(f.getType()));   
            gen.writeEndObject();
        }
        gen.writeEndArray();
        
        gen.writeFieldName('att');
        gen.writeStartArray();
        
        For(Schema.FieldSetMember f : attFields){
            gen.writeStartObject();
            gen.writeStringField(f.getFieldPath(), String.ValueOf(f.getType()));   
            gen.writeEndObject();
        }
        gen.writeEndArray();
        gen.writeEndObject();
        return gen.getAsString();
    }
    
    @RemoteAction
    public  static string getEBCLabelz(){  
        List<Schema.FieldSetMember> attfields = SObjectType.EBC_Attendee__c.FieldSets.attFields.getFields();
        List<Schema.FieldSetMember> ebcfields = SObjectType.EBC_Meeting__c.FieldSets.ebcFields.getFields();
        List<Schema.FieldSetMember> ebcSummaryFields = SObjectType.EBC_Meeting__c.FieldSets.EBC_Summary.getFields();
       
        JSONGenerator gen = JSON.createGenerator(true);
        //Container
        gen.writeStartObject();

        //content
        gen.writeFieldName('ebcinfo');
        gen.writeStartObject();
        For(Schema.FieldSetMember f : ebcFields){
            gen.writeStringField(f.getFieldPath(), f.getLabel());
        }
        gen.writeEndObject();
        
        gen.writeFieldName('att');
        gen.writeStartObject();
        For(Schema.FieldSetMember f : attFields){
            gen.writeStringField(f.getFieldPath(), f.getLabel());
        }
        gen.writeEndObject();

        gen.writeFieldName('ebc_summary');
        gen.writeStartObject();
        For(Schema.FieldSetMember f : ebcSummaryFields){
            gen.writeStringField(f.getFieldPath(), f.getLabel());
        }
        gen.writeEndObject();//content ends
        gen.writeEndObject();//container ends
        return gen.getAsString();
    }

    @RemoteAction
    public static EBC_Meeting__c getEBCSummary(string ebcId){
        List<Schema.FieldSetMember> fields = SObjectType.EBC_Meeting__c.FieldSets.EBC_Summary.getFields();
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : fields) {
            query += f.getFieldPath() + ',';
        }
        query = query.left(query.length()-1);
        query += ' from EBC_Meeting__c where Id = \''+ebcId+'\'';
        system.debug(query);
        EBC_Meeting__c ebc = Database.query(query);
        return ebc;
    }

    @RemoteAction
    public static EBC_Attendee__c getAttendeeDetail2(string attendeeID){
        List<Schema.FieldSetMember> fields = SObjectType.EBC_Attendee__c.FieldSets.attFields.getFields();
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : fields) {
            query += f.getFieldPath() + ',';
        }
        query = query.left(query.length()-1);
        query += ' from EBC_Attendee__c where Id = \''+attendeeID+'\'';
        system.debug(query);
        EBC_Attendee__c ebca = Database.query(query);
        return ebca;
    }

}