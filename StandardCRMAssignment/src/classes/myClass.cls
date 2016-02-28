public class myClass{

    public String sortField {get;set;}
    public String myOrder {get;set;}
    public List<Contact> contacts{set;}
    public myClass(){
        // Default setting for the sorting
        sortField = 'FirstName';
        myOrder = 'DESC';
    }
    

    public List<Contact> getContacts(){

        String q = 'Select Id, FirstName, LastName From Contact ';
        q += ' Order by ' +  String.escapeSingleQuotes(sortField) + ' ' + myOrder + ' LIMIT 20';
        return Database.query(q);
    }
}