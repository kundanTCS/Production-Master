//Generated by wsdl2apex

public class exampleComComPwcWebserviceSf2gwconn {
    public class sayHelloResponse_element {
        public String return_x;
        private String[] return_x_type_info = new String[]{'return','http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI','true','false'};
        private String[] field_order_type_info = new String[]{'return_x'};
    }
    public class pingMe_element {
        private String[] apex_schema_type_info = new String[]{'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class pingMeResponse_element {
        public String return_x;
        private String[] return_x_type_info = new String[]{'return','http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI','true','false'};
        private String[] field_order_type_info = new String[]{'return_x'};
    }
    public class createNoteResponse_element {
        public exampleComComPwcWebserviceSf2gwconn.NoteRes return_x;
        private String[] return_x_type_info = new String[]{'return','http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI','true','false'};
        private String[] field_order_type_info = new String[]{'return_x'};
    }
    public class SFConnectorAPISoap11Port {
        public String endpoint_x = 'http://65.183.25.137:9180/pc/ws/com/pwc/webservice/sf2gwconnect/SFConnectorAPI/soap11';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public guidewireComWsSoapheaders.authentication_element gw_authentication;
        public guidewireComWsSoapheaders.locale_element gw_locale;
        private String gw_authentication_hns = 'authentication=http://guidewire.com/ws/soapheaders';
        private String gw_locale_hns = 'locale=http://guidewire.com/ws/soapheaders';
        private String[] ns_map_type_info = new String[]{'http://guidewire.com/ws/soapheaders', 'guidewireComWsSoapheaders', 'http://example.com/com/pwc/webservice/sf2gwconnect', 'exampleComComPwcWebserviceSf2gwconn', 'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI', 'exampleComComPwcWebserviceSf2gwconn'};
        public String sayHello(String name) {
            exampleComComPwcWebserviceSf2gwconn.sayHello_element request_x = new exampleComComPwcWebserviceSf2gwconn.sayHello_element();
            exampleComComPwcWebserviceSf2gwconn.sayHelloResponse_element response_x;
            request_x.name = name;
            Map<String, exampleComComPwcWebserviceSf2gwconn.sayHelloResponse_element> response_map_x = new Map<String, exampleComComPwcWebserviceSf2gwconn.sayHelloResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',
              'sayHello',
              'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',
              'sayHelloResponse',
              'exampleComComPwcWebserviceSf2gwconn.sayHelloResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.return_x;
        }
        public exampleComComPwcWebserviceSf2gwconn.NoteRes createNote(exampleComComPwcWebserviceSf2gwconn.NoteReq req) {
            exampleComComPwcWebserviceSf2gwconn.createNote_element request_x = new exampleComComPwcWebserviceSf2gwconn.createNote_element();
            exampleComComPwcWebserviceSf2gwconn.createNoteResponse_element response_x;
            request_x.req = req;
            Map<String, exampleComComPwcWebserviceSf2gwconn.createNoteResponse_element> response_map_x = new Map<String, exampleComComPwcWebserviceSf2gwconn.createNoteResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',
              'createNote',
              'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',
              'createNoteResponse',
              'exampleComComPwcWebserviceSf2gwconn.createNoteResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.return_x;
        }
        public String pingMe() {
            exampleComComPwcWebserviceSf2gwconn.pingMe_element request_x = new exampleComComPwcWebserviceSf2gwconn.pingMe_element();
            exampleComComPwcWebserviceSf2gwconn.pingMeResponse_element response_x;
            Map<String, exampleComComPwcWebserviceSf2gwconn.pingMeResponse_element> response_map_x = new Map<String, exampleComComPwcWebserviceSf2gwconn.pingMeResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',
              'pingMe',
              'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',
              'pingMeResponse',
              'exampleComComPwcWebserviceSf2gwconn.pingMeResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.return_x;
        }
    }
    public class createNote_element {
        public exampleComComPwcWebserviceSf2gwconn.NoteReq req;
        private String[] req_type_info = new String[]{'req','http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI','true','false'};
        private String[] field_order_type_info = new String[]{'req'};
    }
    public class NoteReq {
        public String body;
        public String policyNumber;
        public String subject;
        private String[] body_type_info = new String[]{'body','http://example.com/com/pwc/webservice/sf2gwconnect',null,'0','1','false'};
        private String[] policyNumber_type_info = new String[]{'policyNumber','http://example.com/com/pwc/webservice/sf2gwconnect',null,'0','1','false'};
        private String[] subject_type_info = new String[]{'subject','http://example.com/com/pwc/webservice/sf2gwconnect',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://example.com/com/pwc/webservice/sf2gwconnect','true','false'};
        private String[] field_order_type_info = new String[]{'body','policyNumber','subject'};
    }
    public class sayHello_element {
        public String name;
        private String[] name_type_info = new String[]{'name','http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://example.com/com/pwc/webservice/sf2gwconnect/SFConnectorAPI','true','false'};
        private String[] field_order_type_info = new String[]{'name'};
    }
    public class NoteRes {
        public String ErrMsg;
        public String body;
        public String subject;
        private String[] ErrMsg_type_info = new String[]{'ErrMsg','http://example.com/com/pwc/webservice/sf2gwconnect',null,'0','1','false'};
        private String[] body_type_info = new String[]{'body','http://example.com/com/pwc/webservice/sf2gwconnect',null,'0','1','false'};
        private String[] subject_type_info = new String[]{'subject','http://example.com/com/pwc/webservice/sf2gwconnect',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://example.com/com/pwc/webservice/sf2gwconnect','true','false'};
        private String[] field_order_type_info = new String[]{'ErrMsg','body','subject'};
    }
}