global  with sharing class NewOpportunitySelectPicklist {
    @AuraEnabled
global static List<String> getLeadSources()
       {
        List<string> pickoptions=new List<string>();
           schema.DescribeFieldResult fieldresult=opportunity.LeadSource.getDescribe();
           List<schema.PicklistEntry> ple=fieldresult.getpicklistvalues();
           for(schema.PicklistEntry f:ple)
           {
               pickoptions.add(f.getvalue());
           }
        return pickoptions;  
       }
}