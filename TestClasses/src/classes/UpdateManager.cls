public class UpdateManager {
    public static void automaticUpdateOfManager(List<Opportunity> opInputList){
        List<Opportunity> opList = [Select id,name,BillToContact__c,Manager__c From Opportunity Where id in :opInputList AND BillToContact__C != null
                                    And manager__C = null];
        
        For(Opportunity o:opList)
        {
           System.debug('opportunity.bill to contact is '+opportunity.BillToContact__c);
           Contact c = [Select account.id from contact where id = :o.BillToContact__c];
            System.debug('account id  is '+c.accountId);
           o.Manager__c = c.AccountId;
         }
        update(opList);
        
    }
    

}