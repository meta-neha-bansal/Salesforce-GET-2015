/*
 * Name:DeleteOpportunityLineItemOnReset
 * Since:27-1-2015
 * This trigger is to check for updation in any opportunity record.
 * When this Custom_Status__c field changed and value is "Reset" then it delete all associated  products(opp. Lines) with related Opportunity.
 */ 
trigger DeleteOpportunityLineItemOnReset on Opportunity (after update) {
    if (Trigger.IsAfter && Trigger.IsUpdate) {
        Set<Id> setOpporutnityId = new Set<Id>();
        for (Opportunity objOpportunity:Trigger.New) {
            if (objOpportunity.Custom_Status__c != null && objOpportunity.Custom_Status__c == 'Reset' && objOpportunity.Custom_Status__c != Trigger.OldMap.get(objOpportunity.Id).Custom_Status__c) {
                setOpporutnityId.Add(objOpportunity.id);
            }
        }
        if (setOpporutnityId != null && setOpporutnityId.size() > 0) {
            List<OpportunityLineItem> opportunityLineItemList = [select id from OpportunityLineItem where Opportunity.Id IN :setOpporutnityId];
            Database.delete(opportunityLineItemList);
        }
    }
}