global class EmailMessageDeletionBatch_TeamLease implements Database.Batchable<sObject>{
    
     global list<EmailMessage> start(Database.BatchableContext bc){
        list<EmailMessage> email=new list<EmailMessage>();
        email=[select id, parentid, activityid, createddate, headers, subject, fromname, fromaddress from emailmessage where createddate!=last_90_days];
        return email;
        }
     global void execute(Database.BatchableContext bc,List<EmailMessage> scope){
         
      delete scope;
     
     }
        global void finish(Database.BatchableContext bc){
    }
}