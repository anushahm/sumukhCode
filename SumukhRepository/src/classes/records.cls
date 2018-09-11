public class records {
    public list<contact> getcon(){
        list<contact>con=new list<contact>();
        con=[select id,name,AccountId,CreatedById,CleanStatus from contact limit 2];
        return con;
    }
    public list<Account>getacc(){
        list<Account> acc=new list<Account>();
        acc=[select id,name,AccountNumber,phone,CleanStatus	 from Account limit 2];
        return acc;
    }
    public list<opportunity>getopp(){
        list<opportunity> op=new list<opportunity>();
        op=[select id,name,Amount,LastModifiedById from opportunity limit 2];
        return op;
    }
    public list<lead> getled(){
        list<lead> ld=new list<lead>();
        ld=[select id,name,Company,CleanStatus from lead limit 2];
        return ld;
    }
     public list<case> getcs(){
        list<case> c=new list<case>();
        c=[select id,Type,Status,CaseNumber from case limit 2];
        return c;
    }
    
}