public class serviceChryslerCom {
    public class SystemException extends Exception{
        public String message;
        private String[] message_type_info = new String[]{'message','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://service.chrysler.com','false','false'};
        private String[] field_order_type_info = new String[]{'message'};
    }
    public class OrderServiceImpl {
        public String endpoint_x = 'https://webtest.extra.chrysler.com:443/salesforcews/services/OrderServiceImpl';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://service.chrysler.com', 'serviceChryslerCom'};
        public serviceChryslerCom.Orders getOrders(String value) {
            system.debug('Entered Function............................');
            serviceChryslerCom.getOrders_element request_x = new serviceChryslerCom.getOrders_element();
            serviceChryslerCom.getOrdersResponse_element response_x;
            system.debug('Value before............................'+value);
            request_x.value = value;
            system.debug('request_x............................'+request_x);
            system.debug('request_x.value............................'+request_x.value);
            Map<String, serviceChryslerCom.getOrdersResponse_element> response_map_x = new Map<String, serviceChryslerCom.getOrdersResponse_element>();
            response_map_x.put('response_x', response_x);
            system.debug('response_map_x before invoke............................'+response_map_x );
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'getOrders',
              'http://service.chrysler.com',
              'getOrders',
              'http://service.chrysler.com',
              'getOrdersResponse',
              'serviceChryslerCom.getOrdersResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            system.debug('response_x ............................'+response_x );

            return response_x.getOrdersReturn;
        }
    }
    public class ArrayOfOrder {
        public serviceChryslerCom.Order[] Order;
        private String[] Order_type_info = new String[]{'Order','http://service.chrysler.com','Order','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://service.chrysler.com','false','false'};
        private String[] field_order_type_info = new String[]{'Order'};
    }
    public class Order {
        public String customer;
        public String fan;
        public String fanName;
        public String fan1;
        public String fan1Name;
        public String contractYear;
        public String vipRuleIdNumber;
        public String vehcountstatusBA_C;
        public String vehcountstatusD_D1;
        public String vehcountstatusE_J;
        public String vehcountstatusKZ_KZX;
        public String totalOrders;
        public String uniqueId;
        public String IBus;
        private String[] customer_type_info = new String[]{'customer','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] fan_type_info = new String[]{'fan','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] fanName_type_info = new String[]{'fanName','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] fan1_type_info = new String[]{'fan1','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] fan1Name_type_info = new String[]{'fan1Name','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] contractYear_type_info = new String[]{'contractYear','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] vipRuleIdNumber_type_info = new String[]{'vipRuleIdNumber','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] vehcountstatusBA_C_type_info = new String[]{'vehcountstatusBA_C','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] vehcountstatusD_D1_type_info = new String[]{'vehcountstatusD_D1','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] vehcountstatusE_J_type_info = new String[]{'vehcountstatusE_J','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] vehcountstatusKZ_KZX_type_info = new String[]{'vehcountstatusKZ_KZX','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] totalOrders_type_info = new String[]{'totalOrders','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] uniqueId_type_info = new String[]{'uniqueId','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] IBus_type_info = new String[]{'IBus','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://service.chrysler.com','false','false'};
        private String[] field_order_type_info = new String[]{'customer','fan','fanName','fan1','fan1Name','contractYear','vipRuleIdNumber','vehcountstatusBA_C','vehcountstatusD_D1','vehcountstatusE_J','vehcountstatusKZ_KZX','totalOrders','uniqueId','IBus'};
    }
    public class Orders {
        public serviceChryslerCom.ArrayOfOrder orders;
        private String[] orders_type_info = new String[]{'orders','http://service.chrysler.com','ArrayOfOrder','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://service.chrysler.com','false','false'};
        private String[] field_order_type_info = new String[]{'orders'};
    }
    public class getOrders_element {
        public String value;
        private String[] value_type_info = new String[]{'value','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://service.chrysler.com','false','false'};
        private String[] field_order_type_info = new String[]{'value'};
    }
    public class getOrdersResponse_element {
        public serviceChryslerCom.Orders getOrdersReturn;
        private String[] getOrdersReturn_type_info = new String[]{'getOrdersReturn','http://service.chrysler.com','Orders','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://service.chrysler.com','false','false'};
        private String[] field_order_type_info = new String[]{'getOrdersReturn'};
    }
}