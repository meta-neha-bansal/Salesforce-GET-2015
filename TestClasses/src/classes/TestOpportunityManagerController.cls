/*
 * test class to test 'OpportunityManagerController' which is used to Select BillToContact using Custom LookUp. 
 * ( Here List show Contacts related to that Manager).
 */ 
@isTest(seeAllData = False)
private class TestOpportunityManagerController {
    static Opportunity testOpportunity;
    static List<Contact> contacts;
    static account testAccount;
    static Contact testContact1;
    
    //setup all test data
    @testSetup
    private static void setUp()
    {
        testAccount = new Account (name = 'testAccount');
        insert testAccount;
        testContact1 = new Contact(LastName = 'testContact1' , AccountId = testAccount.Id );
        Contact testContact2 = new Contact(LastName = 'testContact2' , AccountId = testAccount.Id );
        contacts = new List<Contact>{testContact1,testContact2};
        insert contacts;
        testOpportunity = new Opportunity(name = 'testOpportunity',StageName = 'prospecting' ,CloseDate = DaTE.today().addDays(20),Manager__c = testAccount.Id);
        insert testOpportunity;
    }
    
    
    @isTest
    private static void testOpportunityManagerController()
    {
        Test.startTest();
        testAccount = [Select name from account where name = 'testAccount'];
        testOpportunity = [select name,StageName,CloseDate,Manager__c from opportunity where name = 'testOpportunity'];
        ApexPages.StandardController sc = new ApexPages.StandardController(testOpportunity);
        OpportunityManagerController controller = new OpportunityManagerController(sc);
        contacts = [select name from contact where accountId = :testAccount.id];
        test.stopTest();
        System.assertEquals(contacts, controller.contactList);
    }
    
    //test to check the method 'getContacts' which is used to get list of contacts related to manager of given opportunity
    @isTest
    private static void testgetContacts()
    {
        Test.startTest();
        testaccount = [Select name from account where name = 'testAccount'];
        testOpportunity = [select name,StageName,CloseDate,Manager__c from opportunity where name = 'testOpportunity'];
        ApexPages.StandardController sc = new ApexPages.StandardController(testOpportunity);
        OpportunityManagerController controller = new OpportunityManagerController(sc);
        contacts = [select name from contact where accountId = :testaccount.id];
        List<SelectOption> options=new List<SelectOption>();
        for(Contact contact:contacts)
            options.add(new SelectOption(contact.Id,contact.Name));
        test.stopTest();
        System.assertEquals(options, controller.getContacts());
    }
    
    //test to check the method 'setBillToContact' which is used to update billToContact field of current opportunity
    @isTest
    private static void testsetBillToContact_BillToContactUpdated()
    {
        Test.startTest();
        testaccount = [Select name from account where name = 'testAccount'];
        testOpportunity = [select name,StageName,CloseDate,Manager__c from opportunity where name = 'testOpportunity'];
        ApexPages.StandardController sc = new ApexPages.StandardController(testOpportunity);
        OpportunityManagerController controller = new OpportunityManagerController(sc);
        testContact1 = [select name from contact where LastName = 'testContact1' AND AccountId = :testAccount.Id ];
        controller.contactId = testContact1.Id;
        Test.stopTest();
        controller.setBillToContact();
        System.assertEquals(testContact1.Id, testOpportunity.BillToContact__c);
        
    }
    
    //test to check the method 'removeBillToContact' which is used to set billToContact field Null of current opportunity
    @isTest
    private static void testremoveBillToContact_BillToContactRemoved()
    {
        Test.startTest();
        testAccount = [Select name from account where name = 'testAccount'];
        testOpportunity = [select name,StageName,CloseDate,Manager__c from opportunity where name = 'testOpportunity'];
        ApexPages.StandardController sc = new ApexPages.StandardController(testOpportunity);
        OpportunityManagerController controller = new OpportunityManagerController(sc);
        testContact1 = [select name from contact where LastName = 'testContact1' AND AccountId = :testAccount.Id ];
        controller.contactId = testContact1.Id;
        Test.stopTest();
        controller.setBillToContact();
        controller.removeBillToContact();
        System.assertEquals(null, testOpportunity.BillToContact__c);
    }
}
