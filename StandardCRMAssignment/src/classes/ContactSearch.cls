public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailingPostalCost){
        List<Contact> result = [select ID,name from contact where (LastName = :lastName and MailingPostalCode = :mailingPostalCost)];
        return result;
        
    }

}