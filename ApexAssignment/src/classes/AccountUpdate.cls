public class AccountUpdate {
    public static void updateRelatedContactIDs(String contactId){
        
        List<Account> acountList = [SELECT Id,ContactIDs__c,(select id,name from contacts),name FROM account WHERE Id IN (SELECT AccountId FROM Contact Where id = :contactId)];
        Account ac = acountList[0];
        if(ac.ContactIDs__c==null)
        {
            String commaSepratedList = '' ;
            
            INTEGER temp = 0;
            for(Contact Cnt : ac.contacts)
            {
                system.debug(cnt);
                if(temp == 0)
                {
                    temp =1;
                }
                else
                {
                    commaSepratedList +=',';
                }
                
                commaSepratedList +=cnt.id;
            }
            ac.ContactIDs__c =  commaSepratedList;
            update(ac);
           
        }
        else
        {
            List<String> hparts = ac.ContactIDs__c.split('/,');
            for(String str:hparts){
                if(str == contactId )
                    break;
                else
                {
                    ac.ContactIDs__c= ac.ContactIDs__c+' ,'+ contactId;
                    update(ac);
                }
                    
            }
        }
        system.debug(ac.ContactIDs__c);
        
    }
   

}