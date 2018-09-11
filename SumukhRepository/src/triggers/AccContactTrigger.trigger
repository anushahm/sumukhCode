trigger AccContactTrigger on Account(after insert,after update){
   /*Contact[] updatedContacts = new Contact[0];
  Account[] changedAccounts = new Account[0];
    list<id> ids=new list<id>();
    for(account a:Trigger.new){
        if(a.AccName__c!=trigger.oldmap.get(a.id).AccName__c)
             {
           ids.add(a.id);
        }
    }*/
 /*for(Contact c:[select id,accountid,AcontName__c from Contact where accountid in :ids]){
      account a = trigger.newmap.get(c.accountid);  
     system.debug('-----------6546---'+a);
     system.debug('-------5874----'+c);
    c.AcontName__c = a.AccName__c;
     updatedContacts.add(c);  
	upsert updatedContacts;
      }*/
       
     /* Map<Id, Account> accts = new Map<Id, Account>();
    
    for (Integer i = 0; i < Trigger.new.size(); i++)
      {   
        if ((Trigger.old[i].AccName__c != Trigger.new[i].AccName__c))
        {
         accts.put(Trigger.old[i].id,Trigger.new[i]);
        }
       
      }*/
  
    
 /*List<Contact> updatedContacts = new List<Contact>();
    for (Contact c : [SELECT id, accountid, AcontName__c FROM contact
                      WHERE accountId in :accts.keySet()])
          {
        Account parentAccount = accts.get(c.accountid);
        c.AcontName__c = parentAccount.AccName__c;
        updatedContacts.add(c);
           }
        update updatedContacts;*/
   /* if(accts.size()>0){
      Database.executeBatch(new UpdateAccountArea(accts));
        }*/
}