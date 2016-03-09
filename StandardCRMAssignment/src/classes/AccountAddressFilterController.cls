public class AccountAddressFilterController {
   public list <account> accountList {get;set;}  
   private Account account {get;set;}
   public string BillingCity {get;set;}
   public string BillingState {get;set;}
   public string BillingCountry {get;set;}
   public AccountAddressFilterController(ApexPages.StandardController stdController) {  
       
   }  
   public void search(){  
     string searchquery='select name,id from account where BillingCity like \'%'+BillingCity+'%\' AND BillingState like \'%'+BillingState+'%\' AND BillingCountry like \'%'+BillingCountry+'%\' Limit 20';  
     accountList= Database.query(searchquery);  
   }  
   public void clear(){  
   accountList.clear();  
   }  

}