@isTest
public class ClassInformationTest {
    
    @isTest
    static void testGetStudentsByClassId()
    {
        List<Student__c> expected = [Select name From Student__c where class__r.id = 'a08280000079BBy'];
        List<Student__C> ActualOutput = ClassInformation.getStudentsByClassId('a08280000079BBy');
        System.assertEquals(expected, ActualOutput);
    }
    
    @isTest
    static void NegativeTestGetStudentsByClassId()
    {
        List<Student__c> expected = [Select name From Student__c where class__r.id = 'a08280000079BB1'];
        List<Student__C> ActualOutput = new List<Student__C>();
        System.assertEquals(expected, ActualOutput);
        
    }
    
    @isTest
    static void TestGetStudentIdsByClass()
    {
        Map<Id, List<student__C>> expectedResult = new Map<Id, List<student__C>>();
        for(class__c parent : [select id,(select id from students__r) From class__c]) {
            expectedResult.put(parent.Id, parent.students__r);
        }
        Map<Id, List<student__C>> ActualResult = ClassInformation.getStudentIdsByClass();
        System.assertEquals(expectedResult, ActualResult);
    }
  

}