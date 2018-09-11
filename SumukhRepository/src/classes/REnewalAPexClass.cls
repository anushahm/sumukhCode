public class REnewalAPexClass {
@AuraEnabled        
       
public static AggregateResult getRenewals(){      

    return [SELECT SUM(OpportunitiesCount__c) renewals FROM Opportunity ];
}      
}