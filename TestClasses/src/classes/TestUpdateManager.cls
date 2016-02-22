@isTest
public class TestUpdateManager {
    public static Opportunity opportunity;
    public static Account testAccount ;
    @testSetup
    public static void testSetup(){
        testAccount = new Account(name='testAccount') ;
        insert testAccount;
        
        Contact testcontact = new Contact(AccountId=testAccount.Id,lastname='testContact',firstname='testcontact');
        insert testcontact;
        
        opportunity = new Opportunity(Name='testOpportunity' , CloseDate =Date.today(), StageName='Qualification' ,BillToContact__c=testcontact.Id);
        insert opportunity;
    }
    @isTest
    public static void testAutomaticUpdateOfManager(){
        Test.startTest();
        opportunity = [Select name,BillToContact__c,manager__C from opportunity where name='testOpportunity'];
        testAccount = [Select name From Account where name='testAccount'];
        List<Opportunity> opInputList = new List<Opportunity>{opportunity};
        UpdateManager.automaticUpdateOfManager(opInputList);
        opportunity = [Select manager__C from opportunity where name='testOpportunity'];
        Test.stopTest();
        System.assertEquals(testAccount.Id, opportunity.Manager__c);
    }
    
    
    
}