/*
 * Name:PopoulateCloseDate
 * Since:27-1-2015
 * This trigger is to check for updation in any opportunity record.
 * If the stage is changed from another value  to CLOSED_WON or CLOSED_LOST, then it populates the Close Date field with Today().
 */ 
trigger PopoulateCloseDate on Opportunity (before update) {
    List<opportunity> opportunityList;
    for(Opportunity opportunityObject : Trigger.New){
        if(opportunityObject.stageName =='Closed Won' || opportunityObject.StageName=='Closed Lost'){
            Opportunity oldOpportunity = Trigger.oldMap.get(opportunityObject.Id);
            if(oldOpportunity.StageName != 'Closed Won' && oldOpportunity.StageName != 'Closed Lost')
            {
                opportunityObject.CloseDate = Date.today();
            }
            
        }
    }
}