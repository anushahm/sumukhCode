/* Problem Statement -----
 * write a trigger for every time a lead is created,an account will be created or updated 
 * on the basis of email,if lead's email is in any existing accounts email then trigger will update, the account name 
 * to leads last name,if lead's email doesn't belongs to any account then a new account should be created with name 
 * as lead lastname and email as a leads email.*/

trigger T_MapTranForLeadCreation on Lead (before insert) {
    
    List<Account> Accountlist=new list<Account>();
    list<string> leadEmails=new list<string>();
    
    for(Lead ld:Trigger.New)
    {
     leadEmails.add(ld.email);   
    }
    
    if(leadEmails.size()>0){
      Accountlist=[select id,name,MyAp_123__email__c from Account where MyAp_123__email__c in:leadEmails];  
    }
    
    if(Accountlist.size()>0)
    {
      for(Lead l:trigger.new) 
      {
          for(Account a:Accountlist){
              if(l.email==a.MyAp_123__email__c){
                  a.name=l.LastName;
              }
          }
      }
    }
    else{
        for(Lead l:trigger.New){
        Account acc=new Account(Name=l.lastname,MyAp_123__email__c=l.email);
            Accountlist.add(acc);
      }
    }
upsert Accountlist;
}