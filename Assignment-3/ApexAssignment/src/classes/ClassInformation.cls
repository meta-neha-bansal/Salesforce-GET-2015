public class ClassInformation {
    public static List<Student__C> getClassDetails(String id)
    {
        List<Student__c> students = [Select name From Student__c where class__r.id = :id];
        return students;
    }
    
    
    public static Map<Class__c,List<Student__c>> getListOfStudentId(){
        Map<Class__c,List<Student__c>> classMap;
      
        for(Class__c className: [SELECT Name,id FROM Class__c]){
            List<Student__c> students = [Select name From Student__c where class__r.id = :className.Id];
            classMap.put(className, students);
            
        }
        return classMap;
        
    }
    
    

}