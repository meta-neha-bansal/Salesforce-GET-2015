/*
 * Test Class to test the controller 'AccountAddressFilterController' which is used to Filter accounts records on 
 * the basis of  billingcity,billingCountry and billingState.
 */ 
@isTest
private class TestAccountAddressFilterController 
{
    //create test account 
    static account testAccount1;
    static account testAccount2;
    static account testAccount3;
    static account testAccount4;
    static account testAccount5;
    static account testAccount6;
    static List<Account> accounts;
    
    //create setup data
    @testSetup
    private static void setupData()
    {
        testAccount1 = new Account(name = 'Account1' , BillingCity = 'Jaipur' , BillingState = 'Rajasthan', BillingCountry = 'India');
        testAccount2 = new Account(name = 'Account2' , BillingCity = 'Ajmer' , BillingState = 'Rajasthan', BillingCountry = 'India');
        testAccount3 = new Account(name = 'Account3' , BillingCity = 'Ajmer' , BillingState = 'Rajasthan', BillingCountry = 'India');
        testAccount4 = new Account(name = 'Account4' , BillingCity = 'Ajmer' , BillingState = 'Rajasthan', BillingCountry = 'India');
        testAccount5 = new Account(name = 'Account5' , BillingCity = 'Pune' , BillingState = 'Maharashtra', BillingCountry = 'India');
        testAccount6 = new Account(name = 'Account6' , BillingCity = 'Pune' , BillingState = 'Maharashtra', BillingCountry = 'India');
        
        accounts = new List<Account>{testAccount1,testAccount2,testAccount3,testAccount4,testAccount5,testAccount6};
            insert accounts;
    }
    
    //It test for variables set in the constructor
    @isTest
    private static void testAccountAddressFilterController()
    {
        AccountAddressFilterController accountAddressFilterController = new AccountAddressFilterController();
        System.assertEquals(false, accountAddressFilterController.accountBlockPopup);
        System.assertEquals(false, accountAddressFilterController.buttonBlockPopup);
        System.assertEquals(0, accountAddressFilterController.totalPages);
        
    }
    
    // test method to check the size of accounts retrieved when no address is specified
    @isTest
    private static void testsearchRecords_retrieveAccountsWithoutAddressSpecified_AccountsRetrieved()
    {
        AccountAddressFilterController Controller = new AccountAddressFilterController();
        Controller.searchRecords();
        System.assertEquals(6, Controller.accountsetController.getResultSize());
        
    }
    
    //test method to check the size of account retrieved for each page 
    @isTest
    private static void testGetAccounts_retrieveAccountsPerPage_retrievedAccounts()
    {
        AccountAddressFilterController Controller = new AccountAddressFilterController();
        Controller.searchRecords();
        System.assertEquals(5, Controller.accounts.size());
    }
    
    //test method to check the size of accounts retrieved when only billing city is specified
    @isTest
    private static void testsearchRecords_retrieveAccountsWithBillingCitySpecified_AccountsRetrieved()
    {
        AccountAddressFilterController Controller = new AccountAddressFilterController();
        
        //set BillingCity as 'Jaipur'
        Controller.BillingCity = 'Jaipur';
        Controller.searchRecords();
        System.assertEquals(1, Controller.accountsetController.getResultSize());
        
        Controller.BillingCity = 'Ajmer';
        Controller.searchRecords();
        System.assertEquals(3, Controller.accountsetController.getResultSize());
        
        Controller.BillingCity = 'Pune';
        Controller.searchRecords();
        System.assertEquals(2, Controller.accountsetController.getResultSize());
    }
    
    //test method to check the size of accounts retrieved when only billing State is specified
    @isTest
    private static void testsearchRecords_retrieveAccountsWithBillingStateSpecified_AccountsRetrieved()
    {
        AccountAddressFilterController Controller = new AccountAddressFilterController();
        
        Controller.BillingState = 'Rajasthan';
        Controller.searchRecords();
        System.assertEquals(4, Controller.accountsetController.getResultSize());
        
        Controller.BillingState = 'Maharashtra';
        Controller.searchRecords();
        System.assertEquals(2, Controller.accountsetController.getResultSize());
    }
    
    //test method to check the size of accounts retrieved when only billing Country is specified
    @isTest
    private static void testsearchRecords_retrieveAccountsWithBillingCountrySpecified_AccountsRetrieved()
    {
        AccountAddressFilterController Controller = new AccountAddressFilterController();
        
        Controller.BillingCountry = 'India';
        Controller.searchRecords();
        System.assertEquals(6, Controller.accountsetController.getResultSize());
    }
    
}
