trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
   List<Task> taskToUpdate = new List<Task>();
   
   for(Opportunity a : [SELECT Id,StageName FROM Opportunity WHERE Id IN :Trigger.New AND StageName ='Closed Won']) 
   {
           Task task = new Task();
           task.Subject = 'Follow Up Test Task';
           task.WhatId = a.Id;
           taskToUpdate.add(task);
      
       system.debug(a.StageName);
       
   }
       
     
       if (taskToUpdate.size() > 0) {
       insert taskToUpdate;
   }            
 
}