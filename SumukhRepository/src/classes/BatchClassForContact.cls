Global class BatchClassForContact implements Database.Batchable<sObject>,Database.Stateful {
    	    global Integer recordsProcessed = 0;

	Global Database.QueryLocator start(Database.BatchableContext BC) {
	  return Database.getQueryLocator('SELECT Id,Name,AccName__c,(SELECT Id,AcontName__c FROM Contacts) FROM Account Where Name=\'Savings\'');
		
        //return Database.getQueryLocator(query);
           }
		Global void execute(Database.BatchableContext BC, List<Account> scope) {
			List<Contact> contacts = new List<Contact>();
              system.debug( '----conta-----'+contacts);

        for (Account account : scope) {
            for (Contact contact : account.contacts){
               contact.AcontName__c=account.AccName__c;
                // add contact to list to be updated
                contacts.add(contact);
                // increment the instance member counter
                recordsProcessed = recordsProcessed + 1;
                system.debug(recordsProcessed+'cgfdgdfg');
               // system.debug("-----dhdsjd-----"+recordsProcessed);
            }
        }
        update contacts;
            
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