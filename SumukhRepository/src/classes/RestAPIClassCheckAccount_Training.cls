@RestResource(urlMapping='/ShowMyAccountsDetails/*') //Name:which we are going to extract outside of the salesforce
global with sharing class RestAPIClassCheckAccount_Training{
    
    @HttpGet /*extract the data out of salesforce : whenever third party tool invoke this 
Apex method they are able to  extract data from salesforce*/
    
    global static List<Account> Accountlist()
    
    { // it would be returning more than one account
        
        List<Account> lst;
        
        try{
            lst=[select name,phone from Account limit 10];
            Return lst;
            }
        
        catch(exception e){
            system.debug('Error' +e.getMessage());
            }
        return lst;
    }
}