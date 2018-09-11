@isTest
public class TestVerifyDate{
@isTest static void testWithin30Days() {
        Date Datetest = VerifyDate.CheckDates(System.today(), System.today()+1);
        System.assertEquals(System.today()+10, Datetest);
    }
     
     @isTest static void testSetEndOfMonth() {
        Date Datetest = VerifyDate.CheckDates(System.today(), System.today()+52);
        System.assertEquals(System.today()+27, Datetest); 
     }
    }