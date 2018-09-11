public class N_EmailNotification_24{
      public static void testopportunitymail(){
        Map<String,String> userIdtoEmailId=new Map<String,String>();
        Map<String,String> OpptoCloseDate = new Map<String,String>();
        Map<String,String> OppNameToOppId=new Map<String,String>();
        Map<String,Map<String,String>> UserToOpp = new Map<String,Map<String,String>>();
        list<user> userlist=new list<user>();
        userlist=[select id ,Email from user where isActive=true];
        for(user UserName:userList){
            userIdtoEmailId.put(UserName.Id,UserName.email);
        }
        for(Opportunity opp:[select id,name,closedate,stageName,Ownerid from Opportunity where closedate=N_days_ago:1  and stageName NOT In ('closed won','closed lost','closed shelved') and  Ownerid in:userlist]){
               OppNameToOppId.put(opp.name,opp.Id);
            if( UserToOpp.containsKey(userIdtoEmailId.get(opp.OwnerId)) ){
                OpptoCloseDate = new Map<String,String>();
                OpptoCloseDate.put(opp.Name,opp.CloseDate+'');
                UserToOpp.get(userIdtoEmailId.get(opp.OwnerId)).put(opp.Name,opp.CloseDate.format()+'');
            }
            else{
                OpptoCloseDate = new Map<String,String>();
                OpptoCloseDate.put(opp.Name,opp.CloseDate.format()+'');
                UserToOpp.put(userIdtoEmailId.get(opp.OwnerId),OpptoCloseDate);
            }
        }
        for(string usernames:UserToOpp.keyset()){
            string bodyMessage='';
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {'vijay.s=@brillio.com','anusha.m@brillio.com'};
            mail.setSubject('Perform action on overdue closeddate opportunites');

            mail.setToAddresses(toAddresses);
            bodyMessage='<html><head><style>table{font-family: arial, sans-serif;border-collapse: collapse;width: 100%;}td, th {border: 1px solid #dddddd;text-align: left;padding: 8px;}tr:nth-child(even) {background-color: #dddddd;}</style></head><body>Hi, <br/><br/> please find below list of opprtunities whose closedate is overdue for more than 10 days,perform action on these opprtunities.<br/><br/><br/><table><tr><th>opportunity Name</th><th>closed Date</th></tr>';
            for(String Oppname : UserToOpp.get(usernames).keyset()){
                mail.setPlainTextBody('');
                bodyMessage+='<tr><td><a href="https://brillio.lightning.force.com/'+OppNameToOppId.get(Oppname)+'">'+Oppname+'</a></td><td>'+UserToOpp.get(usernames).get(Oppname)+'</td></tr>';
            }
            bodyMessage+='</table> </br>Thanks,<br/>Amit</body></html>';
            mail.setHtmlBody(bodyMessage);
            system.debug('---data-----'+usernames);
             Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail});
        }
     }
}