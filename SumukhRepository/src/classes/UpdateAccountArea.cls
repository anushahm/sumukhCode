global class UpdateAccountArea implements Database.Batchable<sObject> {
       	  global Integer recordsProcessed = 0;

         Map<Id, Account> acctsMap = new Map<Id, Account>();

		
		global UpdateAccountArea(Map<Id, Account> accts){
		acctsMap = accts;
			}
		global Database.QueryLocator start(Database.BatchableContext BC) {
		return DataBase.getQueryLocator([SELECT  Id,Name,AcontName__c,accountid from contact where accountid IN:acctsMap.keySet()]);
			}
       global void execute(Database.BatchableContext BC,List<contact> scopeAcc) {
           system.debug('---6783687---');
             
             for (Integer i=0;i<scopeAcc.size();i++){
           scopeAcc.get(i).AcontName__c=acctsMap.get(scopeAcc.get(i).accountid).AccName__c ;
           system.debug('-----jffyu-----' +scopeAcc);
        }
        update scopeAcc;
            
 }

    Global void finish(Database.BatchableContext BC)
    {
       AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {a.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
           //mail.ToAddresses = new string[]{ a.CreatedBy.Email,'srinidhi.m@brillio.com'};
            mail.setSubject('New Batch contact records update '+ a.Status);
            mail.setPlainTextBody('records processed are' + a.TotalJobItems);
               // + a.TotalJobItems +  'with '+ a.NumberOfErrors + 'failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }    
}