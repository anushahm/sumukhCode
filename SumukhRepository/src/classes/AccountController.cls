public class AccountController {
    @AuraEnabled
  public static List<AccountCl__c> getAccounts() {
    return [SELECT Id, name,Phone__c,Adress__c FROM AccountCl__c limit 10];
  }
}