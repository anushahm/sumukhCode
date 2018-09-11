public  with sharing class ContactController {
    @AuraEnabled
    public static List<Contact> getcontacts(){
        
        List <Contact> contacts=[ SELECT Id,name,phone,leadsource from Contact];
          return contacts;
        }
  

}