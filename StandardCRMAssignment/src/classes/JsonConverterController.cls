/*
 * Name:JsonConverterController
 * Since:27-1-2016
 * Author:Neha Bansal
 * Description:It is used to show output as a JSON formatted string.
 */ 
public class JsonConverterController
{    
    public String text1 {get;set;}
      
    public JsonConverterController()
    {
         
    }    
    public void parseJson()
    {
        String soql = 'SELECT Name FROM Account LIMIT 5';
        List<Account> acct = Database.Query(soql); 
        text1 = JSON.serialize(acct);
    }    
}