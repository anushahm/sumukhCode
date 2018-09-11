public class RandomContactFactory {
  public static List<Contact> generateRandomContacts(Integer numOfContactGenerated, String lastnameGenerated)
         {
         List<Contact> conts = new List<Contact> ();
        for (Integer i = 0;i<numOfContactGenerated ;i++ )
        {
           conts.add(new Contact(firstname = 'Test'+i) ) ;
           } 
        
       return conts; 
        
    }   
    
}