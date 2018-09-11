public class ContactAndLeadSearch {
public static List<List<Sobject>>  searchContactsAndLeads(String lastname)
{
   List<list<Sobject>> Searchlist=[FIND 'smith' IN ALL  FIELDS
                                  RETURNING 
                                  Contact(lastname),Lead(lastname)]; 
    return Searchlist;
                                  
}
}