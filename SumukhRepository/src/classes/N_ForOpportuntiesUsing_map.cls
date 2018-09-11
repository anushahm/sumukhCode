public class N_ForOpportuntiesUsing_map{
    
    public static void Test(){
        Map<String,String> userIdToName=new Map<String,String>();
                Map<String,String> userIdname=new Map<String,String>();

        
        System.debug('---1.userIdToName----' +userIdToName);
        
        Map<String,String> OpptoCloseDate = new Map<String,String>();
        
        System.debug('---2.OpptoCloseDate----' +OpptoCloseDate);
        
        
        
        Map<String,Map<String,String>> UserToOpp = new Map<String,Map<String,String>>();
        System.debug('---3.UserToOpp----' +UserToOpp);
        
        list<user> userlist=new list<user>();
        userlist=[select id ,name,email from user where isActive=true];
        System.debug('---4.userlist----' +userlist);
        
        for(user UserName:userList){
            userIdToName.put(UserName.Id,UserName.email);
           // userIdname.put(UserName.Id,UserName.Name);
        }
        System.debug('---5.userIdToNameafterFor----' +userIdToName);
        
        
        //list<opportunity> Opportunitylist=new list<Opportunity>();
        for(Opportunity opp:[select id,name,closedate,stageName,Ownerid from Opportunity where closedate>:system.today() and stageName NOT In ('closed won','closed lost','closed shelved') and  Ownerid in:userlist]){
            //for(Opportunity opp:[select id,name,closedate,stageName,Ownerid from Opportunity where closedate < LAST_N_DAYS:20  and stageName NOT In ('closed won','closed lost','closed shelved') and  Ownerid in:userlist]){
            System.debug('---6.OpportunityQuery----' +opp);
            
            if( UserToOpp.containsKey(userIdToName.get(opp.OwnerId)) ){
                OpptoCloseDate = new Map<String,String>();
                OpptoCloseDate.put(opp.Name,opp.CloseDate.format()+'');
                UserToOpp.get(userIdToName.get(opp.OwnerId)).put(opp.Name,opp.CloseDate.format()+'');
                system.debug('---7A.UserToOpp---'+UserToOpp);
                
                system.debug('---7B.UserToOppInsideIf---'+UserToOpp);
            }
            
            else{
                OpptoCloseDate = new Map<String,String>();
                OpptoCloseDate.put(opp.Name,opp.CloseDate.format()+'');
                UserToOpp.put(userIdToName.get(opp.OwnerId),OpptoCloseDate);
                system.debug('---8.UserToOppinsideelse---'+UserToOpp);
            }
        }
        system.debug('-9.UserToOppOutsideOutsidefor--'+UserToOpp);     
        
        
        
       for(string usernames:UserToOpp.keyset()){
            string bodyMessage='';
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {usernames};
                mail.setToAddresses(toAddresses);
            system.debug('--Toaddress--' +toAddresses);
            bodyMessage='<html><head><style>table{font-family: arial, sans-serif;border-collapse: collapse;width: 100%;}td, th {border: 1px solid #dddddd;text-align: left;padding: 8px;}tr:nth-child(even) {background-color: #dddddd;}</style></head><body>Hi '+ '<br/><br/> <table><tr><th>opportunity Name</th><th>closed Date</th></tr>';
            //bodyMessage+= 'opportunity closed Date as '+'<br/><br/>';
            for(String Oppname : UserToOpp.get(usernames).keyset()){
                system.debug('looping---'+Oppname);
                mail.setPlainTextBody('');
                bodyMessage+='<tr><td>'+Oppname+'</td><td>'+UserToOpp.get(usernames).get(Oppname)+'</td></tr>';
                //bodyMessage+= Oppname+'= '+UserToOpp.get(usernames).get(Oppname)+'<br/><br/>';
                system.debug('loooooo  '+bodyMessage);
            }
            bodyMessage+='</table> </br>Thanks</body></html>';
            mail.setHtmlBody(bodyMessage);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail});
        }
        
        
        /*for(string usernames:UserToOpp.keyset()){
            //for(String Oppname : UserToOpp.get(usernames).keyset()){
            
            string bodyMessage='';
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {'anusha.m@brillio.com'};
            mail.setToAddresses(toAddresses);
            bodyMessage='<html><head><style>table{font-family: arial, sans-serif;border-collapse: collapse;width: 100%;}td, th {border: 1px solid #dddddd;text-align: left;padding: 8px;}tr:nth-child(even) {background-color: #dddddd;}</style></head><body>Hi '+ '<br/><br/> <table><tr><th>UserName</th><th>opportunity Name</th><th>closed Date</th></tr>';
            //bodyMessage+= 'opportunity closed Date as '+'<br/><br/>';
            //system.debug('looping---'+Oppname);
            mail.setPlainTextBody('');
            bodyMessage+='<tr><td>'+usernames+'</td><td>'+UserToOpp.get(usernames).keyset()+'</td><td>'+UserToOpp.get(usernames)+'</td></tr>';
            //bodyMessage+= Oppname+'= '+UserToOpp.get(usernames).get(Oppname)+'<br/><br/>'; usernames
            system.debug('loooooo  '+bodyMessage);
            bodyMessage+='</table> </br>Thanks</body></html>';
            mail.setHtmlBody(bodyMessage);
            
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail});
        }   */    
    }
}