global class AttachmentTesting implements Database.Batchable<sObject>{
    
     global list<Attachment> start(Database.BatchableContext bc){
        list<Attachment> email=new list<Attachment>();
         email=[select id from Attachment];
        return email;
        }
     global void execute(Database.BatchableContext bc,List<Attachment> scope){
         
      system.debug('Attachmnets Count' +scope.size());
     
     }
        global void finish(Database.BatchableContext bc){
    }
}