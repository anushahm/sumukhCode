public class Myreferenceclass {
    public list<Account> acc{get; set;}
    public list<Contact> con{get; set;}
    public list<opportunity> opp{get; set;}
    public list<lead> ld{get;set;}
    public List<MyWrapper> wrapper {get; set;}
    public  Myreferenceclass(){
        acc=[select id,name,phone from Account];
        con=[select id,name,phone,AccountId from Contact];
        opp=[select id,name,Amount,LastModifiedById from opportunity];
         ld=[select id,name,Company,CleanStatus,phone from lead];
        wrapper=new List<MyWrapper>();
        for(integer i=0;i<=2;i++)
            wrapper.add(new Mywrapper(acc[i],con[i],opp[i],ld[i]));
        }
    public class Mywrapper
    {
        public Account accr {get;set;}
        public Contact conr {get;set;}
        public opportunity op {get;set;}
        public lead led{get; set;}
        public Mywrapper(Account a,contact c,opportunity o,lead l){
            accr=a;
            conr=c;
            op=o;
            led=l;
        }
    }
    
   

}