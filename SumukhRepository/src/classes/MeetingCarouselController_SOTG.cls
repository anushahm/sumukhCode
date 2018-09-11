public class MeetingCarouselController_SOTG {
@AuraEnabled
    public static list<Event> Meeting(){
        list<Event> EventList=New List<Event>();
        EventList=[SELECT Id,Subject,who.name,what.name,Duration_Auto__c,StartDateTime,EndDateTime,PIN__c,Location,Drive_Time__c, Distance__c FROM Event where OwnerId =: UserInfo.getUserId() AND StartDateTime != null Order by StartDateTime Desc limit 4];
        return EventList;
    }
}