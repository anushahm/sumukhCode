({
	doInit : function(component, event, helper) {
        //console.log('start'+component.get("v.fgujID"));
        helper.init1(component,event); 
	},
    
    onNumChange : function(component, event, helper) {
        var val= component.find('text-input-01').get("v.value");  
        if(val==0 || val==undefined){
            component.set("v.changeList",undefined);           
            component.set("v.clones",false);
            component.set("v.editBoard",false);
            component.set("v.CloneButton",true);
            helper.init1(component,event); 
        }
	},
    
    onClickNext : function(component, event, helper) {                     
        var val= component.find('text-input-01').get("v.value");       
        helper.loadFieldsnValues(component,event,val);
        var obName = component.get("v.wrecord.obj");
        var iter=[];
        console.log('val: '+val);
        if(val!=0 && val!=undefined){ 
            helper.init2(component,event);
            var recordName = component.get("v.wrecord.record.Name");
            for(var i=1;i<=val;i++){
                iter[i]=recordName+' '+i;
            }
            //component.set("v.clonesToBe",iter);                       
            component.set("v.clones",true);
            component.set("v.CloneButton",false);
            component.set('v.exceptn',false);
        }  
        else{
            component.set('v.msgerr','* Number of clones must be greater than or equals to 1');
            component.set('v.exceptn',true);
        }
        console.log('RELRecord :'+component.get("v.RELrecord"));
        
    },
    
    edit : function(component, event, helper) { 
       
            var action=component.get("c.getFieldss");
            
            action.setParams({ 
                recordId : component.get("v.recordId")                
            });
            
            action.setCallback(this, function(a) {
                console.log('state : '+a.getState()); 
                if (a.getState() === "SUCCESS") {  
                   component.set("v.Erecord",a.getReturnValue()); 
                    console.log('EeeeeeeeeeeeeeRecord:'+component.get("v.Erecord"));
                } else if (a.getState() === "ERROR") {
                    
                    $A.log("Errors", a.getError());
                }
                
            });       
            $A.enqueueAction(action); 
        

           
        component.set("v.editBoard",true);         
        
    },
    
    onBoardChange :   function(component, event, helper) { 
        var fild = event.getSource().get("v.labelClass");
        var vale = event.getSource().get("v.value");
        console.log('Label : Field----'+fild+' : '+vale);
        if(component.get("v.changeList")==undefined){
            component.set("v.changeList",fild+'±'+vale);
        }
        else
            component.set("v.changeList",component.get("v.changeList")+'×'+fild+'±'+vale);
        //component.find()        
        
    },
    
    savetheBoard :   function(component, event, helper) {         
        console.log('values of changeList :'+component.get("v.changeList"));        
        component.set("v.editBoard",false);
        
    },

    closetheBoard :   function(component, event, helper) { 
        component.set("v.changeList",'');
        component.set("v.editBoard",false);
        
    },
    
    onSelectChange :   function(component, event, helper) { 
        var target = event.getSource();
        console.log('target text : '+target.get("v.text"));
        
    },
    
    getRelated :   function(component, event, helper) { 
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

	clone :   function(component, event, helper) { 
        component.set("v.CloneButton",true);
        var arary=[];
        if(component.get("v.checkedRelList")!=undefined){
            arary=component.get("v.checkedRelList").split(',');
        }
        console.log('arary : '+arary);
        var val= component.find('text-input-01').get("v.value"); 
        console.log('Sending List:'+component.get("v.RELrecord"));
        var action=component.get("c.makeNewRecords");
		action.setParams({

			recordId : component.get("v.recordId"),	
            NoOfRecords : val,
            arry : arary,
            listSW : JSON.stringify(component.get("v.RELrecord")),
            isReady : true,
            changeList : component.get("v.changeList")

		});

		action.setCallback(this, function(a) {
			if (a.getState() === "SUCCESS") {  
                console.log('error((())) :'+a.getReturnValue());
                if(a.getReturnValue().length>0){
                    console.log('state : '+a.getState());
                    component.set('v.msgerr','*[(No. of clones * RelatedList records)+ No.of clones] should not exceed 10000');
                    component.set('v.exceptn',true);
                }
                else{                    
                    component.set("v.prompt",true);
                }
               
                         
			} else if (a.getState() === "ERROR") {

				$A.log("Errors", a.getError());
			}

		});
		$A.enqueueAction(action);          
	},
    
    selectrecords :   function(component, event, helper) {         
        //console.log(event.getSource().get("v.text"));
        //console.log(component.get("v.checkedRelList"));
        var vcbox=component.get("v.checkedRelList");
        //console.log('outside else : '+vcbox);
        //console.log('KSLHDF : '+component.find('cbox:cbox1').get("v.text"));
        if(vcbox==undefined || vcbox==''){
            vcbox=event.getSource().get("v.text");
            component.set("v.checkedRelList",vcbox);
            //console.log('siulfh : '+component.get("v.checkedRelList"));
        }
        else{   
            vcbox=vcbox.trim();
            /*if(vcbox.endsWith(',')){
                vcbox=vcbox.substring(0,vcbox.length-1);
            }
            if(vcbox.startsWith(',')){
                vcbox=vcbox.substring(1,vcbox.length);
            }
            console.log('final vcbox : '+vcbox);*/
            var booln=vcbox.indexOf(event.getSource().get("v.text")) > -1;
            //console.log('inside else : '+vcbox+' '+booln);
            
            if(!booln){
                //console.log('inside else if');
                vcbox+=','+event.getSource().get("v.text");
                component.set("v.checkedRelList",vcbox);
            }
            else{
                //if(component.get("v.checkedRelList").contains(event.getSource().get("v.text"))){                
                var temp=event.getSource().get("v.text");
                //console.log('vcbox : '+vcbox);
                //console.log('inside else else');                
                vcbox=vcbox.replace(temp,"");
                console.log('vcbox : '+vcbox);
                component.set("v.checkedRelList",vcbox);
            }
        }
       
       console.log('cbox : '+component.get("v.checkedRelList"));
	},
    
    showSpinner : function (component, event, helper) {   
        component.set("v.spinner",true);
    },
    
    hideSpinner : function (component, event, helper) {        
        component.set("v.spinner",false);
    },
    
    afterCreate : function (component, event, helper) {        
        var homeEvent = $A.get("e.force:navigateToObjectHome");
        homeEvent.setParams({
            "scope": component.get("v.wrecord.obj")
        });
        homeEvent.fire();
        component.set("v.prompt",false);
    }
   
        
})