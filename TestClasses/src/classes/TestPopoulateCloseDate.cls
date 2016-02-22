@isTest
public class TestPopoulateCloseDate {
    public static Opportunity opportunity;
    @testSetup
    public static void testSetup(){
        Date myDate = Date.newInstance(1960, 2, 17);
        opportunity = new Opportunity(name = 'testOpportunity',CloseDate = myDate ,stageName = 'Qualification');
        insert opportunity;
    }
    @isTest
    public static void testTrigger_InsertNewStudent(){
        opportunity = [Select name from Opportunity where name = 'testOpportunity'];
        opportunity.StageName = 'Closed Won';
        Test.startTest();
        update(opportunity);
        Test.stopTest();
        opportunity = [Select name,CloseDate from Opportunity where name = 'testOpportunity'];
        System.assertEquals(Date.today(), opportunity.CloseDate);
    }

}