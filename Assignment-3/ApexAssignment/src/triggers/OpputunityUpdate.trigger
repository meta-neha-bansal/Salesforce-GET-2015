trigger OpputunityUpdate on Opportunity (After update) {
    List<Opportunity> listOfOppurtunity =[Select id,name,BillToContact__C,manager__C From Opportunity Where id in:Trigger.New];
    
    UpdateManager.automaticUpdateOfManager(listOfOppurtunity);
    
}