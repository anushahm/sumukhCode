global class StorageUsageNotify{ 
    public static void getStorageUsageNotifications(){
    	
        String requestUrl = '/setup/org/orgstorageusage.jsp?id=' + UserInfo.getOrganizationId() + '&setupid=CompanyResourceDisk';
    	System.debug('requesturl' +requestUrl);       
    	
        //Get the Storage Page, prepare to scrape
        PageReference pg = new PageReference( requestUrl );
        system.debug('--pageReference--' +pg);
    	
        String htmlCode = pg.getContent().toString();
        system.debug('--htmlCode' +htmlCode);
    	
    	//Find the pattern of Storage Space
    	/*Pattern patternToSearchMB = Pattern.compile('\\d.d+&nbsp;MB</td>'); 
        Matcher matcherPatternMB = patternToSearchMB.matcher(htmlCode);
        system.debug('MatcherStringChecker' +matcherPatternMB);

        String  dataStorageStringMB, fileStorageStringMB, dataStorageUsedPercentageMB, fileStorageUsedPercentageMB;
                
        //Find the first Occurrence which is Data Storage       
        if ( matcherPatternMB.find() ) {
        	
            dataStorageStringMB = htmlCode.substring(matcherPatternMB.start(), matcherPatternMB.end());
            system.debug('matchpatternstart##' +matcherPatternMB.start());
            system.debug('matchpatternstart##' +matcherPatternMB.end());

            System.debug('*******************testing limit and Used storage in Slaesforce ' + dataStorageStringMB);
            
            //Find the Subpattern
            Pattern subpatternToSearchMB = Pattern.compile('\\d.d+'); //Indica valores de la tabla de porcentages
        	Matcher matcherPatternPercentageMB = subpatternToSearchMB.matcher(dataStorageStringMB);
            
            if ( matcherPatternPercentageMB.find() ) { 
            	
            	dataStorageUsedPercentageMB = dataStorageStringMB.substring(matcherPatternPercentageMB.start(), matcherPatternPercentageMB.end());
            	System.debug('DataStorage Used Percentage' +dataStorageUsedPercentageMB);
            }else{
                dataStorageStringMB =  null;
            }
        }
        
        system.debug('storagelimitinMB' +dataStorageUsedPercentageMB);
        system.debug('filestoragelimitinMB' +fileStorageUsedPercentageMB);

         
		//Find the first Occurrence; which is File Storage
        if ( matcherPatternMB.find() ) {
            
            fileStorageStringMB = htmlCode.substring(matcherPatternMB.start(), matcherPatternMB.end());
            
            Pattern subpatternToSearchMB = Pattern.compile('\\d.d+');
        	Matcher matcherPatternPercentageMB = subpatternToSearchMB.matcher(fileStorageStringMB);            
            
            if ( matcherPatternPercentageMB.find() ) { 
            	
               fileStorageUsedPercentageMB = fileStorageStringMB.substring(matcherPatternPercentageMB.start(), matcherPatternPercentageMB.end());
               System.debug('file storage percentage' +fileStorageUsedPercentageMB);
            }else{
                fileStorageStringMB = null;
            }
        }     */   
         
        //Storage Percentage find pattern***********************************************************************************
        
            	//Find the pattern 
        system.debug('++Note:Storage Pecentage Strats From Here+++++');
    	Pattern patternToSearch = Pattern.compile('\\d+%</td></tr>'); 
        Matcher matcherPattern = patternToSearch.matcher(htmlCode);
        system.debug('$' +matcherPattern);

        String  dataStorageString, fileStorageString, dataStorageUsedPercentage, fileStorageUsedPercentage;
                
        //Find the first Occurrence which is Data Storage       
        if ( matcherPattern.find() ) {
        	
            dataStorageString = htmlCode.substring(matcherPattern.start(), matcherPattern.end());
            system.debug('matchpatternstart&&&&' +matcherPattern.start());
            system.debug('matchpatternEnd&&&&' +matcherPattern.end());

            System.debug('**************************** dataStorageString: ' + dataStorageString);
            
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
            
            Pattern subpatternToSearch = Pattern.compile('\\d+');
        	Matcher matcherPatternPercentage = subpatternToSearch.matcher(fileStorageString);            
            
            if ( matcherPatternPercentage.find() ) { 
            	
               fileStorageUsedPercentage = fileStorageString.substring(matcherPatternPercentage.start(), matcherPatternPercentage.end());
               System.debug('file storage percentage' +fileStorageUsedPercentage);
            }else{
                fileStorageString = null;
            }
        }        

        
       //system.debug('---Datastorage--' +dataStorageUsedPercentage);
       // system.debug('---FileStorage--' +fileStorageUsedPercentage);

        if(dataStorageUsedPercentage==string.valueof(2) || fileStorageUsedPercentage==string.valueof(23)){
        string bodyMessage='';
            system.debug('Check');
        
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

            String[] toAddresses = new String[] {'anusha.m@brillio.com','anushahmahadev@gmail.com'};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Salesforce Storageusage status as on '+ ' ' +system.today().format());
            mail.setPlainTextBody('');
            bodyMessage='Hi Team,<br/><br/>';
            bodyMessage+='Here is your salesforce storage usage status';
            bodyMessage+= '<ul><li>Datastorage percentage used:<b>' +  dataStorageUsedPercentage + '%</b>';
		    bodyMessage+= '<li>Filestorage percentage used:<b>' + fileStorageUsedPercentage + '%</b></ul>';
            bodyMessage+= 'Regards, <br/>';
            bodyMessage+= 'Admin';

            mail.setHtmlBody(bodyMessage);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail});
        }
      }
     }