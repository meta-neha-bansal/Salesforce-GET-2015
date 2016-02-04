public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String name){
        List<List< SObject>> searchList = [FIND :name IN NAME FIELDS RETURNING Lead(Name),Contact(FirstName,LastName)];
        
        Lead[] searchAccounts = (Lead[])searchList[0];
        Contact[] searchContacts = (Contact[])searchList[1];

        System.debug('Found the following accounts.');
        for (Lead a : searchAccounts) {
            System.debug(a.Name);
        }
        
        System.debug('Found the following contacts.');
        for (Contact c : searchContacts) {
            System.debug(c.LastName + ', ' + c.FirstName);
        }
        return searchList;
        
    }

}