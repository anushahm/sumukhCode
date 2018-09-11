@isTest
class testInstallScript{

 @isTest static void testInstallScript1() {
  PostInstallClass postinstall = new PostInstallClass();
    Test.testInstall(postinstall, null);
    Test.testInstall(postinstall, new Version(1,0), true);
   // List<Account> a = [Select id, name from Account where name ='Newco'];
   // System.assertEquals(a.size(), 1, 'Account not found');
  }
}