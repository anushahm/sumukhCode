public class AccountClass {
    public list<Account> acc1 = new list<account>();
     public Account acc{get;set;}
    public Boolean rendered{get;set;}
    
   public AccountClass()
  {
      acc=new Account();
  }
    public void save()
    {
     insert acc;
    }
   /* public PageReference Move(){    
    PageReference Page = new PageReference('/apex/vfname');
    Page.setRedirect(true);
    return Page;
    }*/
    /*public list<Account> getrecords()
    {
        List<Account> a=new list<Account>();
        a=[select id,Name,AccountNumber,Phone from Account];
        return a;
    }*/
    public pageReference Accountlist(){
    acc1 = [select id,name,AccountNumber,Phone,CreatedDate from Account order by CreatedDate DESC]; 
    rendered  = true; 
    return null;
    }
   public list<account> getaccounts(){
   return acc1;
   }

}