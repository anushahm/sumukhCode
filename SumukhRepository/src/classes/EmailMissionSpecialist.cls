public class EmailMissionSpecialist {
  // Public method
 public void sendMail(String address, String subject, String body) {
      // Create an email message objec
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      String[] toAddresses = new String[] {address};
      mail.setToAddresses(toAddresses);
      mail.setSubject(subject);
       mail.setPlainTextBody(body);
       // Pass this email message to the built-in sendEmail method
      // of the Messaging class
// Call a helper method to inspect the returned results 
     Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });  inspectResults(results);
   }
 
   // Helper method
   private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
      Boolean sendResult = true;
      // sendEmail returns an array of result objects
      // Iterate through the list to inspect results.

      // In this class, the methods send only one email,
      // so we should have only one result.
      for (Messaging.SendEmailResult res : results) {
         if (res.isSuccess()) {

            System.debug('Email sent successfully');
         }

         else {
            sendResult = false;
            System.debug('The following errors occurred: ' + res.getErrors());                 
         }
      }
      return sendResult;

   }
 }