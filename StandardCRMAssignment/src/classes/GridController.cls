global class GridController {

    public GridController() {

    }
   
    @RemoteAction
    global static List<Contact> showContacts(String accName){
        system.debug('inside method: '+accName);
        accName = '%'+ accName+'%';
        List<Contact> lst_contacts = new List<Contact>([select id, name from contact where Account.Name LIKE : accName]);
        return lst_contacts;
    }
}