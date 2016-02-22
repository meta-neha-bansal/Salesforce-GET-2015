@isTest
public class TestClassMyCountUpdate {
    public static Class__c testClass;
    @testSetup
    public static void testSetup(){
        Contact testTeacher = new Contact(lastname='teacherLName',firstname='TeacherFname');
        insert testTeacher;
        
        testClass = new Class__C(name='testClass',ClassTeacher__c=testTeacher.Id,myCount__C=0);
        insert testClass;
        
    }
    @isTest
    public static void testTrigger_InsertNewStudent(){
        testClass = [Select name from class__c where name='testClass'];
        Student__C student = new Student__C(name='testStudent',LastName__C='studentLName3', sex__C='Female',Class__c = testClass.Id);
        // Perform test
        Test.startTest();
        insert(student);
        Test.stopTest();
        testClass = [Select myCount__c from class__c where name='testClass'];
        System.assertEquals(1, testClass.MyCount__c);
    }
    @isTest
    public static void testTrigger_DeleteStudent(){
        testClass = [Select name from class__c where name='testClass'];
        Student__C student = new Student__C(name='testStudent',LastName__C='studentLName3', sex__C='Female',Class__c = testClass.Id);
        insert student;
        // Perform test
        Test.startTest();
        delete(student);
        Test.stopTest();
        testClass = [Select myCount__c from class__c where name='testClass'];
        System.assertEquals(0, testClass.MyCount__c);
        
    }
    
    
}