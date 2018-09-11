public with sharing  class ContactEg {
    @AuraEnabled
    public list<contact> getcontacts(){
        list<contact> contacts=[SELECT Id, LastName, FirstName, MailingStreet, Email FROM Contact];
        return contacts;
        
    }

}