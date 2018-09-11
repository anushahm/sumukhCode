trigger VfTrigger on Account (before insert,before update) {
	Map<string,Id> mac=new Map<string,Id>();
    set<string> Setacc=new set<string>();
    	for(Account acc:trigger.new)
        {
      		Setacc.add(acc.Name); 
        }
    for(Account acc:[SELECT Id,Name from Account where name In:Setacc])
    {
        mac.put(acc.Name,acc.id);
    }
    	for(Account acc:Trigger.new)
        {
            if( mac.containsKey(acc.Name) && mac.get(acc.Name) != acc.Id )
            {
            acc.addError( 'There is already another Account with the same Name');
            }
        }
        
}