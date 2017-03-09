trigger Hiring_Manager_Job_Share on SmartCharts__Sub_Contract__c (after insert) 
{

    // We only execute the trigger after a Job record has been inserted 
    // because we need the Id of the Job record to already exist.
    if(trigger.isInsert)
    {
            system.debug('Kundan..................... '); 
            // Job_Share is the "Share" table that was created when the
            // Organization Wide Default sharing setting was set to "Private".
            // Allocate storage for a list of Job__Share records.
            List<SmartCharts__Sub_Contract__Share> jobShares  = new List<SmartCharts__Sub_Contract__Share>();

            // For each of the Job records being inserted, do the following:
            for(SmartCharts__Sub_Contract__c job : trigger.new)
            {
        
                // Create a new Job__Share record to be inserted in to the Job_Share table.
                SmartCharts__Sub_Contract__Share hiringManagerShare = new SmartCharts__Sub_Contract__Share();
                    
                // Populate the Job__Share record with the ID of the record to be shared.
                hiringManagerShare.ParentId = job.Id;
                    
                // Then, set the ID of user or group being granted access. In this case,
                // we’re setting the Id of the Hiring Manager that was specified by 
                // the Recruiter in the Hiring_Manager__c lookup field on the Job record.  
                // (See Image 1 to review the Job object's schema.)
                hiringManagerShare.UserOrGroupId = job.SmartCharts__User__c;
                    
                // Specify that the Hiring Manager should have edit access for 
                // this particular Job record.
                hiringManagerShare.AccessLevel = 'edit';
                    
                // Specify that the reason the Hiring Manager can edit the record is 
                // because he’s the Hiring Manager.
                // (Hiring_Manager_Access__c is the Apex Sharing Reason that we defined earlier.)
                hiringManagerShare.RowCause = Schema.SmartCharts__Sub_Contract__Share.RowCause.Hiring_Manager_Access__c;
                    
                // Add the new Share record to the list of new Share records.
                jobShares.add(hiringManagerShare);
            }
        
    // Insert all of the newly created Share records and capture save result 
    Database.SaveResult[] jobShareInsertResult = Database.insert(jobShares,false);
    system.debug('Bendale..................... ');     
    // Error handling code omitted for readability.
    }
}