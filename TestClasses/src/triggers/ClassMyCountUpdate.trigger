/*
 * Name:ClassMyCountUpdate
 * Since:27-1-2015
 * Description:This trigger is to check for insertion or updation of any student.
 * During insertion and updation we have have update MyCount in class Accordingly.
 */ 

trigger ClassMyCountUpdate on Student__c (after insert, after delete) {
    
    List<Id> listOfClassId = new List<Id>();
    if(Trigger.isInsert){
        for(Student__C student : Trigger.NEW){
            listOfClassId.add(student.Class__c);
            
            List<class__c> classListToUpdate = [Select id,MyCount__C From class__c where id in : listOfClassId];
            for(Class__C classToUpdate : classListToUpdate){
                classToUpdate.MyCount__c += 1;
            }
            update(classListToUpdate);
        }
    }
    if(Trigger.isDelete){
        for(Student__C student : Trigger.OLD){
            listOfClassId.add(student.Class__c);
            List<class__c> classListToUpdate = [Select id,MyCount__C From class__c where id in : listOfClassId];
            for(Class__C classToUpdate : classListToUpdate){
                classToUpdate.MyCount__c -= 1;
            }
            update(classListToUpdate);
        }
    }
    
}