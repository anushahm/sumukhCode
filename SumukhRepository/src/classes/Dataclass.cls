public with sharing class Dataclass {
@AuraEnabled
    public static list<commit__c> groupedResults(){
        //aggresult[] groupdResults //list<AggregateResult> groupedResults=
       //return [SELECT Date__c, SUM(ML__c),practice__c, SUM(Booked__c), SUM(Actuals__c)  FROM commit__c  group by Date__c,practice__c];
       return[SELECT Date__c, practice__c,ML__c,Actuals__c,Booked__c FROM commit__c order by Date__c];
       // for(AggregateResult ar : groupedResults)  {
//System.debug('sum of result' + ar.get('expr0'));
       // }
        //return groupedResults();
    // return[SELECT Date__c,SUM(ML__c),practice__c FROM commit__c WHERE Date__c = 2017-01-01 group by practice__c,Date__c]; //group by Date__c,practice__c];
   //AggregateResult[] groupedResults = [SELECT SUM(ML__c)aver FROM commit__c];
       
        //return sum = groupedResults[0].get('aver');
        //return[select SUM(ML__c) from commit__c where Date__c=1/1/2017];
   // double sop=0;
     //AggregateResult[] sumResult= [SELECT Date__c,SUM(ML__c)Su From commit__c group by Date__c];
       //sop=(Double) sumResult.get('Su');
}
    @AuraEnabled        
       public static list<AggregateResult> groupedResults1(){      
          AggregateResult[] groupedResults1=[SELECT SUM(ML__c),SUM(Booked__c),SUM(Actuals__c) FROM commit__c group by Date__c];
             for(AggregateResult ar:groupedResults1)
             {
                 System.debug('ML Sum' + ar.get('expr0'));
                  System.debug('booked sum' + ar.get('expr1'));
                  System.debug('actuals sum' + ar.get('expr2'));
             }
    
     //Integer sum = (Integer)groupedResults[0].get('renewals');
     //system.debug('sum:' +sum);
          // return sum;
          
        
return groupedResults1;       
}
}