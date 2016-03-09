/*
* Name: ClassInformation
* Description : This class is to retrieving information of students.
*/ 
public class ClassInformation {
    
    /*
    * Description: This function take classid as argument and returns all names of the 
    * students in that class as a list.
    */ 
    public static List<Student__C> getStudentsByClassId(String id)
    {
        List<Student__c> students = [Select name From Student__c where class__r.id = :id];
        return students;
    }
    
    /*
    * Description : This function returns a map where key is class and value is set of studentid in it.
    */ 
    public static Map<Id,List<Student__c>> getStudentIdsByClass(){
        
        Map<Id, List<student__C>> conMap = new Map<Id, List<student__C>>();
        for(class__c parent : [select id,(select id from students__r) From class__c]) {
            conMap.put(parent.Id, parent.students__r);
        }
        return conMap;
    }
    }