@isTest
public class TestRestrictHindiTeacherEntry {
    public static Contact testContact;
    @testSetup
    public static void testSetup(){
        testContact = new Contact(lastname='testLame',firstname='testFname');
        insert testContact;
    }
    
    @isTest
    public static void testTrigger(){
        testContact = [Select lastname from Contact where lastname='testLame'];
        testContact.Subjects__c = 'Hindi';
        // Perform test
        Test.startTest();
        Database.SaveResult result = Database.update(testContact, False);
        Test.stopTest();
        
        // Verify if techer is being updated as subject hindi
        // In this case the updation should have been stopped by the trigger ,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Hindi teacher Not allowed.',
                             result.getErrors()[0].getMessage());
    }

}