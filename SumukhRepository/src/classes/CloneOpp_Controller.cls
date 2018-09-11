public class CloneOpp_Controller {

 private ApexPages.StandardController controller {get; set;}
    private Opportunity OpportunityRecordQueried{get;set;}
    public Opportunity OpportunityRecord {get;set;}
 
    public CloneOpp_Controller(ApexPages.StandardController controller) {
 
        this.controller = controller;
        OpportunityRecord = (Opportunity)controller.getRecord();
        OpportunityRecordQueried = [select Id,
                                Accountid,
                                Amount,
                                CloseDate,
                                Contractid,
                                Description,
                                ExpectedRevenue,
                                ForecastCategoryName,
                                LeadSource,
                                 Name,
                                 Discount_Percent__c,
                                Ownerid,
                                Pricebook2id,
                                Campaignid,
                                IsPrivate,
                                Probability,
                                TotalOpportunityQuantity,
                                StageName,
                               Type
                         from Opportunity
                         where id =: OpportunityRecord.Id];
    }
 
    public PageReference cloneOpportunity() {
 
         Savepoint sp = Database.setSavepoint();
         Opportunity OpportunityCloned;
         try {
             OpportunityCloned = OpportunityRecordQueried.clone(false);
             insert OpportunityCloned;
         } catch (Exception e){
            Database.rollback(sp);
            ApexPages.addMessages(e);
            return null;
         }
        return new PageReference('/'+OpportunityCloned.id);
 
    }
 


}