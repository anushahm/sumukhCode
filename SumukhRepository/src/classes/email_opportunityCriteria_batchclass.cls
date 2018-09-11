Global class email_opportunityCriteria_batchclass implements Database.Batchable<sObject>,Database.Stateful {
    	    global Integer recordsProcessed = 0;

	Global Database.QueryLocator start(Database.BatchableContext BC) {
	  return Database.getQueryLocator('select id,name,closedate,stagename from opportunity where closedate>TODAY group by OwnerId');
		
        //return Database.getQueryLocator(query);
           }
		Global void execute(Database.BatchableContext BC, List<Opportunity> scope) {
		
	}
    Global void finish(Database.BatchableContext BC)
    {
       System.debug(recordsProcessed + ' records processed!');
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {a.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
           //mail.ToAddresses = new string[]{ a.CreatedBy.Email,'srinidhi.m@brillio.com'};
            mail.setSubject('contact records update ' + a.Status);
            mail.setPlainTextBody('records processed ' + a.TotalJobItems +
           'with '+ a.NumberOfErrors + ' failures.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }    
    }