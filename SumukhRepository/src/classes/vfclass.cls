public class vfclass {
    
    public list<Account> Accountmethod(){

   list<Account> acs=new list<Account>();
        acs=[select id,Name from Account];
        return acs;
 }   
}