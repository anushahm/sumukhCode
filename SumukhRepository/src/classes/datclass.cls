public class datclass {
@AuraEnabled        
       public static list<AggregateResult> groupedResults1(){      
          AggregateResult[] groupedResults1=[SELECT Date__c,SUM(ML__c),SUM(Booked__c),SUM(Actuals__c) FROM commit__c  group by Date__c ];
             for(AggregateResult ar:groupedResults1)
             {
                 //system.debug('date' + ar.get('Date__c'));
                 System.debug('ML Sum' + ar.get('expr0'));
                  System.debug('booked sum' + ar.get('expr1'));
                  System.debug('actuals sum' + ar.get('expr2'));
             }
    
return groupedResults1;       
}
}