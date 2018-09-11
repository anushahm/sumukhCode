public class AccountSelectController {
    public list<Account> selectedAccounts{get;set;}
    public list<wrapAccount> wrapAccountList{get;set;}
    public list<string> names{get;set;}
    
    public AccountSelectController(){
        if(wrapAccountList==null){
           wrapAccountList=new list<wrapAccount>();
            for(Account a:[select id,name,phone from Account limit 2]){
              wrapAccountList.add(new wrapAccount(a.name,a.id));
                    
  }
            for(Contact c:[select id,name,email,phone from contact limit 2]){
                 wrapAccountList.add(new wrapAccount(c.name,c.id));
            }
            
        }
    }
    
   public void processSelectedAccounts(){
        //selectedAccounts=new list<Account>();
        names=new list<string>();
        for(wrapAccount WrapAccountobj:wrapAccountList){
            if(WrapAccountobj.selected==true){
                names.add(WrapAccountobj.name);
            }
        }
        
    }
public class wrapAccount{
    public string name{get;set;}
    public string id{get;set;}
   // public opportunity {get;set;}
    public boolean selected{get;set;}
    public wrapAccount(string at,string b){
       name=at;
        id=b;
    }
 }
}