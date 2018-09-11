public class Email_for_list_of_users{
    
    public static void testopportunitymail(){
        
        
        Map<String,String> userIdToName=new Map<String,String>();

        list<user> userlist=new list<user>();
        userlist=[select id ,name from user where isActive=true];
        
        for(user Username:userlist){
            userIdToName.put(Username.Id,Username.Name);
        }
        
        
        
        list<opportunity> Opportunitylist=new list<Opportunity>();
        Opportunitylist=[select id,name,closedate,stageName,Ownerid from Opportunity where closedate>:system.today() and stageName NOT In ('closed won','closed lost','closed shelved') and  Ownerid in:userlist];
        
        system.debug('---Opportunity List---' +Opportunitylist.size() + ' ' +Opportunitylist);
        
        map<string,list<opportunity>> UniqueUserList=new Map<string,list<Opportunity>>();
        
        for(Opportunity opp:Opportunitylist){
           // if(opp.closedate>system.today() && ( opp.StageName!='Closed won' && opp.stageName!='Closed Lost')){
            if(UniqueUserList.containskey(opp.OwnerId)){
                list<Opportunity> temp=new list<opportunity>();
                temp=UniqueUserList.get(opp.OwnerId);
                temp.add(opp);
                 system.debug('--temp-    if--' +temp.size());
				UniqueUserList.put(opp.OwnerId,temp);
                system.debug('--OpportunitylistinsideIf---' +UniqueUserList.size()+'  ' +UniqueUserList);
              }  
            else{
                list<opportunity> temp1=new list<Opportunity>();
                temp1.add(opp);
                 system.debug('--temp-     else--' +temp1.size());
                UniqueUserList.put(opp.OwnerId,temp1);  
              system.debug('--OpportunitylistinsideElse---' +UniqueUserList.size()+'  ' +UniqueUserList);
            }
            

        }
     system.debug('--CompletionOfLoopOutput---' +UniqueUserList.size()+ ' '+UniqueUserList);

     system.debug('--CompletionOfLoopOutput---' +UniqueUserList.size()+ ' '+UniqueUserList.keyset());
        
        for(string UserListWithOpportunity:UniqueUserList.keyset()){
           // system.debug('--TestOutput---'+UserListWithOpportunity.get(UniqueUserList));
            
            
            
            
        }

    }
}