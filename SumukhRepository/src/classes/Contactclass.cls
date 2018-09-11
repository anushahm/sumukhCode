public class Contactclass {
@AuraEnabled
    public list<contact> getcontacts(){
   Return[SELECT Id, Name, OtherCountry FROM Contact limit 10];
}
}