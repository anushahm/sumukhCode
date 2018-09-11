global class PostInstallClass implements InstallHandler {
  global void onInstall(InstallContext context) {


      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      
      String[] toAddresses = new String[] {'vinaykumar.s@brillio.com','priyanka.n@brillio.com'};
          mail.setToAddresses(toAddresses);
      mail.setSubject('install ayhtu');
      mail.setPlainTextBody('');
      
      
      
      mail.setHtmlBody('getting mail');
      Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail});
        
      
  }
  }