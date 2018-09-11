trigger AccountAddressTrigger on Account (before insert,before update) {
    
    list <Account> a=new list <Account>();
    for(Account a:trigger.new)
    {
        if(a.match_Billing_Address__c==true && a.BillingPostalCode!=null)
        {
            a.BillingPostalCode=a.ShippingPostalcode;
        }
    }
    

}