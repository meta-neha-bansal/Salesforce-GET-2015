@isTest
public class TestCheckMaxStudentLimitOfClass {
    public static Class__c testClass;
    @testSetup
    public static void testSetup(){
        Contact testTeacher = new Contact(lastname='teacherLName',firstname='TeacherFname');
        insert testTeacher;
        
        testClass = new Class__C(name='testClass',ClassTeacher__c=testTeacher.Id,MaxSize__c = 2);
        insert testClass;
        
        Student__C student1 = new Student__C(name='testStudent1', LastName__C='studentLName1', sex__C='Female',Class__c = testClass.Id);
        insert student1;
        Student__C student2 = new Student__C(name='testStudent2',LastName__C='studentLName2', sex__C='Female',Class__c = testClass.Id);
        insert student2;
    }
    @isTest
    public static void testTrigger(){
        testClass = [Select name from class__c where name='testClass'];
        Student__C student3 = new Student__C(name='testStudent3',LastName__C='studentLName3', sex__C='Female',Class__c = testClass.Id);
        
        
        // Perform test
        Test.startTest();
        Database.SaveResult result = Database.insert(student3, False);
        Test.stopTest();
        
        // Verify if techer is being updated as subject hindi
        // In this case the updation should have been stopped by the trigger ,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot insert more student. Class max size limit exceeded.',
                            result.getErrors()[0].getMessage());
        
    }
    
}