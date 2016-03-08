/*
* Name:AccountAddressFilterController
* Since:27-1-2016
* Author:Neha Bansal
* Description:It is used to Filter accounts records on the basis of  billingcity,billingCountry and billingState.
*/  
public class AccountAddressFilterController {
    // For the city
    public string BillingCity{get;set;}
    // For the State
    public string BillingState{get;set;}
    // For the Country
    public string BillingCountry{get;set;}
    // To store the Account
    public boolean accountBlockPopup{get;set;}
    public boolean buttonBlockPopup{get;set;}
    
    public String query{get;set;}
    Integer noOfRecords = 5;
    Public Integer totalPages{get;set;}
    
    // instantiate the StandardSetController from a query locator
    public ApexPages.StandardSetController accountsetController {get;set;}
    
    public AccountAddressFilterController(){
        accountBlockPopup=false;
        buttonBlockPopup=false;
        totalPages = 0;
    }
    
    // instantiate list of account objects 
    public List<Account> accounts {
        get{return (List<Account>) accountsetController.getRecords();}set;
    }
    
    
    public void searchRecords(){
        accountBlockPopup =true;
        buttonBlockPopup=true;
        accounts= new list<Account>();
        
        // create query for retrieving desired output on the basis of user input for BillingCity, BillingState, BillingCountry
        query = 'SELECT id,name,billingcity,billingCountry,billingState FROM Account ';
        
        // checking for the input for BillingCity , BillingState , BillingCountry
        if(!string.isBlank(BillingCity)  || !string.isBlank(BillingState) || !string.isBlank(BillingCountry))  
        {
            query = query + 'Where ';
            if(!(string.isBlank(BillingCity)))
            {
                query = query + 'billingcity LIKE \'%'+BillingCity+'%\' AND ';
            }
            if(!(string.isBlank(BillingCountry)))
            {
                query = query + ' billingcountry  LIKE  \'%'+BillingCountry+'%\' AND ';
            }
            if(!(string.isBlank(BillingState)))
            {
                query = query +  ' billingstate LIKE  \'%'+BillingState+'%\' AND ';
            }
            query= query.substring(0,Query.length()-4);
        }
        
        accountsetController = new ApexPages.StandardSetController(Database.getQueryLocator(query));
        accountsetController.setPageSize(noOfRecords);
        totalPages = (accountsetController.getResultSize() / accountsetController.getPageSize());
        totalPages = Integer.valueOf(totalPages + ((Math.mod(accountsetController.getResultSize(), noOfRecords)>0) ? 1 : 0));
        
    }
    
}
