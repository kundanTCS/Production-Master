global class emailToCase implements Messaging.InboundEmailHandler
{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,Messaging.InboundEnvelope env)
    {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String myPlainText= '';
        String csenumber='';
        myPlainText = email.plainTextBody;
        List<String> toAddresses = new List<String>();
        List<String> toCCAddresses = new List<String>();
        String mailsub='';
        String mailbody='';
        
        try 
        {
            String mailsbjct = email.subject;
            Integer strtIndex = mailsbjct.indexof('(',0) ;

            System.debug(strtIndex);
            Integer endIndex = mailsbjct.indexof(')',0);

            System.debug(endIndex);
            if(strtIndex != -1 && endIndex != -1)
            {
                csenumber = mailsbjct.substring(strtIndex+1,endIndex);
            }

            Contact vCon = [Select Id,Name,Email From Contact Where Email = :email.fromAddress Limit 1];

            Case[] existing_case = [Select Id,Casenumber,OwnerId from Case where Casenumber =: csenumber limit 1];
            if (existing_case.size()>0)
            {
                CaseComment cscomment = new CaseComment();
                cscomment.ParentId = existing_case[0].Id;
                cscomment.CommentBody = email.plainTextbody;
                insert cscomment;
            }
            else
            {
                Case c = new Case(Status='New',Origin='Email',ContactId=vCon.Id,Subject=email.subject,Description=email.plainTextbody);
                insert c;
                
                
                Case c1 = [Select CaseNumber,ownerId from Case where id =:c.Id];                
                User u = [Select id, email from User where id=:c1.ownerId];     
                toAddresses.add(u.email);
                toCCAddresses.add(vCon.email);

                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    Messaging.EmailFileAttachment[] fileAttachments = new Messaging.EmailFileAttachment[1];
                    Messaging.EmailFileAttachment fileAttachment = new Messaging.EmailFileAttachment();
                    
                    mail.setToAddresses(toAddresses);
                    mail.setReplyTo('emailtocase@67nh95xug29eoy9b0ayq3826i.in.salesforce.com');
                    mail.setCCAddresses(toCCAddresses);
                    mailsub ='Case Number : ('+c1.CaseNumber+')';
                    mail.setSubject(mailsub);
                    mailbody='A new Case Has been Assigned to you';
                    mail.setHtmlBody(mailbody);
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                
            }
        }
        catch (QueryException e)
        {
            System.debug('Query Issue: ' + e);
        }
        result.success = true;
        return result;
  }
}