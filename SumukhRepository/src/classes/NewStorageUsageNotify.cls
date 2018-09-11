global class NewStorageUsageNotify{ 
    public static void getStorageUsageNotifications(){
        
        String requestUrl = '/setup/org/orgstorageusage.jsp?id=' + UserInfo.getOrganizationId() + '&setupid=CompanyResourceDisk';
        //System.debug('requesturl' +requestUrl);       
        
        
          integer i=1;
        integer j=1;
        list<string> news=new list<string>();
        list<string> news1=new list<string>();
        
        
        //Get the Storage Page, prepare to scrape
        PageReference pg = new PageReference( requestUrl );
        //system.debug('--pageReference--' +pg);
        
        String htmlCode;//= pg.getContent().toString();
        //system.debug('--htmlCode' +htmlCode);
        
        blob pdfBody;
            if(Test.isRunningTest()) { 
              pdfBody = blob.valueOf('Unit.Test');
                 htmlCode=pdfBody.toString();
                    news.add('');
                    news.add('');
                    news.add('');
                    news.add('');
                    news1.add('');
                    news1.add('');
                    news[0]='5.0&nbsp;MB';
                    news[1]='482&nbsp;KB';
                    news[2]='482&nbsp;KB';
                    news[3]='482&nbsp;KB';
                  	news1[0]='9%</td></tr>';
        			news1[1]='9%</td></tr>';
                
            } else {
              pdfBody = pg.getContent();
                htmlCode=pdfBody.toString();
            }
        
        
        String pattern1 = '[0-9][0-9]*.[0-9]*&nbsp;[A-Z][A-Z]';
        String pattern2 = '[0-9][0-9]*%</td></tr>';
        
        //String[] par = Pattern.compile(pattern1, Pattern.MULTILINE).split(htmlCode);
        
        Matcher m = Pattern.compile(pattern1).matcher(htmlCode);
        Matcher m1 = Pattern.compile(pattern2).matcher(htmlCode);
        
        
      
        
        while (m.find()) {
            if(i<=4){
                system.debug('--------------------'+m.start() + ': ' + m.group());
                news.add(m.group());
                system.debug(news);
                i++;
            }
        }
        
        while (m1.find()) {
            if(j<=2){
                system.debug('--------------------'+m1.start() + ': ' + m1.group());
                news1.add(m1.group());
                system.debug(news1);
                j++;
            }
        }
        
        
        
        news[0]=news[0].replace('&nbsp;',' ');
        news[1]=news[1].replace('&nbsp;',' ');
        news[2]=news[2].replace('&nbsp;',' ');
        news[3]=news[3].replace('&nbsp;',' ');
        system.debug(news[0]+news[2]+news[1]+news[3]);
        
        news1[0]=news1[0].replace('</td></tr>',' ');
        news1[1]=news1[1].replace('</td></tr>',' ');
        
        system.debug(news1[0]+news1[1]);
        
        string bodyMessage='';
        system.debug('Check');
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        String[] toAddresses = new String[] {'anusha.m@brillio.com','anushahmahadev@gmail.com'};
            mail.setToAddresses(toAddresses);
        mail.setSubject('Salesforce Storageusage status as on '+ ' ' +system.today().format());
        mail.setPlainTextBody('');
        bodyMessage='Hi Team,<br/><br/>';
        bodyMessage+='Here is your salesforce storage usage status';
        bodyMessage+= '<ul><li>Datastorage used/limit:<b>' +  news[1] +'/'+news[0] + '</b>';
        bodyMessage+= '<li>Filestorage used/limit:<b>' + news[3]+'/'+news[2] + '</b></ul>';
        bodyMessage+= '<ul><li>Datastorage percentage used:<b>' +  news1[0] + '</b>';
        bodyMessage+= '<li>Filestorage percentage used:<b>' + news1[1] + '</b></ul>';
        bodyMessage+= 'Regards, <br/>';
        bodyMessage+= 'Admin';
        
        mail.setHtmlBody(bodyMessage);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail});
        
        
        
    }
}