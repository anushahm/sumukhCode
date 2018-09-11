({        
	loadFieldsnValues : function(component,event,NoOfClone) {
        console.log('NoOfClone### :  '+NoOfClone);
		var action=component.get("c.makeNewRecords");
		action.setParams({

			recordId : component.get("v.recordId"),	
            NoOfRecords : NoOfClone,		
            arry : '',
            listSW : '',
            isReady : false,
            changeList : ''
		});

		action.setCallback(this, function(a) {
            console.log('State : '+a.getState());
			if (a.getState() === "SUCCESS") {  
                console.log('state : '+a.getState());
                //component.set("v.listofsObject", a.getReturnValue());
                console.log('ListOF object to be created : '+JSON.stringify(a.getReturnValue()));
				//console.log('record 1 : '+component.get("v.listofsObject[0].Name"));                
			} else if (a.getState() === "ERROR") {
				$A.log("Errors", a.getError());
			}
		});
		$A.enqueueAction(action);          
	},
    
    init1 : function(component,event) {
        console.log('in init of controller');
        console.log('recid:  '+component.get("v.recordId"));
        var action = component.get("c.populate");         
                    
		action.setParams({

			recordId : component.get("v.recordId"),			

		});

		action.setCallback(this, function(a) {

			if (a.getState() === "SUCCESS") {  
                component.set("v.wrecord", '');
                component.set("v.wrecord", a.getReturnValue());
                console.log('stringify y : '+JSON.stringify(a.getReturnValue()));
				console.log('object name : '+component.get("v.wrecord.obj"));
                console.log('Account name : '+component.get("v.wrecord.record.Name"));
			} else if (a.getState() === "ERROR") {

				$A.log("Errors", a.getError());
			}

		});
		$A.enqueueAction(action);
    },
    
    init2 : function(component,event) {
        console.log('object name too : '+component.get("v.wrecord.obj"));
        var action=component.get("c.getRelatedFunc");
		action.setParams({

			objectname : component.get("v.wrecord.obj"),
            recordId : component.get("v.recordId")
            
		});

		action.setCallback(this, function(a) {

			if (a.getState() === "SUCCESS") {  
                console.log('state : '+a.getState()); 
                console.log('RELrecord : '+a.getReturnValue());
                console.log('size : '+a.getReturnValue().length);
                component.set("v.RELrecord",a.getReturnValue());
                console.log('RELrecord after setting to elelenement: '+component.get("v.RELrecord"));
                if(component.get("v.RELrecord")!=''){
                    component.set("v.msg",false);
                }
                console.log('RELrecord 0 :'+component.set("v.RELrecord.relName[0]"));
                for(var i=0;i<a.getReturnValue().length;i++){
                    console.log('RELrecord '+i+' :'+component.set("v.RELrecord[i]"));
                }
                
			} else if (a.getState() === "ERROR") {

				$A.log("Errors", a.getError());
			}

		});
		$A.enqueueAction(action);
    },
})