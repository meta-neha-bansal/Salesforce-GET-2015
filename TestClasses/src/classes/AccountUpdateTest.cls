@isTest
public class AccountUpdateTest {
    
    @testSetup
    public  static void setupmethod(){
        Account testAccount = new Account(name='test1') ;
        insert testAccount;
        
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0;i < 3;i++){
            
            Contact testContact = new Contact(AccountId=testAccount.Id,lastname='testing',firstname='testcontact');
            contacts.add(testContact);
            
        }
        insert contacts;
        
    }
    
    @isTest
    static void testUpdateRelatedContactIDs(){
        
        String expected = '';
        test.startTest();
        List<Contact> contacts = [Select id from contact];
        String testcontactId = contacts[0].id;
        for(Contact contact:contacts){
            if(!expected.equals('')){
                expected +=',';
            }
            expected +=contact.Id;
        }
        
        AccountUpdate.updateRelatedContactIDs(testcontactId);
        Account account = [Select id,ContactIDs__c FROM account WHERE name='test1'];
        system.assertEquals(expected,account.ContactIDs__c);
        Test.stopTest();
        
        
    }
    
    @isTest
    static void testUpdateRelatedContactIDsOne(){
        
        Test.startTest();
        Account account = [Select id,ContactIDs__c FROM account WHERE name='test1'];
        
        List<Contact> contacts = [Select id from contact where lastname='testing'];
        
        String testcontactId = contacts[0].id;
        AccountUpdate.updateRelatedContactIDs(testcontactId);
        
        Contact testContact = new Contact(AccountId=account.Id,lastname='testing',firstname='testcontact');
        insert testContact;
        String expected = '';
        
        AccountUpdate.updateRelatedContactIDs(testContact.Id);
        List<Contact> updatedcontacts = [Select id from contact where AccountId=:account.Id];
        
        for(Contact contact:updatedcontacts){
            if(!expected.equals('')){
                expected +=',';
            }
            expected +=contact.Id;
        }
        account = [Select id,ContactIDs__c FROM account WHERE name='test1'];
        system.assertEquals(expected, account.ContactIDs__c);
        Test.stopTest();
        
    }
    
    
}