public  with sharing class Tableclass {
@AuraEnabled
    public static list<commit__c> getTabledata(){
        return [SELECT Date__c, ML__c,  practice__c, Booked__c, Actuals__c FROM commit__c];
    }
}