/*
 * Name:RestrictHindiTeacherEntry
 * Since:27-1-2015
 * Description:This Trigger is restricting any teacher to insert/update if that teacher is teaching Hindi.
 */ 
trigger RestrictHindiTeacherEntry on Contact (before insert,before update) {
   for(Contact contactObject : Trigger.new)
   {
       if(contactObject.Subjects__c != null && contactObject.Subjects__c.Contains('Hindi'))
       {
           contactObject.addError('Hindi teacher Not allowed.');
       }
   }
     
}