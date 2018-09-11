global class StorageNotification{ //implements Schedulable
	
  /* global void execute(SchedulableContext SC) {
      EnviarAlarmas();      
   }
   
    @future (callout=true)*/	
    public static void EnviarAlarmas(){
    	
    	//String[] recipientsMail = 	new String[] {'anusha.m@brillio.com'};
    	//String[] adminsMail 	=	new String[] {'anusha.m@brillio.com'}; //Sent when error occurs
		
		//Integer limiteDataStorageInfo 	= 75; 
	    // Integer limiteDataStorageAlerta = 90; 
	    // Integer limiteFileStorageInfo	= 75; 
	    //Integer limiteFileStorageAlerta = 90; 	    
	    
        String requestUrl = '/setup/org/orgstorageusage.jsp?id=' + UserInfo.getOrganizationId() + '&setupid=CompanyResourceDisk';
    	 
        System.debug('requesturl' +requestUrl);       
    	//Get the Storage Page, prepare to scrape
    	PageReference pg = new PageReference( requestUrl );
        system.debug('--pageReference--' +pg);
    	String htmlCode = pg.getContent().toString();
        
        system.debug('--htmlCode' +htmlCode);
    	
    	//Find the pattern 
    	Pattern patternToSearch = Pattern.compile('\\d+%</td></tr>'); 
        Matcher matcherPattern = patternToSearch.matcher(htmlCode);

        String  dataStorageString, fileStorageString, dataStorageUsedPercentage, fileStorageUsedPercentage;
                
        //Find the first Occurrence which is Data Storage       
        if ( matcherPattern.find() ) {
        	
            dataStorageString = htmlCode.substring(matcherPattern.start(), matcherPattern.end());
            //System.debug('**************************** dataStorageString: ' + dataStorageString);
            
            //Find the Subpattern
            Pattern subpatternToSearch = Pattern.compile('\\d+'); //Indica valores de la tabla de porcentages
        	Matcher matcherPatternPercentage = subpatternToSearch.matcher(dataStorageString);
            
            if ( matcherPatternPercentage.find() ) { 
            	
            	dataStorageUsedPercentage = dataStorageString.substring(matcherPatternPercentage.start(), matcherPatternPercentage.end());
            	System.debug('DataStorage Used Percentage' +dataStorageUsedPercentage);
            }else{
                dataStorageString =  null;
            }
        }
         
		//Find the first Occurrence; which is File Storage
        if ( matcherPattern.find() ) {
            
            fileStorageString = htmlCode.substring(matcherPattern.start(), matcherPattern.end());
            
            Pattern subpatternToSearch = Pattern.compile('\\d+'); //Indica valores de la tabla de percentages
        	Matcher matcherPatternPercentage = subpatternToSearch.matcher(fileStorageString);            
            
            if ( matcherPatternPercentage.find() ) { 
            	
               fileStorageUsedPercentage = fileStorageString.substring(matcherPatternPercentage.start(), matcherPatternPercentage.end());
               System.debug('file storage percentage' +fileStorageUsedPercentage);
            }else{
                fileStorageString = null;
            }
        }        
        
        system.debug('---Dtastorage--' +dataStorageUsedPercentage);
        system.debug('---FileStorage--' +fileStorageUsedPercentage);
        /*Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    	String bodyMessage = '';
    	Boolean sendMessage = false;
    	
        //Check we've got values, otherwise notify the Admins
        if ( (!String.isBlank(dataStorageUsedPercentage)) && (!String.isBlank(fileStorageUsedPercentage) ) ){
        	
        	if ( ( limiteDataStorageAlerta <= integer.valueof(dataStorageUsedPercentage) ) || ( limiteFileStorageAlerta <= integer.valueof(fileStorageUsedPercentage) ) ) {
        		
                sendMessage = true;
                mail.setSubject('Aviso ALERTA almacenamiento: ' + UserInfo.getOrganizationName() + ' - ID: '+ UserInfo.getOrganizationId());
                   	
		   	}else if ( ( limiteDataStorageInfo <= integer.valueof(dataStorageUsedPercentage) ) || ( limiteFileStorageInfo <= integer.valueof(fileStorageUsedPercentage) ) ) {
		   		
		   		sendMessage = true;
                mail.setSubject('Aviso INFO almacenamiento: ' + UserInfo.getOrganizationName() + ' - ID: '+ UserInfo.getOrganizationId());
                
			}            
        	
        	if ( sendMessage ){
        		//Send Mail Notifications
	    		mail.setToAddresses(recipientsMail);
		        mail.setSenderDisplayName('Aviso almacenamiento');
	        	bodyMessage  = 'Se ha generado una alarma de almacenamiento debido a que uno de los valores siguientes ha superado el límite:';
		        bodyMessage += '<ul><li>Almacenamiento Data: <b>' +  dataStorageUsedPercentage + '%</b>';
		        bodyMessage += '<li>Almacenamiento Files: <b>' + fileStorageUsedPercentage + '%</b></ul>';
		        bodyMessage += 'Los límites establecidos son:';
		        bodyMessage += '<ul><li>Info y Alerta para Data Storage : ' + limiteDataStorageInfo + '% y ' + limiteDataStorageAlerta + '%';
		        bodyMessage += '<li>Info y Alerta para File Storage: ' + limiteFileStorageInfo + '% y ' + limiteFileStorageAlerta + '%';
		        bodyMessage += '<p><a href="' + System.URL.getSalesforceBaseUrl().toExternalForm() + requestUrl + '" target="_blank">Acceder a la página de almacenamiento</a>';
		        mail.setHtmlBody(bodyMessage);
	        	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        	}
        	//else No Alerts must be sent, storage usages are between limits
        	
        	
        	
        }else{
        	//Things went Wrong, notify the admins
        	
        	//System.debug('Pattern finding failed miserayble - Esteve\'s Fault');
        	
        	//Send Mail Notifications
    		mail.setToAddresses(adminsMail);
	        mail.setSenderDisplayName('Error en generación de Alertas');
	        mail.setSubject('Error Generación Alertas Almacenamiento en: ' + UserInfo.getOrganizationName() + ' - ID: '+ UserInfo.getOrganizationId());
	        
	        bodyMessage  = 'Error en la generación de alertas, los valores son dataStorageUsedPercentage:' +  dataStorageUsedPercentage + ' fileStorageUsedPercentage:' + fileStorageUsedPercentage;
	        
	        mail.setHtmlBody(bodyMessage);
	        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }*/
        if(dataStorageUsedPercentage<string.valueof(20)){
        
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {'anusha.m@brillio.com'};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Currentdatastorageis normal' +dataStorageUsedPercentage);
            mail.setPlainTextBody('');
			Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
           
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {'anusha.m@brillio.com','amit.singh@brillio.com','anushahmahadev@gmail.com'};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Salesforce Storage Usage');
            mail.setPlainTextBody('CurrentDataStorage Percentage is:'+dataStorageUsedPercentage +' '+'CurrentFileStorage Percentage is:' +fileStorageUsedPercentage);
            
			Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
       
}