public class UpdateManager {
    public static void automaticUpdateOfManager(List<Opportunity> opInputList){
        List<Opportunity> opList = [Select id,name,BillToContact__c,Manager__c From Opportunity Where id in :opInputList AND BillToContact__C != null
                                    And manager__C = null];
        
        For(Opportunity o:opList)
        {
           system.debug(o.Name);
           Contact c = [Select account.id from contact where id = :o.BillToContact__c];
           o.Manager__c = c.AccountId;
           update(o);
        
         }
        
    }
    

}