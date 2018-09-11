({
	myAction : function(component, event, helper) {
        console.log('recordId :'+component.get("v.recordId"));
		var evt= $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef: "cil:CloningComponent",
            componentAttributes: {
                "recordId": component.get("v.recordId")
            }
            
        });
    	evt.fire();
	}
})