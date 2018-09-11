trigger T_listtraining on Account (before insert) {
    List<Account> ac=trigger.new;
    
    
    Set<Account> acSet=new Set<Account>();
    acSet.addAll(ac);
    
    map<id,account> mymap=new map<id,account>();
    for(Account a:ac){
     mymap.put(a.id,a);  
    }
    mymap.keyset();
    mymap.get('');
    mymap.values();
    
}