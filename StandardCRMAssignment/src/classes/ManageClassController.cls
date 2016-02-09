/*
 * Name:JsonConverterController
 * Since:27-1-2016
 * Author:Neha Bansal
 * Description:It is used to create VF Page that show list of available classes with Edit and Del Link. When will user click on
 * Edit a small Area displayed just below the same page with some fields (4-5 fields). User can save and return back to same Page.
 */ 
public with sharing class ManageClassController {

    public Class__c classToUpdate { get; private set; }
    public String idToUpdate {get;set;}
    public boolean displayPopup {get; set;} 
    
    String query = 'Select Id, Name, fee__c, board__c From Class__c ';
    
    public ManageClassController(ApexPages.StandardController controller) {
    }
    
    public void saveClass() {  
        update classToUpdate;
        displayPopup = false;    
    }  
    
    public void deleteClass() { 
        classToUpdate = [select id,name,fee__C from Class__c where id = :idToUpdate];
        delete classToUpdate;
    }  
    
    public void ShowDataToEdit() { 
        classToUpdate = [select id, name, fee__c,board__C from Class__c where id = :idToUpdate];
        displayPopup = true;    
    }   

    public List<Class__C> getfindClasses() 
    {
        return Database.query(query); 
    }  
}