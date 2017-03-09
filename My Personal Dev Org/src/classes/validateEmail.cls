public class validateEmail 
{
    public string eid {get;set;}
    public Integer StatusNbr {get;set;}
    public string LocalPart {get;set;}
    public string DomainPart {get;set;}
    public string StatusDescription {get;set;}
    
    
    public pagereference validate()
    {

        wsStrikeironCom wsc = new wsStrikeironCom();
        wsStrikeironCom.RegisteredUser ru = new wsStrikeironCom.RegisteredUser();
        ru.UserID = 'mansi.nanda@tcs.com';
        ru.Password = 'Feb@2012';
        system.debug('Registered User...............................................'+ru);
        
        
        wsStrikeironCom.LicenseInfo licinfo = new wsStrikeironCom.LicenseInfo();
        licinfo.RegisteredUser = ru;
        system.debug('LicenseInfo...............................................'+licinfo);
        
        
        wwwStrikeironCom ws = new wwwStrikeironCom();
        wwwStrikeironCom.EmailVerificationSoap es = new wwwStrikeironCom.EmailVerificationSoap();
        es.LicenseInfo = licinfo;
        
        wwwStrikeironCom.SIWsOutputOfVerifyEmailRecord vemail = new wwwStrikeironCom.SIWsOutputOfVerifyEmailRecord();
        vemail = es.VerifyEmail(eid,90);
        
        StatusNbr = vemail.ServiceStatus.StatusNbr;
        StatusDescription = vemail.ServiceStatus.StatusDescription;
        Localpart = vemail.ServiceResult.LocalPart;
        DomainPart = vemail.ServiceResult.DomainPart;
        
        system.debug(' ServiceStatus.....................................'+vemail.ServiceStatus);
        system.debug(' ServiceStatus.StatusNbr....................................'+vemail.ServiceStatus.StatusNbr);
        system.debug(' ServiceStatus.StatusDescription....................................'+vemail.ServiceStatus.StatusDescription);
        
        system.debug(' ServiceResult.EMail....................................'+vemail.ServiceResult.EMail);
        system.debug(' ServiceResult.LocalPart....................................'+vemail.ServiceResult.LocalPart);
        system.debug(' ServiceResult.DomainPart....................................'+vemail.ServiceResult.DomainPart);
        system.debug(' ServiceResult.RecommendedRetry....................................'+vemail.ServiceResult.RecommendedRetry);
        return null;
    }

}