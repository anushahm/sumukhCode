global class ContactBulkRecords {
    public void insertrecords(){
     Account Acc=[Select id,Name From Account where Name='savings'];
    list<Contact> con=new list<Contact>();
               Contact conlist;
        for(integer i=1;i<=4700;i++)
        {
           conlist=new Contact(Title='brillio'+string.valueof(i),LastName='record'+string.valueof(i),AccountId=Acc.id);
           con.add(conlist);
        }
        insert con;
    }
    
}