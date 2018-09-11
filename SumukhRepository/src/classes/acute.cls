public class acute {
@AuraEnabled
    public static list<String> getStringArray(){
       list <String> ArrayItems=new list<String>();
        schema.DescribeFieldResult fieldresult=opportunity.LeadSource.getDescribe();
        List<schema.PicklistEntry> ple=fieldresult.getpicklistvalues();

            //for(Schema.SObjectType f:Schema.getGlobalDescribe().values())
            for(schema.PicklistEntry f:ple)
        {
            system.debug('-------val-------'+f.getvalue());
            ArrayItems.add(f.getvalue());
        }
            //ArrayItems.sort();
        return ArrayItems;  //returns the list of the strings[values of Sobjects picklist]
    }
}