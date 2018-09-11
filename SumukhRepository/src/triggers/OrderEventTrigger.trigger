trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<task> task= new List<task>();
     

    //User owner=[select id from User where Name='Fabrizio' limit 1];
    
    for (Order_Event__e event : Trigger.new){
        if(event.Has_Shipped__c == true){
            Task tsk= new Task ();
            tsk.Priority = 'Medium';
            tsk.Status = 'New';
            tsk.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            tsk.OwnerId = userinfo.getuserid();
            task.add(tsk);           
        }

    }

    insert task;

}