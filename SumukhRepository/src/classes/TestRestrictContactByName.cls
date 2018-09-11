@istest
public class TestRestrictContactByName {
 @istest public static void method()
    {
      List<Contact> listContact= new List<Contact>();
        Contact c1 = new Contact(FirstName='anu', LastName='m' , email='abc@hm.com');
        Contact c2 = new Contact(FirstName='ram', LastName = 'INVALIDNAME',email='der@hg.com');
        contact c3=new contact(FirstName='INVALIDNAME', LastName='INVALIDNAME',email='INVALIDEMAIL');
        test.startTest();
        listContact.add(c1);
        listContact.add(c2);
        listContact.add(c3); 
        test.stopTest();
}
}