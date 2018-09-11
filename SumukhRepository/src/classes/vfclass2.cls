public class vfclass2 {
	public list<Account> acc1 = new list<account>();
     public Boolean rendered{get;set;}
    public List<aTableRow> tableRows { get; set; }
    public class aTableRow {
    public Contact theContact { get; set; }
    public Account theAccount { get; set; }
    public Boolean isSelected { get; set; }
    public aTableRow(Contact c,Account a,Boolean b) {
      theContact = c;
      theAccount = a;
      isSelected = b;
    }
  }
 
  public vfclass2() {

    tableRows = new List<aTableRow>();
    for(Contact c:[select id,firstname,lastname,account.id,account.name from contact limit 5]) {
      tableRows.add(new aTableRow(c,c.account,false));
    }
  }
    public pageReference Accountlist(){
    acc1 = [select id,name,AccountNumber,Phone,CreatedDate from Account order by CreatedDate DESC]; 
    rendered  = true; 
    return null;
    }
   public list<account> getaccounts(){
   return acc1;
   }


}