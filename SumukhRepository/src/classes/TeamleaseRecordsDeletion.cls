public with sharing  class TeamleaseRecordsDeletion{
    
    public static void deleteEmailAndAttachmentrecords(){
        
        list<EmailMessage> email=new list<EmailMessage>();
        email=[select id, parentid, activityid, createddate, headers, subject, fromname, fromaddress from emailmessage where createddate!=last_90_days];
        delete email;
        
        list<Attachment> attach=new list<Attachment>();
        attach=[select id, parentid,createddate from Attachment where createddate!=last_90_days];
        delete attach;
     }
}