global class AttachmentDeletionBatch_TeamLease implements Database.Batchable<sObject>{
    
     global list<Attachment> start(Database.BatchableContext bc){
        list<Attachment> attach=new list<Attachment>();
        attach=[select id, parentid,createddate from Attachment where createddate!=last_90_days];
        return attach;
        }
     global void execute(Database.BatchableContext bc,List<Attachment> scope){
         
      delete scope;
     
     }
        global void finish(Database.BatchableContext bc){
       
     }
}